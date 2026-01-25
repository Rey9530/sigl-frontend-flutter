import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_client.dart';
import '../../domain/entities/recepcion_paquete.dart';
import '../../domain/entities/datos_vineta_extraidos.dart';

abstract class RecepcionRemoteDataSource {
  /// Crea una nueva recepcion enviando imagen + punto_servicio_id
  /// El backend genera automaticamente el codigo de rastreo de 6 caracteres
  Future<RecepcionPaquete> crearRecepcion(
    File imagen,
    int puntoServicioId, {
    String? notas,
  });

  /// Actualiza el costo de envio de una recepcion existente
  Future<RecepcionPaquete> actualizarCostoEnvio(
    int recepcionId,
    double costoEnvio,
  );

  /// Extrae datos de la viñeta usando OCR sin guardar en BD
  Future<DatosVinetaExtraidos> extraerDatosVineta(File imagen);

  /// Registra una recepción con datos verificados por el usuario
  Future<RecepcionPaquete> registrarRecepcionConfirmada(
    RegistrarRecepcionRequest request,
  );
}

class RecepcionRemoteDataSourceImpl implements RecepcionRemoteDataSource {
  final Dio _dio;

  RecepcionRemoteDataSourceImpl(this._dio);

  @override
  Future<RecepcionPaquete> crearRecepcion(
    File imagen,
    int puntoServicioId, {
    String? notas,
  }) async {
    final formData = FormData.fromMap({
      'imagen': await MultipartFile.fromFile(
        imagen.path,
        filename: 'vineta_${DateTime.now().millisecondsSinceEpoch}.jpg',
      ),
      'punto_servicio_id': puntoServicioId.toString(),
      if (notas != null && notas.isNotEmpty) 'notas': notas,
    });

    final response = await _dio.post(
      ApiConstants.recepciones,
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );

    return RecepcionPaquete.fromJson(response.data);
  }

  @override
  Future<RecepcionPaquete> actualizarCostoEnvio(
    int recepcionId,
    double costoEnvio,
  ) async {
    final response = await _dio.put(
      ApiConstants.recepcionDetalle(recepcionId),
      data: {'costo_envio': costoEnvio},
    );

    return RecepcionPaquete.fromJson(response.data);
  }

  @override
  Future<DatosVinetaExtraidos> extraerDatosVineta(File imagen) async {
    final formData = FormData.fromMap({
      'imagen': await MultipartFile.fromFile(
        imagen.path,
        filename: 'vineta_${DateTime.now().millisecondsSinceEpoch}.jpg',
      ),
    });

    final response = await _dio.post(
      ApiConstants.recepcionesExtraer,
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );

    return DatosVinetaExtraidos.fromJson(response.data);
  }

  @override
  Future<RecepcionPaquete> registrarRecepcionConfirmada(
    RegistrarRecepcionRequest request,
  ) async {
    final response = await _dio.post(
      ApiConstants.recepcionesRegistrar,
      data: request.toJson(),
    );

    return RecepcionPaquete.fromJson(response.data);
  }
}

final recepcionRemoteDataSourceProvider =
    Provider<RecepcionRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return RecepcionRemoteDataSourceImpl(dio);
});
