import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/user_model.dart'; // Import UserModelX

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
      final userModel = await remoteDataSource.login(email, password);
      // Aquí deberíamos tener acceso al token si el datasource lo devolviera,
      // pero por ahora asumimos que el datasource se encarga o que el token viene en otra parte.
      // NOTA: En AuthRemoteDataSourceImpl ajustamos para devolver UserModel.
      // Si necesitamos el token, AuthRemoteDataSource debería devolver un objeto LoginResponse.
      
      // Vamos a asumir que el token se maneja aparte o interceptado, 
      // pero lo correcto sería que login devuelva {token, user}.
      // Por ahora seguimos el plan original de retornar User.
      
      return Right(userModel.toEntity());
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return const Left(AuthFailure(message: 'Credenciales inválidas'));
      }
      return Left(ServerFailure(message: e.message ?? 'Error del servidor'));
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  const secureStorage = FlutterSecureStorage();
  return AuthRepositoryImpl(
    remoteDataSource: remoteDataSource,
    secureStorage: secureStorage,
  );
});
