// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: (json['id_usuario'] as num).toInt(),
      email: json['email'] as String,
      nombre: json['nombre'] as String,
      rol: json['rol'] as String,
      puntoId: (json['punto_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id_usuario': instance.id,
      'email': instance.email,
      'nombre': instance.nombre,
      'rol': instance.rol,
      'punto_id': instance.puntoId,
    };
