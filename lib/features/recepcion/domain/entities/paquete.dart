import 'package:freezed_annotation/freezed_annotation.dart';

part 'paquete.freezed.dart';
part 'paquete.g.dart';

@freezed
class Paquete with _$Paquete {
  const factory Paquete({
    @JsonKey(name: 'id_paquete') int? id,
    @JsonKey(name: 'codigo_rastreo') required String codigoRastreo,
    @JsonKey(name: 'remitente_nombre') required String remitenteNombre,
    @JsonKey(name: 'remitente_telefono') required String remitenteTelefono,
    @JsonKey(name: 'remitente_dui') String? remitenteDui,
    @JsonKey(name: 'destinatario_nombre') required String destinatarioNombre,
    @JsonKey(name: 'destinatario_telefono') required String destinatarioTelefono,
    @JsonKey(name: 'punto_origen_id') required int puntoOrigenId,
    @JsonKey(name: 'punto_destino_id') required int puntoDestinoId,
    @JsonKey(name: 'costo_envio') required double costoEnvio,
    @JsonKey(name: 'valor_paquete') double? valorPaquete,
    @JsonKey(name: 'estado_actual') String? estadoActual,
    @JsonKey(name: 'imagen_vineta_url') String? imagenVinetaUrl,
    String? descripcion,
    String? notas,
    @JsonKey(name: 'creado_en') DateTime? creadoEn,
    @JsonKey(name: 'punto_origen') PuntoResumen? puntoOrigen,
    @JsonKey(name: 'punto_destino') PuntoResumen? puntoDestino,
  }) = _Paquete;

  factory Paquete.fromJson(Map<String, dynamic> json) => _$PaqueteFromJson(json);
}

@freezed
class PuntoResumen with _$PuntoResumen {
  const factory PuntoResumen({
    @JsonKey(name: 'id_punto') required int id,
    required String nombre,
    required String codigo,
    String? ciudad,
  }) = _PuntoResumen;

  factory PuntoResumen.fromJson(Map<String, dynamic> json) =>
      _$PuntoResumenFromJson(json);
}
