import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/entrega_remote_datasource.dart';
import 'entrega_state.dart';

class EntregaNotifier extends StateNotifier<EntregaState> {
  final EntregaRemoteDataSource _dataSource;
  String? _imagenPath;

  EntregaNotifier(this._dataSource) : super(const EntregaInitial());

  /// Registra la entrega de un paquete
  /// Envia la imagen, extrae codigo por OCR y registra la entrega
  Future<void> registrarEntrega(
    File imagen, {
    String? codigoManual,
    String? notas,
    double? latitud,
    double? longitud,
  }) async {
    _imagenPath = imagen.path;
    state = const EntregaProcesando();

    try {
      final resultado = await _dataSource.registrarEntrega(
        imagen,
        codigoManual: codigoManual,
        notas: notas,
        latitud: latitud,
        longitud: longitud,
      );

      state = EntregaExitosa(
        resultado: resultado,
        imagenPath: _imagenPath!,
      );
    } on DioException catch (e) {
      _handleDioError(e);
    } catch (e) {
      state = EntregaError(
        mensaje: 'Error inesperado: ${e.toString()}',
        imagenPath: _imagenPath,
      );
    }
  }

  /// Reintenta el registro con codigo manual
  Future<void> reintentarConCodigoManual(String codigo) async {
    if (_imagenPath == null) {
      state = const EntregaError(mensaje: 'No hay imagen para procesar');
      return;
    }

    await registrarEntrega(
      File(_imagenPath!),
      codigoManual: codigo,
    );
  }

  /// Maneja errores de Dio basandose en el codigo de estado y mensaje
  void _handleDioError(DioException e) {
    final statusCode = e.response?.statusCode;
    final data = e.response?.data;
    String mensaje = 'Error de conexion';

    if (data is Map<String, dynamic>) {
      mensaje = data['message'] as String? ?? mensaje;
    }

    switch (statusCode) {
      case 400:
        // Verificar si es error de codigo no detectado
        if (mensaje.toLowerCase().contains('codigo de rastreo') ||
            mensaje.toLowerCase().contains('detectar')) {
          state = EntregaCodigoNoDetectado(
            imagenPath: _imagenPath!,
            mensajeOcr: mensaje,
          );
        } else {
          // Error de estado u otra validacion
          state = EntregaError(
            mensaje: mensaje,
            imagenPath: _imagenPath,
          );
        }
        break;

      case 404:
        // Paquete no encontrado
        state = EntregaPaqueteNoEncontrado(
          codigoBuscado: 'desconocido',
        );
        break;

      case 409:
        // Conflicto - paquete ya entregado
        state = EntregaConflicto(mensaje: mensaje);
        break;

      default:
        state = EntregaError(
          mensaje: mensaje,
          imagenPath: _imagenPath,
        );
    }
  }

  /// Reinicia el estado para una nueva entrega
  void reiniciar() {
    _imagenPath = null;
    state = const EntregaInitial();
  }
}

final entregaProvider =
    StateNotifierProvider<EntregaNotifier, EntregaState>((ref) {
  final dataSource = ref.watch(entregaRemoteDataSourceProvider);
  return EntregaNotifier(dataSource);
});
