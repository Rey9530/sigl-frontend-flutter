import 'package:freezed_annotation/freezed_annotation.dart';
import 'paquete.dart';

part 'recepcion_paquete.freezed.dart';
part 'recepcion_paquete.g.dart';

/// Estados posibles de una recepcion
enum EstadoRecepcion {
  @JsonValue('PENDIENTE_REVISION')
  pendienteRevision,
  @JsonValue('REVISION_PARCIAL')
  revisionParcial,
  @JsonValue('VALIDADO')
  validado,
  @JsonValue('CONVERTIDO')
  convertido,
  @JsonValue('DESCARTADO')
  descartado,
}

double? _stringToDoubleNullable(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}

int _stringToInt(dynamic value) {
  if (value == null) return 0; // Or handle nullable
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

/// Entidad que representa una recepcion de paquete con datos OCR
@freezed
class RecepcionPaquete with _$RecepcionPaquete {
  const RecepcionPaquete._();

  const factory RecepcionPaquete({
    @JsonKey(name: 'id_recepcion', fromJson: _stringToInt) required int id,
    @JsonKey(name: 'imagen_url') required String imagenUrl,
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
    required EstadoRecepcion estado,
    @JsonKey(name: 'notas_revision') String? notasRevision,
    @JsonKey(name: 'punto_servicio') required PuntoResumen puntoServicio,
    @JsonKey(name: 'usuario_recepcion') UsuarioResumen? usuarioRecepcion,
    PaqueteResumen? paquete,
    @JsonKey(name: 'creado_en') required DateTime creadoEn,
    @JsonKey(name: 'actualizado_en') DateTime? actualizadoEn,
    @JsonKey(name: 'convertido_en') DateTime? convertidoEn,
  }) = _RecepcionPaquete;

  factory RecepcionPaquete.fromJson(Map<String, dynamic> json) =>
      _$RecepcionPaqueteFromJson(json);

  /// Obtiene la confianza de un campo especifico
  int getConfianzaCampo(String campo) {
    return confianzaDetalle?[campo] ?? 0;
  }

  /// Indica si la confianza global es baja (<50%)
  bool get confianzaBaja => confianzaGlobal < 50;

  /// Indica si la confianza global es media (50-80%)
  bool get confianzaMedia => confianzaGlobal >= 50 && confianzaGlobal < 80;

  /// Indica si la confianza global es alta (>=80%)
  bool get confianzaAlta => confianzaGlobal >= 80;

  /// Indica si la recepcion puede ser editada
  bool get puedeEditar =>
      estado == EstadoRecepcion.pendienteRevision ||
      estado == EstadoRecepcion.revisionParcial;

  /// Indica si la recepcion puede ser convertida a paquete
  bool get puedeConvertir =>
      estado == EstadoRecepcion.pendienteRevision ||
      estado == EstadoRecepcion.revisionParcial ||
      estado == EstadoRecepcion.validado;
}

/// Resumen de usuario para mostrar en recepcion
@freezed
class UsuarioResumen with _$UsuarioResumen {
  const factory UsuarioResumen({
    @JsonKey(name: 'id_usuario', fromJson: _stringToInt) required int id,
    required String nombre,
  }) = _UsuarioResumen;

  factory UsuarioResumen.fromJson(Map<String, dynamic> json) =>
      _$UsuarioResumenFromJson(json);
}

/// Resumen de paquete creado desde recepcion
@freezed
class PaqueteResumen with _$PaqueteResumen {
  const factory PaqueteResumen({
    @JsonKey(name: 'id_paquete', fromJson: _stringToInt) required int id,
    @JsonKey(name: 'codigo_rastreo') required String codigoRastreo,
  }) = _PaqueteResumen;

  factory PaqueteResumen.fromJson(Map<String, dynamic> json) =>
      _$PaqueteResumenFromJson(json);
}
