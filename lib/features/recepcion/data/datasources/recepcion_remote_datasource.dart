import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_client.dart';
import '../../domain/entities/paquete.dart';
import '../../domain/entities/ocr_result.dart';
import '../../domain/entities/punto.dart';

abstract class RecepcionRemoteDataSource {
  Future<OcrResult> procesarOcr(File imagen);
  Future<String> subirVineta(File imagen);
  Future<Paquete> crearPaquete(Map<String, dynamic> data);
  Future<List<Punto>> obtenerPuntosActivos();
}

class RecepcionRemoteDataSourceImpl implements RecepcionRemoteDataSource {
  final Dio _dio;

  RecepcionRemoteDataSourceImpl(this._dio);

  @override
  Future<OcrResult> procesarOcr(File imagen) async {
    final formData = FormData.fromMap({
      'imagen': await MultipartFile.fromFile(
        imagen.path,
        filename: 'vineta.jpg',
      ),
    });

    final response = await _dio.post(
      ApiConstants.paquetesOcr,
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );

    return OcrResult.fromJson(response.data);
  }

  @override
  Future<String> subirVineta(File imagen) async {
    final formData = FormData.fromMap({
      'imagen': await MultipartFile.fromFile(
        imagen.path,
        filename: 'vineta_${DateTime.now().millisecondsSinceEpoch}.jpg',
      ),
    });

    final response = await _dio.post(
      ApiConstants.paquetesUpload,
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );

    return response.data['url'] as String;
  }

  @override
  Future<Paquete> crearPaquete(Map<String, dynamic> data) async {
    final response = await _dio.post(
      ApiConstants.paquetes,
      data: data,
    );

    return Paquete.fromJson(response.data);
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
