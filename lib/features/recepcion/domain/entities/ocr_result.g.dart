// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ocr_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OcrResultImpl _$$OcrResultImplFromJson(Map<String, dynamic> json) =>
    _$OcrResultImpl(
      remitenteNombre: json['remitente_nombre'] as String?,
      remitenteTelefono: json['remitente_telefono'] as String?,
      destinatarioNombre: json['destinatario_nombre'] as String?,
      destinatarioTelefono: json['destinatario_telefono'] as String?,
      destinoCiudad: json['destino_ciudad'] as String?,
      confianza: (json['confianza'] as num).toInt(),
      textoCrudo: json['texto_crudo'] as String,
    );

Map<String, dynamic> _$$OcrResultImplToJson(_$OcrResultImpl instance) =>
    <String, dynamic>{
      'remitente_nombre': instance.remitenteNombre,
      'remitente_telefono': instance.remitenteTelefono,
      'destinatario_nombre': instance.destinatarioNombre,
      'destinatario_telefono': instance.destinatarioTelefono,
      'destino_ciudad': instance.destinoCiudad,
      'confianza': instance.confianza,
      'texto_crudo': instance.textoCrudo,
    };
