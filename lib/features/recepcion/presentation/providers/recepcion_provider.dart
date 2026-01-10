import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/recepcion_repository_impl.dart';
import '../../domain/entities/punto.dart';
import 'recepcion_state.dart';

class RecepcionNotifier extends StateNotifier<RecepcionState> {
  final RecepcionRepository _repository;
  String? _imagenPath;
  List<Punto> _puntos = [];

  RecepcionNotifier(this._repository) : super(const RecepcionState.initial());

  /// Procesa una imagen con OCR
  Future<void> procesarImagenOcr(File imagen) async {
    _imagenPath = imagen.path;
    state = const RecepcionState.procesandoOcr();

    final result = await _repository.procesarOcr(imagen);

    result.fold(
      (failure) {
        state = RecepcionState.error(
          mensaje: failure.message,
          imagenPath: _imagenPath,
        );
      },
      (ocrResult) {
        state = RecepcionState.ocrCompletado(
          resultado: ocrResult,
          imagenPath: _imagenPath!,
        );
        // Cargar puntos automaticamente
        _cargarPuntos();
      },
    );
  }

  /// Carga la lista de puntos activos
  Future<void> _cargarPuntos() async {
    final currentState = state;
    if (currentState is! _OcrCompletado) return;

    state = const RecepcionState.cargandoPuntos();

    final result = await _repository.obtenerPuntosActivos();

    result.fold(
      (failure) {
        state = RecepcionState.error(
          mensaje: 'Error al cargar puntos: ${failure.message}',
          imagenPath: _imagenPath,
        );
      },
      (puntos) {
        _puntos = puntos;
        state = RecepcionState.validandoDatos(
          ocrResult: currentState.resultado,
          imagenPath: currentState.imagenPath,
          puntos: puntos,
        );
      },
    );
  }

  /// Crea un nuevo paquete con los datos validados
  Future<void> crearPaquete({
    required String remitenteNombre,
    required String remitenteTelefono,
    String? remitenteDui,
    required String destinatarioNombre,
    required String destinatarioTelefono,
    required int puntoOrigenId,
    required int puntoDestinoId,
    required double costoEnvio,
    double? valorPaquete,
    String? descripcion,
    String? notas,
  }) async {
    state = const RecepcionState.guardandoPaquete();

    // Primero subir la imagen si existe
    String? imagenUrl;
    if (_imagenPath != null) {
      final uploadResult = await _repository.subirVineta(File(_imagenPath!));
      uploadResult.fold(
        (failure) {
          // Continuar sin imagen si falla el upload
          imagenUrl = null;
        },
        (url) {
          imagenUrl = url;
        },
      );
    }

    // Crear el paquete
    final data = {
      'remitente_nombre': remitenteNombre,
      'remitente_telefono': remitenteTelefono,
      if (remitenteDui != null && remitenteDui.isNotEmpty)
        'remitente_dui': remitenteDui,
      'destinatario_nombre': destinatarioNombre,
      'destinatario_telefono': destinatarioTelefono,
      'punto_origen_id': puntoOrigenId,
      'punto_destino_id': puntoDestinoId,
      'costo_envio': costoEnvio,
      if (valorPaquete != null) 'valor_paquete': valorPaquete,
      if (descripcion != null && descripcion.isNotEmpty)
        'descripcion': descripcion,
      if (notas != null && notas.isNotEmpty) 'notas': notas,
      if (imagenUrl != null) 'imagen_vineta_url': imagenUrl,
    };

    final result = await _repository.crearPaquete(data);

    result.fold(
      (failure) {
        state = RecepcionState.error(
          mensaje: 'Error al crear paquete: ${failure.message}',
          imagenPath: _imagenPath,
        );
      },
      (paquete) {
        state = RecepcionState.paqueteCreado(paquete: paquete);
      },
    );
  }

  /// Reinicia el estado para una nueva recepcion
  void reiniciar() {
    _imagenPath = null;
    _puntos = [];
    state = const RecepcionState.initial();
  }

  /// Vuelve al estado de validacion desde error
  void volverAValidar() {
    if (_imagenPath != null && state.ocrResult != null && _puntos.isNotEmpty) {
      state = RecepcionState.validandoDatos(
        ocrResult: state.ocrResult!,
        imagenPath: _imagenPath!,
        puntos: _puntos,
      );
    } else {
      state = const RecepcionState.initial();
    }
  }
}

final recepcionProvider =
    StateNotifierProvider<RecepcionNotifier, RecepcionState>((ref) {
  final repository = ref.watch(recepcionRepositoryProvider);
  return RecepcionNotifier(repository);
});
