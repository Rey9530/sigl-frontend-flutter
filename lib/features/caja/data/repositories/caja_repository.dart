import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/resumen_caja.dart';
import '../../domain/entities/registro_recaudacion.dart';
import '../datasources/caja_remote_datasource.dart';

abstract class CajaRepository {
  Future<Either<Failure, ResumenCaja>> obtenerMiTotal();
  Future<Either<Failure, List<RegistroRecaudacion>>> obtenerMisPendientes({
    int pagina = 1,
    int limite = 20,
  });
}

class CajaRepositoryImpl implements CajaRepository {
  final CajaRemoteDataSource _remoteDataSource;

  CajaRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, ResumenCaja>> obtenerMiTotal() async {
    try {
      final result = await _remoteDataSource.obtenerMiTotal();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RegistroRecaudacion>>> obtenerMisPendientes({
    int pagina = 1,
    int limite = 20,
  }) async {
    try {
      final result = await _remoteDataSource.obtenerMisPendientes(
        pagina: pagina,
        limite: limite,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
