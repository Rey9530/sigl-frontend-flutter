import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/recepcion_repository_impl.dart';

import 'recepcion_state.dart';

class RecepcionNotifier extends StateNotifier<RecepcionState> {
  final RecepcionRepository _repository;
  String? _imagenPath;

  RecepcionNotifier(this._repository) : super(const RecepcionState.initial());

  /// Crea una recepcion enviando imagen y punto de servicio
  /// El backend genera automaticamente el codigo de rastreo de 6 caracteres
  Future<void> crearRecepcion(
    File imagen,
    int puntoServicioId, {
    String? notas,
  }) async {
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
        state = RecepcionState.recepcionCreada(
          recepcion: recepcion,
          imagenPath: _imagenPath!,
        );
      },
    );
  }

  /// Actualiza el costo de envio de una recepcion
  Future<bool> actualizarCostoEnvio(
    int recepcionId,
    double costoEnvio,
  ) async {
    final result = await _repository.actualizarCostoEnvio(
      recepcionId,
      costoEnvio,
    );

    return result.fold(
      (failure) {
        return false;
      },
      (recepcionActualizada) {
        state = RecepcionState.recepcionCreada(
          recepcion: recepcionActualizada,
          imagenPath: _imagenPath ?? '',
        );
        return true;
      },
    );
  }

  /// Reinicia el estado para una nueva recepcion
  void reiniciar() {
    _imagenPath = null;

    state = const RecepcionState.initial();
  }
}

final recepcionProvider =
    StateNotifierProvider<RecepcionNotifier, RecepcionState>((ref) {
      final repository = ref.watch(recepcionRepositoryProvider);
      return RecepcionNotifier(repository);
    });
