// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paquete.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Paquete _$PaqueteFromJson(Map<String, dynamic> json) {
  return _Paquete.fromJson(json);
}

/// @nodoc
mixin _$Paquete {
  @JsonKey(name: 'id_paquete')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'codigo_rastreo')
  String get codigoRastreo => throw _privateConstructorUsedError;
  @JsonKey(name: 'remitente_nombre')
  String get remitenteNombre => throw _privateConstructorUsedError;
  @JsonKey(name: 'remitente_telefono')
  String get remitenteTelefono => throw _privateConstructorUsedError;
  @JsonKey(name: 'remitente_dui')
  String? get remitenteDui => throw _privateConstructorUsedError;
  @JsonKey(name: 'destinatario_nombre')
  String get destinatarioNombre => throw _privateConstructorUsedError;
  @JsonKey(name: 'destinatario_telefono')
  String get destinatarioTelefono => throw _privateConstructorUsedError;
  @JsonKey(name: 'punto_origen_id')
  int get puntoOrigenId => throw _privateConstructorUsedError;
  @JsonKey(name: 'punto_destino_id')
  int get puntoDestinoId => throw _privateConstructorUsedError;
  @JsonKey(name: 'costo_envio')
  double get costoEnvio => throw _privateConstructorUsedError;
  @JsonKey(name: 'valor_paquete')
  double? get valorPaquete => throw _privateConstructorUsedError;
  @JsonKey(name: 'estado_actual')
  String? get estadoActual => throw _privateConstructorUsedError;
  @JsonKey(name: 'imagen_vineta_url')
  String? get imagenVinetaUrl => throw _privateConstructorUsedError;
  String? get descripcion => throw _privateConstructorUsedError;
  String? get notas => throw _privateConstructorUsedError;
  @JsonKey(name: 'creado_en')
  DateTime? get creadoEn => throw _privateConstructorUsedError;
  @JsonKey(name: 'punto_origen')
  PuntoResumen? get puntoOrigen => throw _privateConstructorUsedError;
  @JsonKey(name: 'punto_destino')
  PuntoResumen? get puntoDestino => throw _privateConstructorUsedError;

  /// Serializes this Paquete to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Paquete
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaqueteCopyWith<Paquete> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaqueteCopyWith<$Res> {
  factory $PaqueteCopyWith(Paquete value, $Res Function(Paquete) then) =
      _$PaqueteCopyWithImpl<$Res, Paquete>;
  @useResult
  $Res call({
    @JsonKey(name: 'id_paquete') int? id,
    @JsonKey(name: 'codigo_rastreo') String codigoRastreo,
    @JsonKey(name: 'remitente_nombre') String remitenteNombre,
    @JsonKey(name: 'remitente_telefono') String remitenteTelefono,
    @JsonKey(name: 'remitente_dui') String? remitenteDui,
    @JsonKey(name: 'destinatario_nombre') String destinatarioNombre,
    @JsonKey(name: 'destinatario_telefono') String destinatarioTelefono,
    @JsonKey(name: 'punto_origen_id') int puntoOrigenId,
    @JsonKey(name: 'punto_destino_id') int puntoDestinoId,
    @JsonKey(name: 'costo_envio') double costoEnvio,
    @JsonKey(name: 'valor_paquete') double? valorPaquete,
    @JsonKey(name: 'estado_actual') String? estadoActual,
    @JsonKey(name: 'imagen_vineta_url') String? imagenVinetaUrl,
    String? descripcion,
    String? notas,
    @JsonKey(name: 'creado_en') DateTime? creadoEn,
    @JsonKey(name: 'punto_origen') PuntoResumen? puntoOrigen,
    @JsonKey(name: 'punto_destino') PuntoResumen? puntoDestino,
  });

  $PuntoResumenCopyWith<$Res>? get puntoOrigen;
  $PuntoResumenCopyWith<$Res>? get puntoDestino;
}

