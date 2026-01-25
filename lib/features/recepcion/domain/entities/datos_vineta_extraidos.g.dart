// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datos_vineta_extraidos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DatosVinetaExtraidosImpl _$$DatosVinetaExtraidosImplFromJson(
  Map<String, dynamic> json,
) => _$DatosVinetaExtraidosImpl(
  imagenUrl: json['imagen_url'] as String,
  imagenObjectName: json['imagen_object_name'] as String,
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
  requiereMontoManual: json['requiere_monto_manual'] as bool,
  textoOcrCrudo: json['texto_ocr_crudo'] as String?,
);

Map<String, dynamic> _$$DatosVinetaExtraidosImplToJson(
  _$DatosVinetaExtraidosImpl instance,
) => <String, dynamic>{
  'imagen_url': instance.imagenUrl,
  'imagen_object_name': instance.imagenObjectName,
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
  'requiere_monto_manual': instance.requiereMontoManual,
  'texto_ocr_crudo': instance.textoOcrCrudo,
};

_$RegistrarRecepcionRequestImpl _$$RegistrarRecepcionRequestImplFromJson(
  Map<String, dynamic> json,
) => _$RegistrarRecepcionRequestImpl(
  imagenObjectName: json['imagen_object_name'] as String,
  puntoServicioId: (json['punto_servicio_id'] as num).toInt(),
  vendedor: json['vendedor'] as String?,
  cliente: json['cliente'] as String?,
  telefono: json['telefono'] as String?,
  diaEntrega: json['dia_entrega'] as String?,
  destino: json['destino'] as String?,
  encomendista: json['encomendista'] as String?,
  precioProducto: (json['precio_producto'] as num?)?.toDouble(),
  costoEnvio: (json['costo_envio'] as num).toDouble(),
  total: (json['total'] as num?)?.toDouble(),
  tipoCobroEnvio: $enumDecode(
    _$TipoCobroEnvioEnumMap,
    json['tipo_cobro_envio'],
  ),
  montoACobrarCliente: (json['monto_cobrar_cliente'] as num).toDouble(),
  montoParaVendedor: (json['monto_para_vendedor'] as num).toDouble(),
  notas: json['notas'] as String?,
);

Map<String, dynamic> _$$RegistrarRecepcionRequestImplToJson(
  _$RegistrarRecepcionRequestImpl instance,
) => <String, dynamic>{
  'imagen_object_name': instance.imagenObjectName,
  'punto_servicio_id': instance.puntoServicioId,
  'vendedor': instance.vendedor,
  'cliente': instance.cliente,
  'telefono': instance.telefono,
  'dia_entrega': instance.diaEntrega,
  'destino': instance.destino,
  'encomendista': instance.encomendista,
  'precio_producto': instance.precioProducto,
  'costo_envio': instance.costoEnvio,
  'total': instance.total,
  'tipo_cobro_envio': _$TipoCobroEnvioEnumMap[instance.tipoCobroEnvio]!,
  'monto_cobrar_cliente': instance.montoACobrarCliente,
  'monto_para_vendedor': instance.montoParaVendedor,
  'notas': instance.notas,
};

const _$TipoCobroEnvioEnumMap = {
  TipoCobroEnvio.clientePagaEnvio: 'CLIENTE_PAGA_ENVIO',
  TipoCobroEnvio.vendedorAbsorbeEnvio: 'VENDEDOR_ABSORBE_ENVIO',
};
