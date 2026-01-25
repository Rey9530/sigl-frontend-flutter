import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final FlutterSecureStorage secureStorage;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.secureStorage,
  });

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final authResponse = await remoteDataSource.login(email, password);

      // Guardar token en secure storage
      await secureStorage.write(
        key: AppConstants.tokenKey,
        value: authResponse.accessToken,
      );

      // Guardar datos del usuario para persistencia
      await secureStorage.write(
        key: AppConstants.userKey,
        value: jsonEncode(authResponse.user.toJson()),
      );

      return Right(authResponse.user.toEntity());
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return const Left(AuthFailure(message: 'Credenciales inválidas'));
      }
      if (e.response?.statusCode == 422) {
        final message = e.response?.data['message'] ?? 'Error de validación';
        return Left(ValidationFailure(message: message));
      }
      return Left(ServerFailure(message: e.message ?? 'Error del servidor'));
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, User>> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final authResponse = await remoteDataSource.register(
        name: name,
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );

      // Guardar token en secure storage
      await secureStorage.write(
        key: AppConstants.tokenKey,
        value: authResponse.accessToken,
      );

      // Guardar datos del usuario para persistencia
      await secureStorage.write(
        key: AppConstants.userKey,
        value: jsonEncode(authResponse.user.toJson()),
      );

      return Right(authResponse.user.toEntity());
    } on DioException catch (e) {
      if (e.response?.statusCode == 422) {
        final data = e.response?.data;
        String message = 'Error de validación';
        if (data is Map && data['message'] != null) {
          message = data['message'];
        } else if (data is Map && data['errors'] != null) {
          final errors = data['errors'] as Map;
          message = errors.values.first is List
              ? (errors.values.first as List).first.toString()
              : errors.values.first.toString();
        }
        return Left(ValidationFailure(message: message));
      }
      if (e.response?.statusCode == 409) {
        return const Left(AuthFailure(message: 'El email ya está registrado'));
      }
      return Left(ServerFailure(message: e.message ?? 'Error del servidor'));
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      // Limpiar tokens del secure storage
      await secureStorage.delete(key: AppConstants.tokenKey);
      await secureStorage.delete(key: AppConstants.refreshTokenKey);
      await secureStorage.delete(key: AppConstants.userKey);

      return const Right(null);
    } catch (e) {
      return const Left(CacheFailure(message: 'Error al cerrar sesión'));
    }
  }

  @override
  Future<Either<Failure, User>> checkAuthStatus() async {
    try {
      final token = await secureStorage.read(key: AppConstants.tokenKey);

      if (token == null) {
        return const Left(AuthFailure(message: 'No hay sesión activa'));
      }

      // Validar token contra backend
      final userModel = await remoteDataSource.getProfile();

      // Actualizar datos del usuario en storage
      await secureStorage.write(
        key: AppConstants.userKey,
        value: jsonEncode(userModel.toJson()),
      );

      return Right(userModel.toEntity());
    } on DioException catch (e) {
      // Token inválido o expirado - limpiar storage
      if (e.response?.statusCode == 401) {
        await secureStorage.delete(key: AppConstants.tokenKey);
        await secureStorage.delete(key: AppConstants.userKey);
        return const Left(AuthFailure(message: 'Sesión expirada'));
      }
      return Left(ServerFailure(message: e.message ?? 'Error de conexión'));
    } catch (e) {
      return const Left(AuthFailure(message: 'Error al verificar sesión'));
    }
  }

  @override
  Future<Either<Failure, void>> updatePassword(
      String passwordActual, String passwordNueva) async {
    try {
      await remoteDataSource.updatePassword(passwordActual, passwordNueva);
      return const Right(null);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        final message =
            e.response?.data['message'] ?? 'La contraseña actual es incorrecta';
        return Left(ValidationFailure(message: message));
      }
      return Left(ServerFailure(message: e.message ?? 'Error del servidor'));
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, User>> updateProfile(String nombre) async {
    try {
      final userModel = await remoteDataSource.updateProfile(nombre);

      // Actualizar datos del usuario en storage
      await secureStorage.write(
        key: AppConstants.userKey,
        value: jsonEncode(userModel.toJson()),
      );

      return Right(userModel.toEntity());
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        final message = e.response?.data['message'] ?? 'Error de validación';
        return Left(ValidationFailure(message: message));
      }
      return Left(ServerFailure(message: e.message ?? 'Error del servidor'));
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  const secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );
  return AuthRepositoryImpl(
    remoteDataSource: remoteDataSource,
    secureStorage: secureStorage,
  );
});
