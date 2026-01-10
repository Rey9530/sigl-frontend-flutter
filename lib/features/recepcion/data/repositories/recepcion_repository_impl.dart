import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/paquete.dart';
import '../../domain/entities/recepcion_paquete.dart';
import '../../domain/entities/punto.dart';
import '../datasources/recepcion_remote_datasource.dart';

abstract class RecepcionRepository {
  /// Crea una recepcion con imagen y punto de servicio
  Future<Either<Failure, RecepcionPaquete>> crearRecepcion(
    File imagen,
    int puntoServicioId, {
    String? notas,
  });

  /// Actualiza campos de una recepcion
  Future<Either<Failure, RecepcionPaquete>> actualizarRecepcion(
    int id,
    Map<String, dynamic> data,
  );

  /// Valida manualmente una recepcion
  Future<Either<Failure, RecepcionPaquete>> validarRecepcion(int id);

  /// Convierte una recepcion en paquete
  Future<Either<Failure, Paquete>> convertirAPaquete(
    int id,
    Map<String, dynamic> data,
  );

  /// Descarta una recepcion
  Future<Either<Failure, RecepcionPaquete>> descartarRecepcion(
    int id,
    String motivo,
  );

  /// Obtiene una recepcion por ID
  Future<Either<Failure, RecepcionPaquete>> obtenerRecepcion(int id);

  /// Obtiene puntos de servicio activos
  Future<Either<Failure, List<Punto>>> obtenerPuntosActivos();
}

class RecepcionRepositoryImpl implements RecepcionRepository {
  final RecepcionRemoteDataSource _remoteDataSource;

  RecepcionRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, RecepcionPaquete>> crearRecepcion(
    File imagen,
    int puntoServicioId, {
    String? notas,
  }) async {
    try {
      final result = await _remoteDataSource.crearRecepcion(
        imagen,
        puntoServicioId,
        notas: notas,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: _extractErrorMessage(e)));
    }
  }

  @override
  Future<Either<Failure, RecepcionPaquete>> actualizarRecepcion(
    int id,
    Map<String, dynamic> data,
  ) async {
    try {
      final result = await _remoteDataSource.actualizarRecepcion(id, data);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: _extractErrorMessage(e)));
    }
  }

  @override
  Future<Either<Failure, RecepcionPaquete>> validarRecepcion(int id) async {
    try {
      final result = await _remoteDataSource.validarRecepcion(id);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: _extractErrorMessage(e)));
    }
  }

  @override
  Future<Either<Failure, Paquete>> convertirAPaquete(
    int id,
    Map<String, dynamic> data,
  ) async {
    try {
      final paquete = await _remoteDataSource.convertirAPaquete(id, data);
      return Right(paquete);
    } catch (e) {
      return Left(ServerFailure(message: _extractErrorMessage(e)));
    }
  }

  @override
  Future<Either<Failure, RecepcionPaquete>> descartarRecepcion(
    int id,
    String motivo,
  ) async {
    try {
      final result = await _remoteDataSource.descartarRecepcion(id, motivo);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: _extractErrorMessage(e)));
    }
  }

  @override
  Future<Either<Failure, RecepcionPaquete>> obtenerRecepcion(int id) async {
    try {
      final result = await _remoteDataSource.obtenerRecepcion(id);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: _extractErrorMessage(e)));
    }
  }

  @override
  Future<Either<Failure, List<Punto>>> obtenerPuntosActivos() async {
    try {
      final puntos = await _remoteDataSource.obtenerPuntosActivos();
      return Right(puntos);
    } catch (e) {
      return Left(ServerFailure(message: _extractErrorMessage(e)));
    }
  }

  String _extractErrorMessage(dynamic e) {
    if (e.toString().contains('message')) {
      final match = RegExp(r'"message":\s*"([^"]+)"').firstMatch(e.toString());
      if (match != null) {
        return match.group(1)!;
      }
    }
    return e.toString();
  }
}

final recepcionRepositoryProvider = Provider<RecepcionRepository>((ref) {
  final remoteDataSource = ref.watch(recepcionRemoteDataSourceProvider);
  return RecepcionRepositoryImpl(remoteDataSource);
});
