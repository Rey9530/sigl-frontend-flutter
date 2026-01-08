// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
  id: (json['id_usuario'] as num).toInt(),
  email: json['email'] as String,
  nombre: json['nombre'] as String,
  rol: json['rol'] as String,
  puntoId: (json['punto_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id_usuario': instance.id,
      'email': instance.email,
      'nombre': instance.nombre,
      'rol': instance.rol,
      'punto_id': instance.puntoId,
    };
