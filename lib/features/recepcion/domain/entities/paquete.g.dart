// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paquete.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaqueteImpl _$$PaqueteImplFromJson(Map<String, dynamic> json) =>
    _$PaqueteImpl(
      id: (json['id_paquete'] as num?)?.toInt(),
      codigoRastreo: json['codigo_rastreo'] as String,
      remitenteNombre: json['remitente_nombre'] as String,
      remitenteTelefono: json['remitente_telefono'] as String,
      remitenteDui: json['remitente_dui'] as String?,
      destinatarioNombre: json['destinatario_nombre'] as String,
      destinatarioTelefono: json['destinatario_telefono'] as String,
      puntoOrigenId: (json['punto_origen_id'] as num).toInt(),
      puntoDestinoId: (json['punto_destino_id'] as num).toInt(),
      costoEnvio: (json['costo_envio'] as num).toDouble(),
      valorPaquete: (json['valor_paquete'] as num?)?.toDouble(),
      estadoActual: json['estado_actual'] as String?,
      imagenVinetaUrl: json['imagen_vineta_url'] as String?,
      descripcion: json['descripcion'] as String?,
      notas: json['notas'] as String?,
      creadoEn: json['creado_en'] == null
          ? null
          : DateTime.parse(json['creado_en'] as String),
      puntoOrigen: json['punto_origen'] == null
          ? null
          : PuntoResumen.fromJson(json['punto_origen'] as Map<String, dynamic>),
      puntoDestino: json['punto_destino'] == null
          ? null
          : PuntoResumen.fromJson(
              json['punto_destino'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$PaqueteImplToJson(_$PaqueteImpl instance) =>
    <String, dynamic>{
      'id_paquete': instance.id,
      'codigo_rastreo': instance.codigoRastreo,
      'remitente_nombre': instance.remitenteNombre,
      'remitente_telefono': instance.remitenteTelefono,
      'remitente_dui': instance.remitenteDui,
      'destinatario_nombre': instance.destinatarioNombre,
      'destinatario_telefono': instance.destinatarioTelefono,
      'punto_origen_id': instance.puntoOrigenId,
      'punto_destino_id': instance.puntoDestinoId,
      'costo_envio': instance.costoEnvio,
      'valor_paquete': instance.valorPaquete,
      'estado_actual': instance.estadoActual,
      'imagen_vineta_url': instance.imagenVinetaUrl,
      'descripcion': instance.descripcion,
      'notas': instance.notas,
      'creado_en': instance.creadoEn?.toIso8601String(),
      'punto_origen': instance.puntoOrigen,
      'punto_destino': instance.puntoDestino,
    };

_$PuntoResumenImpl _$$PuntoResumenImplFromJson(Map<String, dynamic> json) =>
    _$PuntoResumenImpl(
      id: (json['id_punto'] as num).toInt(),
      nombre: json['nombre'] as String,
      codigo: json['codigo'] as String,
      ciudad: json['ciudad'] as String?,
    );

Map<String, dynamic> _$$PuntoResumenImplToJson(_$PuntoResumenImpl instance) =>
    <String, dynamic>{
      'id_punto': instance.id,
      'nombre': instance.nombre,
      'codigo': instance.codigo,
      'ciudad': instance.ciudad,
    };