/// @nodoc
class _$PaqueteCopyWithImpl<$Res, $Val extends Paquete>
    implements $PaqueteCopyWith<$Res> {
  _$PaqueteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Paquete
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? codigoRastreo = null,
    Object? remitenteNombre = null,
    Object? remitenteTelefono = null,
    Object? remitenteDui = freezed,
    Object? destinatarioNombre = null,
    Object? destinatarioTelefono = null,
    Object? puntoOrigenId = null,
    Object? puntoDestinoId = null,
    Object? costoEnvio = null,
    Object? valorPaquete = freezed,
    Object? estadoActual = freezed,
    Object? imagenVinetaUrl = freezed,
    Object? descripcion = freezed,
    Object? notas = freezed,
    Object? creadoEn = freezed,
    Object? puntoOrigen = freezed,
    Object? puntoDestino = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            codigoRastreo: null == codigoRastreo
                ? _value.codigoRastreo
                : codigoRastreo // ignore: cast_nullable_to_non_nullable
                      as String,
            remitenteNombre: null == remitenteNombre
                ? _value.remitenteNombre
                : remitenteNombre // ignore: cast_nullable_to_non_nullable
                      as String,
            remitenteTelefono: null == remitenteTelefono
                ? _value.remitenteTelefono
                : remitenteTelefono // ignore: cast_nullable_to_non_nullable
                      as String,
            remitenteDui: freezed == remitenteDui
                ? _value.remitenteDui
                : remitenteDui // ignore: cast_nullable_to_non_nullable
                      as String?,
            destinatarioNombre: null == destinatarioNombre
                ? _value.destinatarioNombre
                : destinatarioNombre // ignore: cast_nullable_to_non_nullable
                      as String,
            destinatarioTelefono: null == destinatarioTelefono
                ? _value.destinatarioTelefono
                : destinatarioTelefono // ignore: cast_nullable_to_non_nullable
                      as String,
            puntoOrigenId: null == puntoOrigenId
                ? _value.puntoOrigenId
                : puntoOrigenId // ignore: cast_nullable_to_non_nullable
                      as int,
            puntoDestinoId: null == puntoDestinoId
                ? _value.puntoDestinoId
                : puntoDestinoId // ignore: cast_nullable_to_non_nullable
                      as int,
            costoEnvio: null == costoEnvio
                ? _value.costoEnvio
                : costoEnvio // ignore: cast_nullable_to_non_nullable
                      as double,
            valorPaquete: freezed == valorPaquete
                ? _value.valorPaquete
                : valorPaquete // ignore: cast_nullable_to_non_nullable
                      as double?,
            estadoActual: freezed == estadoActual
                ? _value.estadoActual
                : estadoActual // ignore: cast_nullable_to_non_nullable
                      as String?,
            imagenVinetaUrl: freezed == imagenVinetaUrl
                ? _value.imagenVinetaUrl
                : imagenVinetaUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            descripcion: freezed == descripcion
                ? _value.descripcion
                : descripcion // ignore: cast_nullable_to_non_nullable
                      as String?,
            notas: freezed == notas
                ? _value.notas
                : notas // ignore: cast_nullable_to_non_nullable
                      as String?,
            creadoEn: freezed == creadoEn
                ? _value.creadoEn
                : creadoEn // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            puntoOrigen: freezed == puntoOrigen
                ? _value.puntoOrigen
                : puntoOrigen // ignore: cast_nullable_to_non_nullable
                      as PuntoResumen?,
            puntoDestino: freezed == puntoDestino
                ? _value.puntoDestino
                : puntoDestino // ignore: cast_nullable_to_non_nullable
                      as PuntoResumen?,
          )
          as $Val,
    );
  }

  /// Create a copy of Paquete
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PuntoResumenCopyWith<$Res>? get puntoOrigen {
    if (_value.puntoOrigen == null) {
      return null;
    }

    return $PuntoResumenCopyWith<$Res>(_value.puntoOrigen!, (value) {
      return _then(_value.copyWith(puntoOrigen: value) as $Val);
    });
  }

  /// Create a copy of Paquete
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PuntoResumenCopyWith<$Res>? get puntoDestino {
    if (_value.puntoDestino == null) {
      return null;
    }

    return $PuntoResumenCopyWith<$Res>(_value.puntoDestino!, (value) {
      return _then(_value.copyWith(puntoDestino: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaqueteImplCopyWith<$Res> implements $PaqueteCopyWith<$Res> {
  factory _$$PaqueteImplCopyWith(
    _$PaqueteImpl value,
    $Res Function(_$PaqueteImpl) then,
  ) = __$$PaqueteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'id_paquete') int? id,
    @JsonKey(name: 'codigo_rastreo') String codigoRastreo,
    @JsonKey(name: 'remitente_nombre') String remitenteNombre,
    @JsonKey(name: 'remitente_telefono') String remitenteTelefono,
    @JsonKey(name: 'remitente_dui') String? remitenteDui,
    @JsonKey(name: 'destinatario_nombre') String destinatarioNombre,
    @JsonKey(name: 'destinatario_telefono') String destinatarioTelefono,
    @JsonKey(name: 'punto_origen_id') int puntoOrigenId,
    @JsonKey(name: 'punto_destino_id') int puntoDestinoId,
    @JsonKey(name: 'costo_envio') double costoEnvio,
    @JsonKey(name: 'valor_paquete') double? valorPaquete,
    @JsonKey(name: 'estado_actual') String? estadoActual,
    @JsonKey(name: 'imagen_vineta_url') String? imagenVinetaUrl,
    String? descripcion,
    String? notas,
    @JsonKey(name: 'creado_en') DateTime? creadoEn,
    @JsonKey(name: 'punto_origen') PuntoResumen? puntoOrigen,
    @JsonKey(name: 'punto_destino') PuntoResumen? puntoDestino,
  });

  @override
  $PuntoResumenCopyWith<$Res>? get puntoOrigen;
  @override
  $PuntoResumenCopyWith<$Res>? get puntoDestino;
}

/// @nodoc
class __$$PaqueteImplCopyWithImpl<$Res>
    extends _$PaqueteCopyWithImpl<$Res, _$PaqueteImpl>
    implements _$$PaqueteImplCopyWith<$Res> {
  __$$PaqueteImplCopyWithImpl(
    _$PaqueteImpl _value,
    $Res Function(_$PaqueteImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Paquete
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? codigoRastreo = null,
    Object? remitenteNombre = null,
    Object? remitenteTelefono = null,
    Object? remitenteDui = freezed,
    Object? destinatarioNombre = null,
    Object? destinatarioTelefono = null,
    Object? puntoOrigenId = null,
    Object? puntoDestinoId = null,
    Object? costoEnvio = null,
    Object? valorPaquete = freezed,
    Object? estadoActual = freezed,
    Object? imagenVinetaUrl = freezed,
    Object? descripcion = freezed,
    Object? notas = freezed,
    Object? creadoEn = freezed,
    Object? puntoOrigen = freezed,
    Object? puntoDestino = freezed,
  }) {
    return _then(
      _$PaqueteImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        codigoRastreo: null == codigoRastreo
            ? _value.codigoRastreo
            : codigoRastreo // ignore: cast_nullable_to_non_nullable
                  as String,
        remitenteNombre: null == remitenteNombre
            ? _value.remitenteNombre
            : remitenteNombre // ignore: cast_nullable_to_non_nullable
                  as String,
        remitenteTelefono: null == remitenteTelefono
            ? _value.remitenteTelefono
            : remitenteTelefono // ignore: cast_nullable_to_non_nullable
                  as String,
        remitenteDui: freezed == remitenteDui
            ? _value.remitenteDui
            : remitenteDui // ignore: cast_nullable_to_non_nullable
                  as String?,
        destinatarioNombre: null == destinatarioNombre
            ? _value.destinatarioNombre
            : destinatarioNombre // ignore: cast_nullable_to_non_nullable
                  as String,
        destinatarioTelefono: null == destinatarioTelefono
            ? _value.destinatarioTelefono
            : destinatarioTelefono // ignore: cast_nullable_to_non_nullable
                  as String,
        puntoOrigenId: null == puntoOrigenId
            ? _value.puntoOrigenId
            : puntoOrigenId // ignore: cast_nullable_to_non_nullable
                  as int,
        puntoDestinoId: null == puntoDestinoId
            ? _value.puntoDestinoId
            : puntoDestinoId // ignore: cast_nullable_to_non_nullable
                  as int,
        costoEnvio: null == costoEnvio
            ? _value.costoEnvio
            : costoEnvio // ignore: cast_nullable_to_non_nullable
                  as double,
        valorPaquete: freezed == valorPaquete
            ? _value.valorPaquete
            : valorPaquete // ignore: cast_nullable_to_non_nullable
                  as double?,
        estadoActual: freezed == estadoActual
            ? _value.estadoActual
            : estadoActual // ignore: cast_nullable_to_non_nullable
                  as String?,
        imagenVinetaUrl: freezed == imagenVinetaUrl
            ? _value.imagenVinetaUrl
            : imagenVinetaUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        descripcion: freezed == descripcion
            ? _value.descripcion
            : descripcion // ignore: cast_nullable_to_non_nullable
                  as String?,
        notas: freezed == notas
            ? _value.notas
            : notas // ignore: cast_nullable_to_non_nullable
                  as String?,
        creadoEn: freezed == creadoEn
            ? _value.creadoEn
            : creadoEn // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        puntoOrigen: freezed == puntoOrigen
            ? _value.puntoOrigen
            : puntoOrigen // ignore: cast_nullable_to_non_nullable
                  as PuntoResumen?,
        puntoDestino: freezed == puntoDestino
            ? _value.puntoDestino
            : puntoDestino // ignore: cast_nullable_to_non_nullable
                  as PuntoResumen?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaqueteImpl implements _Paquete {
  const _$PaqueteImpl({
    @JsonKey(name: 'id_paquete') this.id,
    @JsonKey(name: 'codigo_rastreo') required this.codigoRastreo,
    @JsonKey(name: 'remitente_nombre') required this.remitenteNombre,
    @JsonKey(name: 'remitente_telefono') required this.remitenteTelefono,
    @JsonKey(name: 'remitente_dui') this.remitenteDui,
    @JsonKey(name: 'destinatario_nombre') required this.destinatarioNombre,
    @JsonKey(name: 'destinatario_telefono') required this.destinatarioTelefono,
    @JsonKey(name: 'punto_origen_id') required this.puntoOrigenId,
    @JsonKey(name: 'punto_destino_id') required this.puntoDestinoId,
    @JsonKey(name: 'costo_envio') required this.costoEnvio,
    @JsonKey(name: 'valor_paquete') this.valorPaquete,
    @JsonKey(name: 'estado_actual') this.estadoActual,
    @JsonKey(name: 'imagen_vineta_url') this.imagenVinetaUrl,
    this.descripcion,
    this.notas,
    @JsonKey(name: 'creado_en') this.creadoEn,
    @JsonKey(name: 'punto_origen') this.puntoOrigen,
    @JsonKey(name: 'punto_destino') this.puntoDestino,
  });

  factory _$PaqueteImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaqueteImplFromJson(json);

  @override
  @JsonKey(name: 'id_paquete')
  final int? id;
  @override
  @JsonKey(name: 'codigo_rastreo')
  final String codigoRastreo;
  @override
  @JsonKey(name: 'remitente_nombre')
  final String remitenteNombre;
  @override
  @JsonKey(name: 'remitente_telefono')
  final String remitenteTelefono;
  @override
  @JsonKey(name: 'remitente_dui')
  final String? remitenteDui;
  @override
  @JsonKey(name: 'destinatario_nombre')
  final String destinatarioNombre;
  @override
  @JsonKey(name: 'destinatario_telefono')
  final String destinatarioTelefono;
  @override
  @JsonKey(name: 'punto_origen_id')
  final int puntoOrigenId;
  @override
  @JsonKey(name: 'punto_destino_id')
  final int puntoDestinoId;
  @override
  @JsonKey(name: 'costo_envio')
  final double costoEnvio;
  @override
  @JsonKey(name: 'valor_paquete')
  final double? valorPaquete;
  @override
  @JsonKey(name: 'estado_actual')
  final String? estadoActual;
  @override
  @JsonKey(name: 'imagen_vineta_url')
  final String? imagenVinetaUrl;
  @override
  final String? descripcion;
  @override
  final String? notas;
  @override
  @JsonKey(name: 'creado_en')
  final DateTime? creadoEn;
  @override
  @JsonKey(name: 'punto_origen')
  final PuntoResumen? puntoOrigen;
  @override
  @JsonKey(name: 'punto_destino')
  final PuntoResumen? puntoDestino;

  @override
  String toString() {
    return 'Paquete(id: $id, codigoRastreo: $codigoRastreo, remitenteNombre: $remitenteNombre, remitenteTelefono: $remitenteTelefono, remitenteDui: $remitenteDui, destinatarioNombre: $destinatarioNombre, destinatarioTelefono: $destinatarioTelefono, puntoOrigenId: $puntoOrigenId, puntoDestinoId: $puntoDestinoId, costoEnvio: $costoEnvio, valorPaquete: $valorPaquete, estadoActual: $estadoActual, imagenVinetaUrl: $imagenVinetaUrl, descripcion: $descripcion, notas: $notas, creadoEn: $creadoEn, puntoOrigen: $puntoOrigen, puntoDestino: $puntoDestino)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaqueteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.codigoRastreo, codigoRastreo) ||
                other.codigoRastreo == codigoRastreo) &&
            (identical(other.remitenteNombre, remitenteNombre) ||
                other.remitenteNombre == remitenteNombre) &&
            (identical(other.remitenteTelefono, remitenteTelefono) ||
                other.remitenteTelefono == remitenteTelefono) &&
            (identical(other.remitenteDui, remitenteDui) ||
                other.remitenteDui == remitenteDui) &&
            (identical(other.destinatarioNombre, destinatarioNombre) ||
                other.destinatarioNombre == destinatarioNombre) &&
            (identical(other.destinatarioTelefono, destinatarioTelefono) ||
                other.destinatarioTelefono == destinatarioTelefono) &&
            (identical(other.puntoOrigenId, puntoOrigenId) ||
                other.puntoOrigenId == puntoOrigenId) &&
            (identical(other.puntoDestinoId, puntoDestinoId) ||
                other.puntoDestinoId == puntoDestinoId) &&
            (identical(other.costoEnvio, costoEnvio) ||
                other.costoEnvio == costoEnvio) &&
            (identical(other.valorPaquete, valorPaquete) ||
                other.valorPaquete == valorPaquete) &&
            (identical(other.estadoActual, estadoActual) ||
                other.estadoActual == estadoActual) &&
            (identical(other.imagenVinetaUrl, imagenVinetaUrl) ||
                other.imagenVinetaUrl == imagenVinetaUrl) &&
            (identical(other.descripcion, descripcion) ||
                other.descripcion == descripcion) &&
            (identical(other.notas, notas) || other.notas == notas) &&
            (identical(other.creadoEn, creadoEn) ||
                other.creadoEn == creadoEn) &&
            (identical(other.puntoOrigen, puntoOrigen) ||
                other.puntoOrigen == puntoOrigen) &&
            (identical(other.puntoDestino, puntoDestino) ||
                other.puntoDestino == puntoDestino));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    codigoRastreo,
    remitenteNombre,
    remitenteTelefono,
    remitenteDui,
    destinatarioNombre,
    destinatarioTelefono,
    puntoOrigenId,
    puntoDestinoId,
    costoEnvio,
    valorPaquete,
    estadoActual,
    imagenVinetaUrl,
    descripcion,
    notas,
    creadoEn,
    puntoOrigen,
    puntoDestino,
  );

  /// Create a copy of Paquete
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaqueteImplCopyWith<_$PaqueteImpl> get copyWith =>
      __$$PaqueteImplCopyWithImpl<_$PaqueteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaqueteImplToJson(this);
  }
}

abstract class _Paquete implements Paquete {
  const factory _Paquete({
    @JsonKey(name: 'id_paquete') final int? id,
    @JsonKey(name: 'codigo_rastreo') required final String codigoRastreo,
    @JsonKey(name: 'remitente_nombre') required final String remitenteNombre,
    @JsonKey(name: 'remitente_telefono')
    required final String remitenteTelefono,
    @JsonKey(name: 'remitente_dui') final String? remitenteDui,
    @JsonKey(name: 'destinatario_nombre')
    required final String destinatarioNombre,
    @JsonKey(name: 'destinatario_telefono')
    required final String destinatarioTelefono,
    @JsonKey(name: 'punto_origen_id') required final int puntoOrigenId,
    @JsonKey(name: 'punto_destino_id') required final int puntoDestinoId,
    @JsonKey(name: 'costo_envio') required final double costoEnvio,
    @JsonKey(name: 'valor_paquete') final double? valorPaquete,
    @JsonKey(name: 'estado_actual') final String? estadoActual,
    @JsonKey(name: 'imagen_vineta_url') final String? imagenVinetaUrl,
    final String? descripcion,
    final String? notas,
    @JsonKey(name: 'creado_en') final DateTime? creadoEn,
    @JsonKey(name: 'punto_origen') final PuntoResumen? puntoOrigen,
    @JsonKey(name: 'punto_destino') final PuntoResumen? puntoDestino,
  }) = _$PaqueteImpl;

  factory _Paquete.fromJson(Map<String, dynamic> json) = _$PaqueteImpl.fromJson;

  @override
  @JsonKey(name: 'id_paquete')
  int? get id;
  @override
  @JsonKey(name: 'codigo_rastreo')
  String get codigoRastreo;
  @override
  @JsonKey(name: 'remitente_nombre')
  String get remitenteNombre;
  @override
  @JsonKey(name: 'remitente_telefono')
  String get remitenteTelefono;
  @override
  @JsonKey(name: 'remitente_dui')
  String? get remitenteDui;
  @override
  @JsonKey(name: 'destinatario_nombre')
  String get destinatarioNombre;
  @override
  @JsonKey(name: 'destinatario_telefono')
  String get destinatarioTelefono;
  @override
  @JsonKey(name: 'punto_origen_id')
  int get puntoOrigenId;
  @override
  @JsonKey(name: 'punto_destino_id')
  int get puntoDestinoId;
  @override
  @JsonKey(name: 'costo_envio')
  double get costoEnvio;
  @override
  @JsonKey(name: 'valor_paquete')
  double? get valorPaquete;
  @override
  @JsonKey(name: 'estado_actual')
  String? get estadoActual;
  @override
  @JsonKey(name: 'imagen_vineta_url')
  String? get imagenVinetaUrl;
  @override
  String? get descripcion;
  @override
  String? get notas;
  @override
  @JsonKey(name: 'creado_en')
  DateTime? get creadoEn;
  @override
  @JsonKey(name: 'punto_origen')
  PuntoResumen? get puntoOrigen;
  @override
  @JsonKey(name: 'punto_destino')
  PuntoResumen? get puntoDestino;

  /// Create a copy of Paquete
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaqueteImplCopyWith<_$PaqueteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PuntoResumen _$PuntoResumenFromJson(Map<String, dynamic> json) {
  return _PuntoResumen.fromJson(json);
}

/// @nodoc
mixin _$PuntoResumen {
  @JsonKey(name: 'id_punto')
  int get id => throw _privateConstructorUsedError;
  String get nombre => throw _privateConstructorUsedError;
  String get codigo => throw _privateConstructorUsedError;
  String? get ciudad => throw _privateConstructorUsedError;

  /// Serializes this PuntoResumen to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PuntoResumen
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PuntoResumenCopyWith<PuntoResumen> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PuntoResumenCopyWith<$Res> {
  factory $PuntoResumenCopyWith(
    PuntoResumen value,
    $Res Function(PuntoResumen) then,
  ) = _$PuntoResumenCopyWithImpl<$Res, PuntoResumen>;
  @useResult
  $Res call({
    @JsonKey(name: 'id_punto') int id,
    String nombre,
    String codigo,
    String? ciudad,
  });
}

/// @nodoc
class _$PuntoResumenCopyWithImpl<$Res, $Val extends PuntoResumen>
    implements $PuntoResumenCopyWith<$Res> {
  _$PuntoResumenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PuntoResumen
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nombre = null,
    Object? codigo = null,
    Object? ciudad = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            nombre: null == nombre
                ? _value.nombre
                : nombre // ignore: cast_nullable_to_non_nullable
                      as String,
            codigo: null == codigo
                ? _value.codigo
                : codigo // ignore: cast_nullable_to_non_nullable
                      as String,
            ciudad: freezed == ciudad
                ? _value.ciudad
                : ciudad // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PuntoResumenImplCopyWith<$Res>
    implements $PuntoResumenCopyWith<$Res> {
  factory _$$PuntoResumenImplCopyWith(
    _$PuntoResumenImpl value,
    $Res Function(_$PuntoResumenImpl) then,
  ) = __$$PuntoResumenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'id_punto') int id,
    String nombre,
    String codigo,
    String? ciudad,
  });
}

/// @nodoc
class __$$PuntoResumenImplCopyWithImpl<$Res>
    extends _$PuntoResumenCopyWithImpl<$Res, _$PuntoResumenImpl>
    implements _$$PuntoResumenImplCopyWith<$Res> {
  __$$PuntoResumenImplCopyWithImpl(
    _$PuntoResumenImpl _value,
    $Res Function(_$PuntoResumenImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PuntoResumen
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nombre = null,
    Object? codigo = null,
    Object? ciudad = freezed,
  }) {
    return _then(
      _$PuntoResumenImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        nombre: null == nombre
            ? _value.nombre
            : nombre // ignore: cast_nullable_to_non_nullable
                  as String,
        codigo: null == codigo
            ? _value.codigo
            : codigo // ignore: cast_nullable_to_non_nullable
                  as String,
        ciudad: freezed == ciudad
            ? _value.ciudad
            : ciudad // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PuntoResumenImpl implements _PuntoResumen {
  const _$PuntoResumenImpl({
    @JsonKey(name: 'id_punto') required this.id,
    required this.nombre,
    required this.codigo,
    this.ciudad,
  });

  factory _$PuntoResumenImpl.fromJson(Map<String, dynamic> json) =>
      _$$PuntoResumenImplFromJson(json);

  @override
  @JsonKey(name: 'id_punto')
  final int id;
  @override
  final String nombre;
  @override
  final String codigo;
  @override
  final String? ciudad;

  @override
  String toString() {
    return 'PuntoResumen(id: $id, nombre: $nombre, codigo: $codigo, ciudad: $ciudad)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PuntoResumenImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nombre, nombre) || other.nombre == nombre) &&
            (identical(other.codigo, codigo) || other.codigo == codigo) &&
            (identical(other.ciudad, ciudad) || other.ciudad == ciudad));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nombre, codigo, ciudad);

  /// Create a copy of PuntoResumen
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PuntoResumenImplCopyWith<_$PuntoResumenImpl> get copyWith =>
      __$$PuntoResumenImplCopyWithImpl<_$PuntoResumenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PuntoResumenImplToJson(this);
  }
}

abstract class _PuntoResumen implements PuntoResumen {
  const factory _PuntoResumen({
    @JsonKey(name: 'id_punto') required final int id,
    required final String nombre,
    required final String codigo,
    final String? ciudad,
  }) = _$PuntoResumenImpl;

  factory _PuntoResumen.fromJson(Map<String, dynamic> json) =
      _$PuntoResumenImpl.fromJson;

  @override
  @JsonKey(name: 'id_punto')
  int get id;
  @override
  String get nombre;
  @override
  String get codigo;
  @override
  String? get ciudad;

  /// Create a copy of PuntoResumen
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PuntoResumenImplCopyWith<_$PuntoResumenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
