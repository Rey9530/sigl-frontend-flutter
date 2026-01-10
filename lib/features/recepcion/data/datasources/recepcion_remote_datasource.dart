import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_client.dart';
import '../../domain/entities/paquete.dart';
import '../../domain/entities/recepcion_paquete.dart';
import '../../domain/entities/punto.dart';

abstract class RecepcionRemoteDataSource {
  /// Crea una nueva recepcion enviando imagen + punto_servicio_id
  Future<RecepcionPaquete> crearRecepcion(
    File imagen,
    int puntoServicioId, {
    String? notas,
  });

  /// Actualiza campos de una recepcion existente
  Future<RecepcionPaquete> actualizarRecepcion(
    int id,
    Map<String, dynamic> data,
  );

  /// Valida manualmente una recepcion (marca como VALIDADO)
  Future<RecepcionPaquete> validarRecepcion(int id);

  /// Convierte una recepcion en un paquete
  Future<Paquete> convertirAPaquete(int id, Map<String, dynamic> data);

  /// Descarta una recepcion
  Future<RecepcionPaquete> descartarRecepcion(int id, String motivo);

  /// Obtiene una recepcion por ID
  Future<RecepcionPaquete> obtenerRecepcion(int id);

  /// Obtiene puntos de servicio activos
  Future<List<Punto>> obtenerPuntosActivos();
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
  Future<RecepcionPaquete> actualizarRecepcion(
    int id,
    Map<String, dynamic> data,
  ) async {
    final response = await _dio.put(
      '${ApiConstants.recepciones}/$id',
      data: data,
    );

    return RecepcionPaquete.fromJson(response.data);
  }

  @override
  Future<RecepcionPaquete> validarRecepcion(int id) async {
    final response = await _dio.patch(
      '${ApiConstants.recepciones}/$id/validar',
    );

    return RecepcionPaquete.fromJson(response.data);
  }

  @override
  Future<Paquete> convertirAPaquete(int id, Map<String, dynamic> data) async {
    final response = await _dio.post(
      '${ApiConstants.recepciones}/$id/convertir',
      data: data,
    );

    return Paquete.fromJson(response.data);
  }

  @override
  Future<RecepcionPaquete> descartarRecepcion(int id, String motivo) async {
    final response = await _dio.delete(
      '${ApiConstants.recepciones}/$id',
      data: {'motivo': motivo},
    );

    return RecepcionPaquete.fromJson(response.data);
  }

  @override
  Future<RecepcionPaquete> obtenerRecepcion(int id) async {
    final response = await _dio.get('${ApiConstants.recepciones}/$id');

    return RecepcionPaquete.fromJson(response.data);
  }

  @override
  Future<List<Punto>> obtenerPuntosActivos() async {
    final response = await _dio.get(ApiConstants.puntosActivos);

    return (response.data as List)
        .map((json) => Punto.fromJson(json))
        .toList();
  }
}

final recepcionRemoteDataSourceProvider =
    Provider<RecepcionRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return RecepcionRemoteDataSourceImpl(dio);
});
