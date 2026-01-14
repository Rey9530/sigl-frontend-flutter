import 'package:dio/dio.dart';
import '../../../../core/constants/api_constants.dart';
import '../../domain/entities/resumen_caja.dart';
import '../../domain/entities/registro_recaudacion.dart';

abstract class CajaRemoteDataSource {
  Future<ResumenCaja> obtenerMiTotal();
  Future<List<RegistroRecaudacion>> obtenerMisPendientes({
    int pagina = 1,
    int limite = 20,
  });
}

class CajaRemoteDataSourceImpl implements CajaRemoteDataSource {
  final Dio _dio;

  CajaRemoteDataSourceImpl(this._dio);

  @override
  Future<ResumenCaja> obtenerMiTotal() async {
    try {
      final response = await _dio.get('${ApiConstants.baseUrl}/caja/mi-total');
      return ResumenCaja.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<List<RegistroRecaudacion>> obtenerMisPendientes({
    int pagina = 1,
    int limite = 20,
  }) async {
    try {
      final response = await _dio.get(
        '${ApiConstants.baseUrl}/caja/mis-pendientes',
        queryParameters: {
          'pagina': pagina,
          'limite': limite,
        },
      );

      final data = response.data['data'] as List<dynamic>;
      return data
          .map((json) => RegistroRecaudacion.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(DioException e) {
    if (e.response != null) {
      final data = e.response!.data;
      if (data is Map && data['message'] != null) {
        return Exception(data['message']);
      }
    }
    return Exception('Error de conexion: ${e.message}');
  }
}
