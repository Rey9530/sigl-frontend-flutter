// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recepcion_paquete.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecepcionPaqueteImpl _$$RecepcionPaqueteImplFromJson(
  Map<String, dynamic> json,
) => _$RecepcionPaqueteImpl(
  id: _stringToInt(json['id_recepcion']),
  codigoRastreo: json['codigo_rastreo'] as String,
  imagenUrl: json['imagen_url'] as String,
  vendedor: json['vendedor'] as String?,
  cliente: json['cliente'] as String?,
  telefono: json['telefono'] as String?,
  diaEntrega: json['dia_entrega'] as String?,
  destino: json['destino'] as String?,
  encomendista: json['encomendista'] as String?,
  precioProducto: _stringToDoubleNullable(json['precio_producto']),
  costoEnvio: _stringToDoubleNullable(json['costo_envio']),
  total: _stringToDoubleNullable(json['total']),
  confianzaGlobal: _stringToInt(json['confianza_global']),
  confianzaDetalle: _stringToIntMap(
    json['confianza_detalle'] as Map<String, dynamic>?,
  ),
  estado: $enumDecode(_$EstadoRecepcionEnumMap, json['estado']),
  notasRevision: json['notas_revision'] as String?,
  puntoServicio: PuntoResumen.fromJson(
    json['punto_servicio'] as Map<String, dynamic>,
  ),
  usuarioRecepcion: json['usuario_recepcion'] == null
      ? null
      : UsuarioResumen.fromJson(
          json['usuario_recepcion'] as Map<String, dynamic>,
        ),
  paquete: json['paquete'] == null
      ? null
      : PaqueteResumen.fromJson(json['paquete'] as Map<String, dynamic>),
  creadoEn: DateTime.parse(json['creado_en'] as String),
  actualizadoEn: json['actualizado_en'] == null
      ? null
      : DateTime.parse(json['actualizado_en'] as String),
  convertidoEn: json['convertido_en'] == null
      ? null
      : DateTime.parse(json['convertido_en'] as String),
);

Map<String, dynamic> _$$RecepcionPaqueteImplToJson(
  _$RecepcionPaqueteImpl instance,
) => <String, dynamic>{
  'id_recepcion': instance.id,
  'codigo_rastreo': instance.codigoRastreo,
  'imagen_url': instance.imagenUrl,
  'vendedor': instance.vendedor,
  'cliente': instance.cliente,
  'telefono': instance.telefono,
  'dia_entrega': instance.diaEntrega,
  'destino': instance.destino,
  'encomendista': instance.encomendista,
  'precio_producto': instance.precioProducto,
  'costo_envio': instance.costoEnvio,
  'total': instance.total,
  'confianza_global': instance.confianzaGlobal,
  'confianza_detalle': instance.confianzaDetalle,
  'estado': _$EstadoRecepcionEnumMap[instance.estado]!,
  'notas_revision': instance.notasRevision,
  'punto_servicio': instance.puntoServicio,
  'usuario_recepcion': instance.usuarioRecepcion,
  'paquete': instance.paquete,
  'creado_en': instance.creadoEn.toIso8601String(),
  'actualizado_en': instance.actualizadoEn?.toIso8601String(),
  'convertido_en': instance.convertidoEn?.toIso8601String(),
};

const _$EstadoRecepcionEnumMap = {
  EstadoRecepcion.pendienteRevision: 'PENDIENTE_REVISION',
  EstadoRecepcion.revisionParcial: 'REVISION_PARCIAL',
  EstadoRecepcion.validado: 'VALIDADO',
  EstadoRecepcion.convertido: 'CONVERTIDO',
  EstadoRecepcion.descartado: 'DESCARTADO',
};

_$UsuarioResumenImpl _$$UsuarioResumenImplFromJson(Map<String, dynamic> json) =>
    _$UsuarioResumenImpl(
      id: _stringToInt(json['id_usuario']),
      nombre: json['nombre'] as String,
    );

Map<String, dynamic> _$$UsuarioResumenImplToJson(
  _$UsuarioResumenImpl instance,
) => <String, dynamic>{'id_usuario': instance.id, 'nombre': instance.nombre};

_$PaqueteResumenImpl _$$PaqueteResumenImplFromJson(Map<String, dynamic> json) =>
    _$PaqueteResumenImpl(
      id: _stringToInt(json['id_paquete']),
      codigoRastreo: json['codigo_rastreo'] as String,
    );

Map<String, dynamic> _$$PaqueteResumenImplToJson(
  _$PaqueteResumenImpl instance,
) => <String, dynamic>{
  'id_paquete': instance.id,
  'codigo_rastreo': instance.codigoRastreo,
};
