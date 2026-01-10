import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/recepcion_repository_impl.dart';
import '../../domain/entities/recepcion_paquete.dart';
import '../../domain/entities/punto.dart';
import 'recepcion_state.dart';

class RecepcionNotifier extends StateNotifier<RecepcionState> {
  final RecepcionRepository _repository;
  String? _imagenPath;
  RecepcionPaquete? _recepcionActual;
  List<Punto> _puntosDestino = [];

  RecepcionNotifier(this._repository) : super(const RecepcionState.initial());

  /// Crea una recepcion enviando imagen y punto de servicio
  Future<void> crearRecepcion(File imagen, int puntoServicioId, {String? notas}) async {
    _imagenPath = imagen.path;
    state = const RecepcionState.procesandoRecepcion();

    final result = await _repository.crearRecepcion(
      imagen,
      puntoServicioId,
      notas: notas,
    );

    result.fold(
      (failure) {
        state = RecepcionState.error(
          mensaje: failure.message,
          imagenPath: _imagenPath,
        );
      },
      (recepcion) {
        _recepcionActual = recepcion;
        state = RecepcionState.recepcionCreada(
          recepcion: recepcion,
          imagenPath: _imagenPath!,
        );
        // Cargar puntos de destino automaticamente
        _cargarPuntosDestino();
      },
    );
  }

  /// Carga los puntos de destino disponibles
  Future<void> _cargarPuntosDestino() async {
    final recepcion = _recepcionActual;
    final imagenPath = _imagenPath;

    if (recepcion == null || imagenPath == null) return;

    state = RecepcionState.cargandoPuntos(
      recepcion: recepcion,
      imagenPath: imagenPath,
    );

    final result = await _repository.obtenerPuntosActivos();

    result.fold(
      (failure) {
        state = RecepcionState.error(
          mensaje: 'Error al cargar puntos de destino: ${failure.message}',
          imagenPath: imagenPath,
          recepcion: recepcion,
        );
      },
      (puntos) {
        _puntosDestino = puntos;
        state = RecepcionState.validandoDatos(
          recepcion: recepcion,
          imagenPath: imagenPath,
          puntosDestino: puntos,
        );
      },
    );
  }

  /// Actualiza los campos de la recepcion
  Future<void> actualizarRecepcion(Map<String, dynamic> cambios) async {
    final recepcion = _recepcionActual;
    final imagenPath = _imagenPath;

    if (recepcion == null || imagenPath == null) return;

    state = RecepcionState.guardandoCambios(
      recepcion: recepcion,
      imagenPath: imagenPath,
      puntosDestino: _puntosDestino,
    );

    final result = await _repository.actualizarRecepcion(recepcion.id, cambios);

    result.fold(
      (failure) {
        state = RecepcionState.error(
          mensaje: 'Error al guardar cambios: ${failure.message}',
          imagenPath: imagenPath,
          recepcion: recepcion,
          puntosDestino: _puntosDestino,
        );
      },
      (recepcionActualizada) {
        _recepcionActual = recepcionActualizada;
        state = RecepcionState.validandoDatos(
          recepcion: recepcionActualizada,
          imagenPath: imagenPath,
          puntosDestino: _puntosDestino,
        );
      },
    );
  }

  /// Convierte la recepcion en un paquete
  Future<void> convertirAPaquete({
    required int puntoDestinoId,
    String? descripcion,
    String? notas,
    String? remitenteNombre,
    String? remitenteTelefono,
    String? destinatarioNombre,
    String? destinatarioTelefono,
    double? costoEnvio,
    double? valorPaquete,
  }) async {
    final recepcion = _recepcionActual;
    final imagenPath = _imagenPath;

    if (recepcion == null || imagenPath == null) return;

    state = RecepcionState.convirtiendoPaquete(
      recepcion: recepcion,
      imagenPath: imagenPath,
    );

    // Construir datos para conversion
    final data = <String, dynamic>{
      'punto_destino_id': puntoDestinoId,
      if (descripcion != null && descripcion.isNotEmpty) 'descripcion': descripcion,
      if (notas != null && notas.isNotEmpty) 'notas': notas,
      if (remitenteNombre != null && remitenteNombre.isNotEmpty)
        'remitente_nombre': remitenteNombre,
      if (remitenteTelefono != null && remitenteTelefono.isNotEmpty)
        'remitente_telefono': remitenteTelefono,
      if (destinatarioNombre != null && destinatarioNombre.isNotEmpty)
        'destinatario_nombre': destinatarioNombre,
      if (destinatarioTelefono != null && destinatarioTelefono.isNotEmpty)
        'destinatario_telefono': destinatarioTelefono,
      if (costoEnvio != null) 'costo_envio': costoEnvio,
      if (valorPaquete != null) 'valor_paquete': valorPaquete,
    };

    final result = await _repository.convertirAPaquete(recepcion.id, data);

    result.fold(
      (failure) {
        state = RecepcionState.error(
          mensaje: 'Error al crear paquete: ${failure.message}',
          imagenPath: imagenPath,
          recepcion: recepcion,
          puntosDestino: _puntosDestino,
        );
      },
      (paquete) {
        state = RecepcionState.paqueteCreado(paquete: paquete);
      },
    );
  }

  /// Descarta la recepcion actual
  Future<void> descartarRecepcion(String motivo) async {
    final recepcion = _recepcionActual;

    if (recepcion == null) return;

    state = RecepcionState.convirtiendoPaquete(
      recepcion: recepcion,
      imagenPath: _imagenPath ?? '',
    );

    final result = await _repository.descartarRecepcion(recepcion.id, motivo);

    result.fold(
      (failure) {
        state = RecepcionState.error(
          mensaje: 'Error al descartar: ${failure.message}',
          imagenPath: _imagenPath,
          recepcion: recepcion,
          puntosDestino: _puntosDestino,
        );
      },
      (_) {
        reiniciar();
      },
    );
  }

  /// Reinicia el estado para una nueva recepcion
  void reiniciar() {
    _imagenPath = null;
    _recepcionActual = null;
    _puntosDestino = [];
    state = const RecepcionState.initial();
  }

  /// Vuelve al estado de validacion desde error
  void volverAValidar() {
    if (_imagenPath != null &&
        _recepcionActual != null &&
        _puntosDestino.isNotEmpty) {
      state = RecepcionState.validandoDatos(
        recepcion: _recepcionActual!,
        imagenPath: _imagenPath!,
        puntosDestino: _puntosDestino,
      );
    } else {
      reiniciar();
    }
  }

  /// Intenta cargar puntos de nuevo
  void reintentar() {
    if (_recepcionActual != null && _imagenPath != null) {
      _cargarPuntosDestino();
    } else {
      reiniciar();
    }
  }
}

final recepcionProvider =
    StateNotifierProvider<RecepcionNotifier, RecepcionState>((ref) {
  final repository = ref.watch(recepcionRepositoryProvider);
  return RecepcionNotifier(repository);
});
