import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/recepcion_paquete.dart';
import '../../domain/entities/datos_vineta_extraidos.dart';
import '../datasources/recepcion_remote_datasource.dart';

abstract class RecepcionRepository {
  /// Crea una recepcion con imagen y punto de servicio
  /// El backend genera automaticamente el codigo de rastreo de 6 caracteres
  Future<Either<Failure, RecepcionPaquete>> crearRecepcion(
    File imagen,
    int puntoServicioId, {
    String? notas,
  });

  /// Actualiza el costo de envio de una recepcion existente
  Future<Either<Failure, RecepcionPaquete>> actualizarCostoEnvio(
    int recepcionId,
    double costoEnvio,
  );

  /// Extrae datos de la viñeta usando OCR sin guardar en BD
  Future<Either<Failure, DatosVinetaExtraidos>> extraerDatosVineta(
    File imagen,
  );

  /// Registra una recepción con datos verificados por el usuario
  Future<Either<Failure, RecepcionPaquete>> registrarRecepcionConfirmada(
    RegistrarRecepcionRequest request,
  );
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
  Future<Either<Failure, RecepcionPaquete>> actualizarCostoEnvio(
    int recepcionId,
    double costoEnvio,
  ) async {
    try {
      final result = await _remoteDataSource.actualizarCostoEnvio(
        recepcionId,
        costoEnvio,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: _extractErrorMessage(e)));
    }
  }

  @override
  Future<Either<Failure, DatosVinetaExtraidos>> extraerDatosVineta(
    File imagen,
  ) async {
    try {
      final result = await _remoteDataSource.extraerDatosVineta(imagen);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: _extractErrorMessage(e)));
    }
  }

  @override
  Future<Either<Failure, RecepcionPaquete>> registrarRecepcionConfirmada(
    RegistrarRecepcionRequest request,
  ) async {
    try {
      final result = await _remoteDataSource.registrarRecepcionConfirmada(
        request,
      );
      return Right(result);
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
