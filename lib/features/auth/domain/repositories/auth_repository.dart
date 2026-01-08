import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import 'user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login(String email, String password);
}
