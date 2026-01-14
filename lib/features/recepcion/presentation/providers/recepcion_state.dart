import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/recepcion_paquete.dart';

part 'recepcion_state.freezed.dart';

@freezed
class RecepcionState with _$RecepcionState {
  /// Estado inicial
  const factory RecepcionState.initial() = _Initial;

  /// Capturando imagen de vineta
  const factory RecepcionState.capturandoImagen() = _CapturandoImagen;

  /// Enviando imagen al servidor (subida + OCR)
  const factory RecepcionState.procesandoRecepcion() = _ProcesandoRecepcion;

  /// Recepcion creada exitosamente, mostrando datos OCR y codigo de rastreo
  const factory RecepcionState.recepcionCreada({
    required RecepcionPaquete recepcion,
    required String imagenPath,
  }) = _RecepcionCreada;

  /// Error durante el proceso
  const factory RecepcionState.error({
    required String mensaje,
    String? imagenPath,
  }) = _Error;
}

extension RecepcionStateX on RecepcionState {
  /// Indica si esta en un estado de carga
  bool get isLoading => maybeWhen(
    procesandoRecepcion: () => true,
    orElse: () => false,
  );

  /// Indica si hay error
  bool get hasError =>
      maybeWhen(error: (_, _) => true, orElse: () => false);

  /// Mensaje de error actual
  String? get errorMessage =>
      maybeWhen(error: (mensaje, _) => mensaje, orElse: () => null);

  /// Recepcion actual
  RecepcionPaquete? get recepcion => maybeWhen(
    recepcionCreada: (recepcion, _) => recepcion,
    orElse: () => null,
  );

  /// Path de la imagen capturada
  String? get imagenPath => maybeWhen(
    recepcionCreada: (_, imagenPath) => imagenPath,
    error: (_, imagenPath) => imagenPath,
    orElse: () => null,
  );
}
