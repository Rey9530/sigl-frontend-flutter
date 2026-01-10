import 'package:freezed_annotation/freezed_annotation.dart';

part 'ocr_result.freezed.dart';
part 'ocr_result.g.dart';

@freezed
class OcrResult with _$OcrResult {
  const factory OcrResult({
    @JsonKey(name: 'remitente_nombre') String? remitenteNombre,
    @JsonKey(name: 'remitente_telefono') String? remitenteTelefono,
    @JsonKey(name: 'destinatario_nombre') String? destinatarioNombre,
    @JsonKey(name: 'destinatario_telefono') String? destinatarioTelefono,
    @JsonKey(name: 'destino_ciudad') String? destinoCiudad,
    required int confianza,
    @JsonKey(name: 'texto_crudo') required String textoCrudo,
  }) = _OcrResult;

  factory OcrResult.fromJson(Map<String, dynamic> json) =>
      _$OcrResultFromJson(json);
}
