import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/recepcion_paquete.dart';
import '../../domain/entities/datos_vineta_extraidos.dart';

part 'recepcion_state.freezed.dart';

@freezed
class RecepcionState with _$RecepcionState {
  /// Estado inicial
  const factory RecepcionState.initial() = _Initial;

  /// Capturando imagen de vineta
  const factory RecepcionState.capturandoImagen() = _CapturandoImagen;

  /// Enviando imagen al servidor para extracción OCR (fase 1)
  const factory RecepcionState.extrayendoDatos() = _ExtrayendoDatos;

  /// Datos extraídos exitosamente, esperando verificación del usuario (fase 2)
  const factory RecepcionState.datosExtraidos({
    required DatosVinetaExtraidos datos,
    required String imagenPath,
  }) = _DatosExtraidos;

  /// Usuario confirmó datos, preguntando por cobro (fase 3)
  const factory RecepcionState.confirmandoCobro({
    required DatosVinetaExtraidos datos,
    required String imagenPath,
    required double costoEnvioConfirmado,
  }) = _ConfirmandoCobro;

  /// Registrando recepción en BD (fase 4)
  const factory RecepcionState.registrandoRecepcion() = _RegistrandoRecepcion;

  /// Recepcion creada exitosamente (fase final)
  const factory RecepcionState.recepcionCreada({
    required RecepcionPaquete recepcion,
    required String imagenPath,
  }) = _RecepcionCreada;

  // ============================================
  // Estados legacy (mantener compatibilidad)
  // ============================================

  /// Enviando imagen al servidor (subida + OCR) - flujo antiguo
  const factory RecepcionState.procesandoRecepcion() = _ProcesandoRecepcion;

  /// Error durante el proceso
  const factory RecepcionState.error({
    required String mensaje,
    String? imagenPath,
  }) = _Error;
}

extension RecepcionStateX on RecepcionState {
  /// Indica si está en un estado de carga
  bool get isLoading => maybeWhen(
        extrayendoDatos: () => true,
        registrandoRecepcion: () => true,
        procesandoRecepcion: () => true,
        orElse: () => false,
      );

  /// Indica si hay error
  bool get hasError =>
      maybeWhen(error: (_, __) => true, orElse: () => false);

  /// Mensaje de error actual
  String? get errorMessage =>
      maybeWhen(error: (mensaje, _) => mensaje, orElse: () => null);

  /// Recepcion actual
  RecepcionPaquete? get recepcion => maybeWhen(
        recepcionCreada: (recepcion, _) => recepcion,
        orElse: () => null,
      );

  /// Datos extraídos actuales
  DatosVinetaExtraidos? get datosExtraidosActuales => maybeWhen(
        datosExtraidos: (datos, _) => datos,
        confirmandoCobro: (datos, _, __) => datos,
        orElse: () => null,
      );

  /// Path de la imagen capturada
  String? get imagenPath => maybeWhen(
        datosExtraidos: (_, imagenPath) => imagenPath,
        confirmandoCobro: (_, imagenPath, __) => imagenPath,
        recepcionCreada: (_, imagenPath) => imagenPath,
        error: (_, imagenPath) => imagenPath,
        orElse: () => null,
      );

  /// Indica si está en el flujo de verificación (después de OCR, antes de registro)
  bool get enVerificacion => maybeWhen(
        datosExtraidos: (_, __) => true,
        confirmandoCobro: (_, __, ___) => true,
        orElse: () => false,
      );
}
