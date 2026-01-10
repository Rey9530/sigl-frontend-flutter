import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/paquete.dart';
import '../../domain/entities/ocr_result.dart';
import '../../domain/entities/punto.dart';
import '../datasources/recepcion_remote_datasource.dart';

abstract class RecepcionRepository {
  Future<Either<Failure, OcrResult>> procesarOcr(File imagen);
  Future<Either<Failure, String>> subirVineta(File imagen);
  Future<Either<Failure, Paquete>> crearPaquete(Map<String, dynamic> data);
  Future<Either<Failure, List<Punto>>> obtenerPuntosActivos();
}

class RecepcionRepositoryImpl implements RecepcionRepository {
  final RecepcionRemoteDataSource _remoteDataSource;

  RecepcionRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, OcrResult>> procesarOcr(File imagen) async {
    try {
      final result = await _remoteDataSource.procesarOcr(imagen);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> subirVineta(File imagen) async {
    try {
      final url = await _remoteDataSource.subirVineta(imagen);
      return Right(url);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Paquete>> crearPaquete(Map<String, dynamic> data) async {
    try {
      final paquete = await _remoteDataSource.crearPaquete(data);
      return Right(paquete);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Punto>>> obtenerPuntosActivos() async {
    try {
      final puntos = await _remoteDataSource.obtenerPuntosActivos();
      return Right(puntos);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

final recepcionRepositoryProvider = Provider<RecepcionRepository>((ref) {
  final remoteDataSource = ref.watch(recepcionRemoteDataSourceProvider);
  return RecepcionRepositoryImpl(remoteDataSource);
});
