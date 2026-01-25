import 'package:dartz/dartz.dart';
import 'package:frontend_flutter/features/auth/domain/entities/user.dart';
import '../../../../core/errors/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login(String email, String password);

  Future<Either<Failure, User>> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  });

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, User>> checkAuthStatus();

  Future<Either<Failure, void>> updatePassword(
      String passwordActual, String passwordNueva);

  Future<Either<Failure, User>> updateProfile(String nombre);
}
