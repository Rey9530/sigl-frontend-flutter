// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recepcion_paquete.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RecepcionPaquete _$RecepcionPaqueteFromJson(Map<String, dynamic> json) {
  return _RecepcionPaquete.fromJson(json);
}

/// @nodoc
mixin _$RecepcionPaquete {
  @JsonKey(name: 'id_recepcion', fromJson: _stringToInt)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'codigo_rastreo')
  String get codigoRastreo => throw _privateConstructorUsedError;
  @JsonKey(name: 'imagen_url')
  String get imagenUrl => throw _privateConstructorUsedError;
  String? get vendedor => throw _privateConstructorUsedError;
  String? get cliente => throw _privateConstructorUsedError;
  String? get telefono => throw _privateConstructorUsedError;
  @JsonKey(name: 'dia_entrega')
  String? get diaEntrega => throw _privateConstructorUsedError;
  String? get destino => throw _privateConstructorUsedError;
  String? get encomendista => throw _privateConstructorUsedError;
  @JsonKey(name: 'precio_producto', fromJson: _stringToDoubleNullable)
  double? get precioProducto => throw _privateConstructorUsedError;
  @JsonKey(name: 'costo_envio', fromJson: _stringToDoubleNullable)
  double? get costoEnvio => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringToDoubleNullable)
  double? get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'confianza_global', fromJson: _stringToInt)
  int get confianzaGlobal => throw _privateConstructorUsedError;
  @JsonKey(name: 'confianza_detalle', fromJson: _stringToIntMap)
  Map<String, int>? get confianzaDetalle => throw _privateConstructorUsedError;
  EstadoRecepcion get estado => throw _privateConstructorUsedError;
  @JsonKey(name: 'notas_revision')
  String? get notasRevision => throw _privateConstructorUsedError;
  @JsonKey(name: 'punto_servicio')
  PuntoResumen get puntoServicio => throw _privateConstructorUsedError;
  @JsonKey(name: 'usuario_recepcion')
  UsuarioResumen? get usuarioRecepcion => throw _privateConstructorUsedError;
  PaqueteResumen? get paquete => throw _privateConstructorUsedError;
  @JsonKey(name: 'creado_en')
  DateTime get creadoEn => throw _privateConstructorUsedError;
  @JsonKey(name: 'actualizado_en')
  DateTime? get actualizadoEn => throw _privateConstructorUsedError;
  @JsonKey(name: 'convertido_en')
  DateTime? get convertidoEn => throw _privateConstructorUsedError;

  /// Serializes this RecepcionPaquete to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecepcionPaquete
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecepcionPaqueteCopyWith<RecepcionPaquete> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecepcionPaqueteCopyWith<$Res> {
  factory $RecepcionPaqueteCopyWith(
    RecepcionPaquete value,
    $Res Function(RecepcionPaquete) then,
  ) = _$RecepcionPaqueteCopyWithImpl<$Res, RecepcionPaquete>;
  @useResult
  $Res call({
    @JsonKey(name: 'id_recepcion', fromJson: _stringToInt) int id,
    @JsonKey(name: 'codigo_rastreo') String codigoRastreo,
    @JsonKey(name: 'imagen_url') String imagenUrl,
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
    int confianzaGlobal,
    @JsonKey(name: 'confianza_detalle', fromJson: _stringToIntMap)
    Map<String, int>? confianzaDetalle,
    EstadoRecepcion estado,
    @JsonKey(name: 'notas_revision') String? notasRevision,
    @JsonKey(name: 'punto_servicio') PuntoResumen puntoServicio,
    @JsonKey(name: 'usuario_recepcion') UsuarioResumen? usuarioRecepcion,
    PaqueteResumen? paquete,
    @JsonKey(name: 'creado_en') DateTime creadoEn,
    @JsonKey(name: 'actualizado_en') DateTime? actualizadoEn,
    @JsonKey(name: 'convertido_en') DateTime? convertidoEn,
  });

  $PuntoResumenCopyWith<$Res> get puntoServicio;
  $UsuarioResumenCopyWith<$Res>? get usuarioRecepcion;
  $PaqueteResumenCopyWith<$Res>? get paquete;
}

