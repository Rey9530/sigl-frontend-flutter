// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'punto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PuntoImpl _$$PuntoImplFromJson(Map<String, dynamic> json) => _$PuntoImpl(
  id: (json['id_punto'] as num).toInt(),
  nombre: json['nombre'] as String,
  codigo: json['codigo'] as String,
  ciudad: json['ciudad'] as String?,
  departamento: json['departamento'] as String?,
);

Map<String, dynamic> _$$PuntoImplToJson(_$PuntoImpl instance) =>
    <String, dynamic>{
      'id_punto': instance.id,
      'nombre': instance.nombre,
      'codigo': instance.codigo,
      'ciudad': instance.ciudad,
      'departamento': instance.departamento,
    };
