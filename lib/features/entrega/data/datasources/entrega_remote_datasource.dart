import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_client.dart';
import '../../domain/entities/entrega_result.dart';

abstract class EntregaRemoteDataSource {
  /// Registra la entrega de un paquete
  /// Envia imagen de la vineta, extrae codigo por OCR y registra la entrega
  Future<EntregaResult> registrarEntrega(
    File imagen, {
    String? codigoManual,
    String? notas,
    double? latitud,
    double? longitud,
  });
}

class EntregaRemoteDataSourceImpl implements EntregaRemoteDataSource {
  final Dio _dio;

  EntregaRemoteDataSourceImpl(this._dio);

  @override
  Future<EntregaResult> registrarEntrega(
    File imagen, {
    String? codigoManual,
    String? notas,
    double? latitud,
    double? longitud,
  }) async {
    final formData = FormData.fromMap({
      'imagen': await MultipartFile.fromFile(
        imagen.path,
        filename: 'entrega_${DateTime.now().millisecondsSinceEpoch}.jpg',
      ),
      if (codigoManual != null && codigoManual.isNotEmpty)
        'codigo_manual': codigoManual,
      if (notas != null && notas.isNotEmpty) 'notas': notas,
      if (latitud != null) 'latitud': latitud.toString(),
      if (longitud != null) 'longitud': longitud.toString(),
    });

    final response = await _dio.post(
      ApiConstants.entregas,
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );

    return EntregaResult.fromJson(response.data);
  }
}

final entregaRemoteDataSourceProvider =
    Provider<EntregaRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return EntregaRemoteDataSourceImpl(dio);
});
