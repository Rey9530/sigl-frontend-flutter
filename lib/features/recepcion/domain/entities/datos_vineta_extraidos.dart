import 'package:freezed_annotation/freezed_annotation.dart';
import 'tipo_cobro_envio.dart';

part 'datos_vineta_extraidos.freezed.dart';
part 'datos_vineta_extraidos.g.dart';

double? _stringToDoubleNullable(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}

int _stringToInt(dynamic value) {
  if (value == null) return 0;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value) ?? 0;
  return 0;
}

Map<String, int>? _stringToIntMap(Map<String, dynamic>? json) {
  if (json == null) return null;
  return json.map((k, v) {
    if (v is num) return MapEntry(k, v.toInt());
    if (v is String) return MapEntry(k, int.tryParse(v) ?? 0);
    return MapEntry(k, 0);
  });
}

/// Entidad que representa los datos extraídos de una viñeta por OCR
/// (sin registro en BD, para verificación del usuario)
@freezed
class DatosVinetaExtraidos with _$DatosVinetaExtraidos {
  const DatosVinetaExtraidos._();

  const factory DatosVinetaExtraidos({
    @JsonKey(name: 'imagen_url') required String imagenUrl,
    @JsonKey(name: 'imagen_object_name') required String imagenObjectName,
    String? vendedor,
    String? cliente,
    String? telefono,
    @JsonKey(name: 'dia_entrega') String? diaEntrega,
    String? destino,
    String? encomendista,
    @JsonKey(name: 'precio_producto', fromJson: _stringToDoubleNullable)
    double? precioProducto,
    @JsonKey(name: 'costo_envio', fromJson: _stringToDoubleNullable)
    double? costoEnvio,
    @JsonKey(fromJson: _stringToDoubleNullable) double? total,
    @JsonKey(name: 'confianza_global', fromJson: _stringToInt)
    required int confianzaGlobal,
    @JsonKey(name: 'confianza_detalle', fromJson: _stringToIntMap)
    Map<String, int>? confianzaDetalle,
    @JsonKey(name: 'requiere_monto_manual') required bool requiereMontoManual,
    @JsonKey(name: 'texto_ocr_crudo') String? textoOcrCrudo,
  }) = _DatosVinetaExtraidos;

  factory DatosVinetaExtraidos.fromJson(Map<String, dynamic> json) =>
      _$DatosVinetaExtraidosFromJson(json);

  /// Obtiene la confianza de un campo específico
  int getConfianzaCampo(String campo) {
    return confianzaDetalle?[campo] ?? 0;
  }

  /// Indica si la confianza global es baja (<50%)
  bool get confianzaBaja => confianzaGlobal < 50;

  /// Indica si la confianza global es media (50-80%)
  bool get confianzaMedia => confianzaGlobal >= 50 && confianzaGlobal < 80;

  /// Indica si la confianza global es alta (>=80%)
  bool get confianzaAlta => confianzaGlobal >= 80;
}

/// Request para registrar una recepción confirmada
@freezed
class RegistrarRecepcionRequest with _$RegistrarRecepcionRequest {
  const factory RegistrarRecepcionRequest({
    @JsonKey(name: 'imagen_object_name') required String imagenObjectName,
    @JsonKey(name: 'punto_servicio_id') required int puntoServicioId,
    String? vendedor,
    String? cliente,
    String? telefono,
    @JsonKey(name: 'dia_entrega') String? diaEntrega,
    String? destino,
    String? encomendista,
    @JsonKey(name: 'precio_producto') double? precioProducto,
    @JsonKey(name: 'costo_envio') required double costoEnvio,
    double? total,
    @JsonKey(name: 'tipo_cobro_envio') required TipoCobroEnvio tipoCobroEnvio,
    @JsonKey(name: 'monto_cobrar_cliente') required double montoACobrarCliente,
    @JsonKey(name: 'monto_para_vendedor') required double montoParaVendedor,
    String? notas,
  }) = _RegistrarRecepcionRequest;

  factory RegistrarRecepcionRequest.fromJson(Map<String, dynamic> json) =>
      _$RegistrarRecepcionRequestFromJson(json);
}
