import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/paquete.dart';
import '../../domain/entities/ocr_result.dart';
import '../../domain/entities/punto.dart';

part 'recepcion_state.freezed.dart';

@freezed
class RecepcionState with _$RecepcionState {
  const factory RecepcionState.initial() = _Initial;

  const factory RecepcionState.capturandoImagen() = _CapturandoImagen;

  const factory RecepcionState.procesandoOcr() = _ProcesandoOcr;

  const factory RecepcionState.ocrCompletado({
    required OcrResult resultado,
    required String imagenPath,
  }) = _OcrCompletado;

  const factory RecepcionState.cargandoPuntos() = _CargandoPuntos;

  const factory RecepcionState.validandoDatos({
    required OcrResult ocrResult,
    required String imagenPath,
    required List<Punto> puntos,
  }) = _ValidandoDatos;

  const factory RecepcionState.guardandoPaquete() = _GuardandoPaquete;

  const factory RecepcionState.paqueteCreado({
    required Paquete paquete,
  }) = _PaqueteCreado;

  const factory RecepcionState.error({
    required String mensaje,
    String? imagenPath,
  }) = _Error;
}

extension RecepcionStateX on RecepcionState {
  bool get isLoading => maybeWhen(
        procesandoOcr: () => true,
        cargandoPuntos: () => true,
        guardandoPaquete: () => true,
        orElse: () => false,
      );

  bool get hasError => maybeWhen(
        error: (_, __) => true,
        orElse: () => false,
      );

  String? get errorMessage => maybeWhen(
        error: (mensaje, _) => mensaje,
        orElse: () => null,
      );

  Paquete? get paquete => maybeWhen(
        paqueteCreado: (paquete) => paquete,
        orElse: () => null,
      );

  OcrResult? get ocrResult => maybeWhen(
        ocrCompletado: (resultado, _) => resultado,
        validandoDatos: (resultado, _, __) => resultado,
        orElse: () => null,
      );

  List<Punto>? get puntos => maybeWhen(
        validandoDatos: (_, __, puntos) => puntos,
        orElse: () => null,
      );
}
