import 'package:freezed_annotation/freezed_annotation.dart';

part 'paquete.freezed.dart';
part 'paquete.g.dart';

double _stringToDouble(dynamic value) {
  if (value == null) return 0.0;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0.0;
  return 0.0;
}

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

@freezed
class Paquete with _$Paquete {
  const factory Paquete({
    @JsonKey(name: 'id_paquete', fromJson: _stringToInt) int? id,
    @JsonKey(name: 'codigo_rastreo') required String codigoRastreo,
    @JsonKey(name: 'remitente_nombre') required String remitenteNombre,
    @JsonKey(name: 'remitente_telefono') required String remitenteTelefono,
    @JsonKey(name: 'remitente_dui') String? remitenteDui,
    @JsonKey(name: 'destinatario_nombre') required String destinatarioNombre,
    @JsonKey(name: 'destinatario_telefono')
    required String destinatarioTelefono,
    @JsonKey(name: 'punto_origen_id', fromJson: _stringToInt)
    required int puntoOrigenId,
    @JsonKey(name: 'punto_destino_id', fromJson: _stringToInt)
    required int puntoDestinoId,
    @JsonKey(name: 'costo_envio', fromJson: _stringToDouble)
    required double costoEnvio,
    @JsonKey(name: 'valor_paquete', fromJson: _stringToDoubleNullable)
    double? valorPaquete,
    @JsonKey(name: 'estado_actual') String? estadoActual,
    @JsonKey(name: 'imagen_vineta_url') String? imagenVinetaUrl,
    String? descripcion,
    String? notas,
    @JsonKey(name: 'creado_en') DateTime? creadoEn,
    @JsonKey(name: 'punto_origen') PuntoResumen? puntoOrigen,
    @JsonKey(name: 'punto_destino') PuntoResumen? puntoDestino,
  }) = _Paquete;

  factory Paquete.fromJson(Map<String, dynamic> json) =>
      _$PaqueteFromJson(json);
}

@freezed
class PuntoResumen with _$PuntoResumen {
  const factory PuntoResumen({
    @JsonKey(name: 'id_punto', fromJson: _stringToInt) required int id,
    required String nombre,
    required String codigo,
    String? ciudad,
  }) = _PuntoResumen;

  factory PuntoResumen.fromJson(Map<String, dynamic> json) =>
      _$PuntoResumenFromJson(json);
}