/// @nodoc
class _$RecepcionPaqueteCopyWithImpl<$Res, $Val extends RecepcionPaquete>
    implements $RecepcionPaqueteCopyWith<$Res> {
  _$RecepcionPaqueteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecepcionPaquete
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? codigoRastreo = null,
    Object? imagenUrl = null,
    Object? vendedor = freezed,
    Object? cliente = freezed,
    Object? telefono = freezed,
    Object? diaEntrega = freezed,
    Object? destino = freezed,
    Object? encomendista = freezed,
    Object? precioProducto = freezed,
    Object? costoEnvio = freezed,
    Object? total = freezed,
    Object? confianzaGlobal = null,
    Object? confianzaDetalle = freezed,
    Object? estado = null,
    Object? notasRevision = freezed,
    Object? puntoServicio = null,
    Object? usuarioRecepcion = freezed,
    Object? paquete = freezed,
    Object? creadoEn = null,
    Object? actualizadoEn = freezed,
    Object? convertidoEn = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            codigoRastreo: null == codigoRastreo
                ? _value.codigoRastreo
                : codigoRastreo // ignore: cast_nullable_to_non_nullable
                      as String,
            imagenUrl: null == imagenUrl
                ? _value.imagenUrl
                : imagenUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            vendedor: freezed == vendedor
                ? _value.vendedor
                : vendedor // ignore: cast_nullable_to_non_nullable
                      as String?,
            cliente: freezed == cliente
                ? _value.cliente
                : cliente // ignore: cast_nullable_to_non_nullable
                      as String?,
            telefono: freezed == telefono
                ? _value.telefono
                : telefono // ignore: cast_nullable_to_non_nullable
                      as String?,
            diaEntrega: freezed == diaEntrega
                ? _value.diaEntrega
                : diaEntrega // ignore: cast_nullable_to_non_nullable
                      as String?,
            destino: freezed == destino
                ? _value.destino
                : destino // ignore: cast_nullable_to_non_nullable
                      as String?,
            encomendista: freezed == encomendista
                ? _value.encomendista
                : encomendista // ignore: cast_nullable_to_non_nullable
                      as String?,
            precioProducto: freezed == precioProducto
                ? _value.precioProducto
                : precioProducto // ignore: cast_nullable_to_non_nullable
                      as double?,
            costoEnvio: freezed == costoEnvio
                ? _value.costoEnvio
                : costoEnvio // ignore: cast_nullable_to_non_nullable
                      as double?,
            total: freezed == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as double?,
            confianzaGlobal: null == confianzaGlobal
                ? _value.confianzaGlobal
                : confianzaGlobal // ignore: cast_nullable_to_non_nullable
                      as int,
            confianzaDetalle: freezed == confianzaDetalle
                ? _value.confianzaDetalle
                : confianzaDetalle // ignore: cast_nullable_to_non_nullable
                      as Map<String, int>?,
            estado: null == estado
                ? _value.estado
                : estado // ignore: cast_nullable_to_non_nullable
                      as EstadoRecepcion,
            notasRevision: freezed == notasRevision
                ? _value.notasRevision
                : notasRevision // ignore: cast_nullable_to_non_nullable
                      as String?,
            puntoServicio: null == puntoServicio
                ? _value.puntoServicio
                : puntoServicio // ignore: cast_nullable_to_non_nullable
                      as PuntoResumen,
            usuarioRecepcion: freezed == usuarioRecepcion
                ? _value.usuarioRecepcion
                : usuarioRecepcion // ignore: cast_nullable_to_non_nullable
                      as UsuarioResumen?,
            paquete: freezed == paquete
                ? _value.paquete
                : paquete // ignore: cast_nullable_to_non_nullable
                      as PaqueteResumen?,
            creadoEn: null == creadoEn
                ? _value.creadoEn
                : creadoEn // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            actualizadoEn: freezed == actualizadoEn
                ? _value.actualizadoEn
                : actualizadoEn // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            convertidoEn: freezed == convertidoEn
                ? _value.convertidoEn
                : convertidoEn // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of RecepcionPaquete
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PuntoResumenCopyWith<$Res> get puntoServicio {
    return $PuntoResumenCopyWith<$Res>(_value.puntoServicio, (value) {
      return _then(_value.copyWith(puntoServicio: value) as $Val);
    });
  }

  /// Create a copy of RecepcionPaquete
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UsuarioResumenCopyWith<$Res>? get usuarioRecepcion {
    if (_value.usuarioRecepcion == null) {
      return null;
    }

    return $UsuarioResumenCopyWith<$Res>(_value.usuarioRecepcion!, (value) {
      return _then(_value.copyWith(usuarioRecepcion: value) as $Val);
    });
  }

  /// Create a copy of RecepcionPaquete
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaqueteResumenCopyWith<$Res>? get paquete {
    if (_value.paquete == null) {
      return null;
    }

    return $PaqueteResumenCopyWith<$Res>(_value.paquete!, (value) {
      return _then(_value.copyWith(paquete: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecepcionPaqueteImplCopyWith<$Res>
    implements $RecepcionPaqueteCopyWith<$Res> {
  factory _$$RecepcionPaqueteImplCopyWith(
    _$RecepcionPaqueteImpl value,
    $Res Function(_$RecepcionPaqueteImpl) then,
  ) = __$$RecepcionPaqueteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'id_recepcion', fromJson: _stringToInt) int id,
    @JsonKey(name: 'codigo_rastreo') String codigoRastreo,
    @JsonKey(name: 'imagen_url') String imagenUrl,
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
    int confianzaGlobal,
    @JsonKey(name: 'confianza_detalle', fromJson: _stringToIntMap)
    Map<String, int>? confianzaDetalle,
    EstadoRecepcion estado,
    @JsonKey(name: 'notas_revision') String? notasRevision,
    @JsonKey(name: 'punto_servicio') PuntoResumen puntoServicio,
    @JsonKey(name: 'usuario_recepcion') UsuarioResumen? usuarioRecepcion,
    PaqueteResumen? paquete,
    @JsonKey(name: 'creado_en') DateTime creadoEn,
    @JsonKey(name: 'actualizado_en') DateTime? actualizadoEn,
    @JsonKey(name: 'convertido_en') DateTime? convertidoEn,
  });

  @override
  $PuntoResumenCopyWith<$Res> get puntoServicio;
  @override
  $UsuarioResumenCopyWith<$Res>? get usuarioRecepcion;
  @override
  $PaqueteResumenCopyWith<$Res>? get paquete;
}

/// @nodoc
class __$$RecepcionPaqueteImplCopyWithImpl<$Res>
    extends _$RecepcionPaqueteCopyWithImpl<$Res, _$RecepcionPaqueteImpl>
    implements _$$RecepcionPaqueteImplCopyWith<$Res> {
  __$$RecepcionPaqueteImplCopyWithImpl(
    _$RecepcionPaqueteImpl _value,
    $Res Function(_$RecepcionPaqueteImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecepcionPaquete
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? codigoRastreo = null,
    Object? imagenUrl = null,
    Object? vendedor = freezed,
    Object? cliente = freezed,
    Object? telefono = freezed,
    Object? diaEntrega = freezed,
    Object? destino = freezed,
    Object? encomendista = freezed,
    Object? precioProducto = freezed,
    Object? costoEnvio = freezed,
    Object? total = freezed,
    Object? confianzaGlobal = null,
    Object? confianzaDetalle = freezed,
    Object? estado = null,
    Object? notasRevision = freezed,
    Object? puntoServicio = null,
    Object? usuarioRecepcion = freezed,
    Object? paquete = freezed,
    Object? creadoEn = null,
    Object? actualizadoEn = freezed,
    Object? convertidoEn = freezed,
  }) {
    return _then(
      _$RecepcionPaqueteImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        codigoRastreo: null == codigoRastreo
            ? _value.codigoRastreo
            : codigoRastreo // ignore: cast_nullable_to_non_nullable
                  as String,
        imagenUrl: null == imagenUrl
            ? _value.imagenUrl
            : imagenUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        vendedor: freezed == vendedor
            ? _value.vendedor
            : vendedor // ignore: cast_nullable_to_non_nullable
                  as String?,
        cliente: freezed == cliente
            ? _value.cliente
            : cliente // ignore: cast_nullable_to_non_nullable
                  as String?,
        telefono: freezed == telefono
            ? _value.telefono
            : telefono // ignore: cast_nullable_to_non_nullable
                  as String?,
        diaEntrega: freezed == diaEntrega
            ? _value.diaEntrega
            : diaEntrega // ignore: cast_nullable_to_non_nullable
                  as String?,
        destino: freezed == destino
            ? _value.destino
            : destino // ignore: cast_nullable_to_non_nullable
                  as String?,
        encomendista: freezed == encomendista
            ? _value.encomendista
            : encomendista // ignore: cast_nullable_to_non_nullable
                  as String?,
        precioProducto: freezed == precioProducto
            ? _value.precioProducto
            : precioProducto // ignore: cast_nullable_to_non_nullable
                  as double?,
        costoEnvio: freezed == costoEnvio
            ? _value.costoEnvio
            : costoEnvio // ignore: cast_nullable_to_non_nullable
                  as double?,
        total: freezed == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as double?,
        confianzaGlobal: null == confianzaGlobal
            ? _value.confianzaGlobal
            : confianzaGlobal // ignore: cast_nullable_to_non_nullable
                  as int,
        confianzaDetalle: freezed == confianzaDetalle
            ? _value._confianzaDetalle
            : confianzaDetalle // ignore: cast_nullable_to_non_nullable
                  as Map<String, int>?,
        estado: null == estado
            ? _value.estado
            : estado // ignore: cast_nullable_to_non_nullable
                  as EstadoRecepcion,
        notasRevision: freezed == notasRevision
            ? _value.notasRevision
            : notasRevision // ignore: cast_nullable_to_non_nullable
                  as String?,
        puntoServicio: null == puntoServicio
            ? _value.puntoServicio
            : puntoServicio // ignore: cast_nullable_to_non_nullable
                  as PuntoResumen,
        usuarioRecepcion: freezed == usuarioRecepcion
            ? _value.usuarioRecepcion
            : usuarioRecepcion // ignore: cast_nullable_to_non_nullable
                  as UsuarioResumen?,
        paquete: freezed == paquete
            ? _value.paquete
            : paquete // ignore: cast_nullable_to_non_nullable
                  as PaqueteResumen?,
        creadoEn: null == creadoEn
            ? _value.creadoEn
            : creadoEn // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        actualizadoEn: freezed == actualizadoEn
            ? _value.actualizadoEn
            : actualizadoEn // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        convertidoEn: freezed == convertidoEn
            ? _value.convertidoEn
            : convertidoEn // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RecepcionPaqueteImpl extends _RecepcionPaquete {
  const _$RecepcionPaqueteImpl({
    @JsonKey(name: 'id_recepcion', fromJson: _stringToInt) required this.id,
    @JsonKey(name: 'codigo_rastreo') required this.codigoRastreo,
    @JsonKey(name: 'imagen_url') required this.imagenUrl,
    this.vendedor,
    this.cliente,
    this.telefono,
    @JsonKey(name: 'dia_entrega') this.diaEntrega,
    this.destino,
    this.encomendista,
    @JsonKey(name: 'precio_producto', fromJson: _stringToDoubleNullable)
    this.precioProducto,
    @JsonKey(name: 'costo_envio', fromJson: _stringToDoubleNullable)
    this.costoEnvio,
    @JsonKey(fromJson: _stringToDoubleNullable) this.total,
    @JsonKey(name: 'confianza_global', fromJson: _stringToInt)
    required this.confianzaGlobal,
    @JsonKey(name: 'confianza_detalle', fromJson: _stringToIntMap)
    final Map<String, int>? confianzaDetalle,
    required this.estado,
    @JsonKey(name: 'notas_revision') this.notasRevision,
    @JsonKey(name: 'punto_servicio') required this.puntoServicio,
    @JsonKey(name: 'usuario_recepcion') this.usuarioRecepcion,
    this.paquete,
    @JsonKey(name: 'creado_en') required this.creadoEn,
    @JsonKey(name: 'actualizado_en') this.actualizadoEn,
    @JsonKey(name: 'convertido_en') this.convertidoEn,
  }) : _confianzaDetalle = confianzaDetalle,
       super._();

  factory _$RecepcionPaqueteImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecepcionPaqueteImplFromJson(json);

  @override
  @JsonKey(name: 'id_recepcion', fromJson: _stringToInt)
  final int id;
  @override
  @JsonKey(name: 'codigo_rastreo')
  final String codigoRastreo;
  @override
  @JsonKey(name: 'imagen_url')
  final String imagenUrl;
  @override
  final String? vendedor;
  @override
  final String? cliente;
  @override
  final String? telefono;
  @override
  @JsonKey(name: 'dia_entrega')
  final String? diaEntrega;
  @override
  final String? destino;
  @override
  final String? encomendista;
  @override
  @JsonKey(name: 'precio_producto', fromJson: _stringToDoubleNullable)
  final double? precioProducto;
  @override
  @JsonKey(name: 'costo_envio', fromJson: _stringToDoubleNullable)
  final double? costoEnvio;
  @override
  @JsonKey(fromJson: _stringToDoubleNullable)
  final double? total;
  @override
  @JsonKey(name: 'confianza_global', fromJson: _stringToInt)
  final int confianzaGlobal;
  final Map<String, int>? _confianzaDetalle;
  @override
  @JsonKey(name: 'confianza_detalle', fromJson: _stringToIntMap)
  Map<String, int>? get confianzaDetalle {
    final value = _confianzaDetalle;
    if (value == null) return null;
    if (_confianzaDetalle is EqualUnmodifiableMapView) return _confianzaDetalle;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final EstadoRecepcion estado;
  @override
  @JsonKey(name: 'notas_revision')
  final String? notasRevision;
  @override
  @JsonKey(name: 'punto_servicio')
  final PuntoResumen puntoServicio;
  @override
  @JsonKey(name: 'usuario_recepcion')
  final UsuarioResumen? usuarioRecepcion;
  @override
  final PaqueteResumen? paquete;
  @override
  @JsonKey(name: 'creado_en')
  final DateTime creadoEn;
  @override
  @JsonKey(name: 'actualizado_en')
  final DateTime? actualizadoEn;
  @override
  @JsonKey(name: 'convertido_en')
  final DateTime? convertidoEn;

  @override
  String toString() {
    return 'RecepcionPaquete(id: $id, codigoRastreo: $codigoRastreo, imagenUrl: $imagenUrl, vendedor: $vendedor, cliente: $cliente, telefono: $telefono, diaEntrega: $diaEntrega, destino: $destino, encomendista: $encomendista, precioProducto: $precioProducto, costoEnvio: $costoEnvio, total: $total, confianzaGlobal: $confianzaGlobal, confianzaDetalle: $confianzaDetalle, estado: $estado, notasRevision: $notasRevision, puntoServicio: $puntoServicio, usuarioRecepcion: $usuarioRecepcion, paquete: $paquete, creadoEn: $creadoEn, actualizadoEn: $actualizadoEn, convertidoEn: $convertidoEn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecepcionPaqueteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.codigoRastreo, codigoRastreo) ||
                other.codigoRastreo == codigoRastreo) &&
            (identical(other.imagenUrl, imagenUrl) ||
                other.imagenUrl == imagenUrl) &&
            (identical(other.vendedor, vendedor) ||
                other.vendedor == vendedor) &&
            (identical(other.cliente, cliente) || other.cliente == cliente) &&
            (identical(other.telefono, telefono) ||
                other.telefono == telefono) &&
            (identical(other.diaEntrega, diaEntrega) ||
                other.diaEntrega == diaEntrega) &&
            (identical(other.destino, destino) || other.destino == destino) &&
            (identical(other.encomendista, encomendista) ||
                other.encomendista == encomendista) &&
            (identical(other.precioProducto, precioProducto) ||
                other.precioProducto == precioProducto) &&
            (identical(other.costoEnvio, costoEnvio) ||
                other.costoEnvio == costoEnvio) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.confianzaGlobal, confianzaGlobal) ||
                other.confianzaGlobal == confianzaGlobal) &&
            const DeepCollectionEquality().equals(
              other._confianzaDetalle,
              _confianzaDetalle,
            ) &&
            (identical(other.estado, estado) || other.estado == estado) &&
            (identical(other.notasRevision, notasRevision) ||
                other.notasRevision == notasRevision) &&
            (identical(other.puntoServicio, puntoServicio) ||
                other.puntoServicio == puntoServicio) &&
            (identical(other.usuarioRecepcion, usuarioRecepcion) ||
                other.usuarioRecepcion == usuarioRecepcion) &&
            (identical(other.paquete, paquete) || other.paquete == paquete) &&
            (identical(other.creadoEn, creadoEn) ||
                other.creadoEn == creadoEn) &&
            (identical(other.actualizadoEn, actualizadoEn) ||
                other.actualizadoEn == actualizadoEn) &&
            (identical(other.convertidoEn, convertidoEn) ||
                other.convertidoEn == convertidoEn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    codigoRastreo,
    imagenUrl,
    vendedor,
    cliente,
    telefono,
    diaEntrega,
    destino,
    encomendista,
    precioProducto,
    costoEnvio,
    total,
    confianzaGlobal,
    const DeepCollectionEquality().hash(_confianzaDetalle),
    estado,
    notasRevision,
    puntoServicio,
    usuarioRecepcion,
    paquete,
    creadoEn,
    actualizadoEn,
    convertidoEn,
  ]);

  /// Create a copy of RecepcionPaquete
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecepcionPaqueteImplCopyWith<_$RecepcionPaqueteImpl> get copyWith =>
      __$$RecepcionPaqueteImplCopyWithImpl<_$RecepcionPaqueteImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RecepcionPaqueteImplToJson(this);
  }
}

abstract class _RecepcionPaquete extends RecepcionPaquete {
  const factory _RecepcionPaquete({
    @JsonKey(name: 'id_recepcion', fromJson: _stringToInt)
    required final int id,
    @JsonKey(name: 'codigo_rastreo') required final String codigoRastreo,
    @JsonKey(name: 'imagen_url') required final String imagenUrl,
    final String? vendedor,
    final String? cliente,
    final String? telefono,
    @JsonKey(name: 'dia_entrega') final String? diaEntrega,
    final String? destino,
    final String? encomendista,
    @JsonKey(name: 'precio_producto', fromJson: _stringToDoubleNullable)
    final double? precioProducto,
    @JsonKey(name: 'costo_envio', fromJson: _stringToDoubleNullable)
    final double? costoEnvio,
    @JsonKey(fromJson: _stringToDoubleNullable) final double? total,
    @JsonKey(name: 'confianza_global', fromJson: _stringToInt)
    required final int confianzaGlobal,
    @JsonKey(name: 'confianza_detalle', fromJson: _stringToIntMap)
    final Map<String, int>? confianzaDetalle,
    required final EstadoRecepcion estado,
    @JsonKey(name: 'notas_revision') final String? notasRevision,
    @JsonKey(name: 'punto_servicio') required final PuntoResumen puntoServicio,
    @JsonKey(name: 'usuario_recepcion') final UsuarioResumen? usuarioRecepcion,
    final PaqueteResumen? paquete,
    @JsonKey(name: 'creado_en') required final DateTime creadoEn,
    @JsonKey(name: 'actualizado_en') final DateTime? actualizadoEn,
    @JsonKey(name: 'convertido_en') final DateTime? convertidoEn,
  }) = _$RecepcionPaqueteImpl;
  const _RecepcionPaquete._() : super._();

  factory _RecepcionPaquete.fromJson(Map<String, dynamic> json) =
      _$RecepcionPaqueteImpl.fromJson;

  @override
  @JsonKey(name: 'id_recepcion', fromJson: _stringToInt)
  int get id;
  @override
  @JsonKey(name: 'codigo_rastreo')
  String get codigoRastreo;
  @override
  @JsonKey(name: 'imagen_url')
  String get imagenUrl;
  @override
  String? get vendedor;
  @override
  String? get cliente;
  @override
  String? get telefono;
  @override
  @JsonKey(name: 'dia_entrega')
  String? get diaEntrega;
  @override
  String? get destino;
  @override
  String? get encomendista;
  @override
  @JsonKey(name: 'precio_producto', fromJson: _stringToDoubleNullable)
  double? get precioProducto;
  @override
  @JsonKey(name: 'costo_envio', fromJson: _stringToDoubleNullable)
  double? get costoEnvio;
  @override
  @JsonKey(fromJson: _stringToDoubleNullable)
  double? get total;
  @override
  @JsonKey(name: 'confianza_global', fromJson: _stringToInt)
  int get confianzaGlobal;
  @override
  @JsonKey(name: 'confianza_detalle', fromJson: _stringToIntMap)
  Map<String, int>? get confianzaDetalle;
  @override
  EstadoRecepcion get estado;
  @override
  @JsonKey(name: 'notas_revision')
  String? get notasRevision;
  @override
  @JsonKey(name: 'punto_servicio')
  PuntoResumen get puntoServicio;
  @override
  @JsonKey(name: 'usuario_recepcion')
  UsuarioResumen? get usuarioRecepcion;
  @override
  PaqueteResumen? get paquete;
  @override
  @JsonKey(name: 'creado_en')
  DateTime get creadoEn;
  @override
  @JsonKey(name: 'actualizado_en')
  DateTime? get actualizadoEn;
  @override
  @JsonKey(name: 'convertido_en')
  DateTime? get convertidoEn;

  /// Create a copy of RecepcionPaquete
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecepcionPaqueteImplCopyWith<_$RecepcionPaqueteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UsuarioResumen _$UsuarioResumenFromJson(Map<String, dynamic> json) {
  return _UsuarioResumen.fromJson(json);
}

/// @nodoc
mixin _$UsuarioResumen {
  @JsonKey(name: 'id_usuario', fromJson: _stringToInt)
  int get id => throw _privateConstructorUsedError;
  String get nombre => throw _privateConstructorUsedError;

  /// Serializes this UsuarioResumen to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UsuarioResumen
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UsuarioResumenCopyWith<UsuarioResumen> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsuarioResumenCopyWith<$Res> {
  factory $UsuarioResumenCopyWith(
    UsuarioResumen value,
    $Res Function(UsuarioResumen) then,
  ) = _$UsuarioResumenCopyWithImpl<$Res, UsuarioResumen>;
  @useResult
  $Res call({
    @JsonKey(name: 'id_usuario', fromJson: _stringToInt) int id,
    String nombre,
  });
}

/// @nodoc
class _$UsuarioResumenCopyWithImpl<$Res, $Val extends UsuarioResumen>
    implements $UsuarioResumenCopyWith<$Res> {
  _$UsuarioResumenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UsuarioResumen
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? nombre = null}) {
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UsuarioResumenImplCopyWith<$Res>
    implements $UsuarioResumenCopyWith<$Res> {
  factory _$$UsuarioResumenImplCopyWith(
    _$UsuarioResumenImpl value,
    $Res Function(_$UsuarioResumenImpl) then,
  ) = __$$UsuarioResumenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'id_usuario', fromJson: _stringToInt) int id,
    String nombre,
  });
}

/// @nodoc
class __$$UsuarioResumenImplCopyWithImpl<$Res>
    extends _$UsuarioResumenCopyWithImpl<$Res, _$UsuarioResumenImpl>
    implements _$$UsuarioResumenImplCopyWith<$Res> {
  __$$UsuarioResumenImplCopyWithImpl(
    _$UsuarioResumenImpl _value,
    $Res Function(_$UsuarioResumenImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UsuarioResumen
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? nombre = null}) {
    return _then(
      _$UsuarioResumenImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        nombre: null == nombre
            ? _value.nombre
            : nombre // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UsuarioResumenImpl implements _UsuarioResumen {
  const _$UsuarioResumenImpl({
    @JsonKey(name: 'id_usuario', fromJson: _stringToInt) required this.id,
    required this.nombre,
  });

  factory _$UsuarioResumenImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsuarioResumenImplFromJson(json);

  @override
  @JsonKey(name: 'id_usuario', fromJson: _stringToInt)
  final int id;
  @override
  final String nombre;

  @override
  String toString() {
    return 'UsuarioResumen(id: $id, nombre: $nombre)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsuarioResumenImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nombre, nombre) || other.nombre == nombre));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nombre);

  /// Create a copy of UsuarioResumen
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UsuarioResumenImplCopyWith<_$UsuarioResumenImpl> get copyWith =>
      __$$UsuarioResumenImplCopyWithImpl<_$UsuarioResumenImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UsuarioResumenImplToJson(this);
  }
}

abstract class _UsuarioResumen implements UsuarioResumen {
  const factory _UsuarioResumen({
    @JsonKey(name: 'id_usuario', fromJson: _stringToInt) required final int id,
    required final String nombre,
  }) = _$UsuarioResumenImpl;

  factory _UsuarioResumen.fromJson(Map<String, dynamic> json) =
      _$UsuarioResumenImpl.fromJson;

  @override
  @JsonKey(name: 'id_usuario', fromJson: _stringToInt)
  int get id;
  @override
  String get nombre;

  /// Create a copy of UsuarioResumen
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UsuarioResumenImplCopyWith<_$UsuarioResumenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaqueteResumen _$PaqueteResumenFromJson(Map<String, dynamic> json) {
  return _PaqueteResumen.fromJson(json);
}

/// @nodoc
mixin _$PaqueteResumen {
  @JsonKey(name: 'id_paquete', fromJson: _stringToInt)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'codigo_rastreo')
  String get codigoRastreo => throw _privateConstructorUsedError;

  /// Serializes this PaqueteResumen to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaqueteResumen
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaqueteResumenCopyWith<PaqueteResumen> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaqueteResumenCopyWith<$Res> {
  factory $PaqueteResumenCopyWith(
    PaqueteResumen value,
    $Res Function(PaqueteResumen) then,
  ) = _$PaqueteResumenCopyWithImpl<$Res, PaqueteResumen>;
  @useResult
  $Res call({
    @JsonKey(name: 'id_paquete', fromJson: _stringToInt) int id,
    @JsonKey(name: 'codigo_rastreo') String codigoRastreo,
  });
}

/// @nodoc
class _$PaqueteResumenCopyWithImpl<$Res, $Val extends PaqueteResumen>
    implements $PaqueteResumenCopyWith<$Res> {
  _$PaqueteResumenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaqueteResumen
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? codigoRastreo = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            codigoRastreo: null == codigoRastreo
                ? _value.codigoRastreo
                : codigoRastreo // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaqueteResumenImplCopyWith<$Res>
    implements $PaqueteResumenCopyWith<$Res> {
  factory _$$PaqueteResumenImplCopyWith(
    _$PaqueteResumenImpl value,
    $Res Function(_$PaqueteResumenImpl) then,
  ) = __$$PaqueteResumenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'id_paquete', fromJson: _stringToInt) int id,
    @JsonKey(name: 'codigo_rastreo') String codigoRastreo,
  });
}

/// @nodoc
class __$$PaqueteResumenImplCopyWithImpl<$Res>
    extends _$PaqueteResumenCopyWithImpl<$Res, _$PaqueteResumenImpl>
    implements _$$PaqueteResumenImplCopyWith<$Res> {
  __$$PaqueteResumenImplCopyWithImpl(
    _$PaqueteResumenImpl _value,
    $Res Function(_$PaqueteResumenImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaqueteResumen
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? codigoRastreo = null}) {
    return _then(
      _$PaqueteResumenImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        codigoRastreo: null == codigoRastreo
            ? _value.codigoRastreo
            : codigoRastreo // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaqueteResumenImpl implements _PaqueteResumen {
  const _$PaqueteResumenImpl({
    @JsonKey(name: 'id_paquete', fromJson: _stringToInt) required this.id,
    @JsonKey(name: 'codigo_rastreo') required this.codigoRastreo,
  });

  factory _$PaqueteResumenImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaqueteResumenImplFromJson(json);

  @override
  @JsonKey(name: 'id_paquete', fromJson: _stringToInt)
  final int id;
  @override
  @JsonKey(name: 'codigo_rastreo')
  final String codigoRastreo;

  @override
  String toString() {
    return 'PaqueteResumen(id: $id, codigoRastreo: $codigoRastreo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaqueteResumenImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.codigoRastreo, codigoRastreo) ||
                other.codigoRastreo == codigoRastreo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, codigoRastreo);

  /// Create a copy of PaqueteResumen
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaqueteResumenImplCopyWith<_$PaqueteResumenImpl> get copyWith =>
      __$$PaqueteResumenImplCopyWithImpl<_$PaqueteResumenImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PaqueteResumenImplToJson(this);
  }
}

abstract class _PaqueteResumen implements PaqueteResumen {
  const factory _PaqueteResumen({
    @JsonKey(name: 'id_paquete', fromJson: _stringToInt) required final int id,
    @JsonKey(name: 'codigo_rastreo') required final String codigoRastreo,
  }) = _$PaqueteResumenImpl;

  factory _PaqueteResumen.fromJson(Map<String, dynamic> json) =
      _$PaqueteResumenImpl.fromJson;

  @override
  @JsonKey(name: 'id_paquete', fromJson: _stringToInt)
  int get id;
  @override
  @JsonKey(name: 'codigo_rastreo')
  String get codigoRastreo;

  /// Create a copy of PaqueteResumen
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaqueteResumenImplCopyWith<_$PaqueteResumenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
