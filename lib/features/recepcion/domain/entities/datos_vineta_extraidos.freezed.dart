// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'datos_vineta_extraidos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DatosVinetaExtraidos _$DatosVinetaExtraidosFromJson(Map<String, dynamic> json) {
  return _DatosVinetaExtraidos.fromJson(json);
}

/// @nodoc
mixin _$DatosVinetaExtraidos {
  @JsonKey(name: 'imagen_url')
  String get imagenUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'imagen_object_name')
  String get imagenObjectName => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'requiere_monto_manual')
  bool get requiereMontoManual => throw _privateConstructorUsedError;
  @JsonKey(name: 'texto_ocr_crudo')
  String? get textoOcrCrudo => throw _privateConstructorUsedError;

  /// Serializes this DatosVinetaExtraidos to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DatosVinetaExtraidos
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DatosVinetaExtraidosCopyWith<DatosVinetaExtraidos> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatosVinetaExtraidosCopyWith<$Res> {
  factory $DatosVinetaExtraidosCopyWith(
    DatosVinetaExtraidos value,
    $Res Function(DatosVinetaExtraidos) then,
  ) = _$DatosVinetaExtraidosCopyWithImpl<$Res, DatosVinetaExtraidos>;
  @useResult
  $Res call({
    @JsonKey(name: 'imagen_url') String imagenUrl,
    @JsonKey(name: 'imagen_object_name') String imagenObjectName,
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
    @JsonKey(name: 'requiere_monto_manual') bool requiereMontoManual,
    @JsonKey(name: 'texto_ocr_crudo') String? textoOcrCrudo,
  });
}

/// @nodoc
class _$DatosVinetaExtraidosCopyWithImpl<
  $Res,
  $Val extends DatosVinetaExtraidos
>
    implements $DatosVinetaExtraidosCopyWith<$Res> {
  _$DatosVinetaExtraidosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DatosVinetaExtraidos
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagenUrl = null,
    Object? imagenObjectName = null,
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
    Object? requiereMontoManual = null,
    Object? textoOcrCrudo = freezed,
  }) {
    return _then(
      _value.copyWith(
            imagenUrl: null == imagenUrl
                ? _value.imagenUrl
                : imagenUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            imagenObjectName: null == imagenObjectName
                ? _value.imagenObjectName
                : imagenObjectName // ignore: cast_nullable_to_non_nullable
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
            requiereMontoManual: null == requiereMontoManual
                ? _value.requiereMontoManual
                : requiereMontoManual // ignore: cast_nullable_to_non_nullable
                      as bool,
            textoOcrCrudo: freezed == textoOcrCrudo
                ? _value.textoOcrCrudo
                : textoOcrCrudo // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DatosVinetaExtraidosImplCopyWith<$Res>
    implements $DatosVinetaExtraidosCopyWith<$Res> {
  factory _$$DatosVinetaExtraidosImplCopyWith(
    _$DatosVinetaExtraidosImpl value,
    $Res Function(_$DatosVinetaExtraidosImpl) then,
  ) = __$$DatosVinetaExtraidosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'imagen_url') String imagenUrl,
    @JsonKey(name: 'imagen_object_name') String imagenObjectName,
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
    @JsonKey(name: 'requiere_monto_manual') bool requiereMontoManual,
    @JsonKey(name: 'texto_ocr_crudo') String? textoOcrCrudo,
  });
}

/// @nodoc
class __$$DatosVinetaExtraidosImplCopyWithImpl<$Res>
    extends _$DatosVinetaExtraidosCopyWithImpl<$Res, _$DatosVinetaExtraidosImpl>
    implements _$$DatosVinetaExtraidosImplCopyWith<$Res> {
  __$$DatosVinetaExtraidosImplCopyWithImpl(
    _$DatosVinetaExtraidosImpl _value,
    $Res Function(_$DatosVinetaExtraidosImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DatosVinetaExtraidos
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagenUrl = null,
    Object? imagenObjectName = null,
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
    Object? requiereMontoManual = null,
    Object? textoOcrCrudo = freezed,
  }) {
    return _then(
      _$DatosVinetaExtraidosImpl(
        imagenUrl: null == imagenUrl
            ? _value.imagenUrl
            : imagenUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        imagenObjectName: null == imagenObjectName
            ? _value.imagenObjectName
            : imagenObjectName // ignore: cast_nullable_to_non_nullable
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
        requiereMontoManual: null == requiereMontoManual
            ? _value.requiereMontoManual
            : requiereMontoManual // ignore: cast_nullable_to_non_nullable
                  as bool,
        textoOcrCrudo: freezed == textoOcrCrudo
            ? _value.textoOcrCrudo
            : textoOcrCrudo // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DatosVinetaExtraidosImpl extends _DatosVinetaExtraidos {
  const _$DatosVinetaExtraidosImpl({
    @JsonKey(name: 'imagen_url') required this.imagenUrl,
    @JsonKey(name: 'imagen_object_name') required this.imagenObjectName,
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
    @JsonKey(name: 'requiere_monto_manual') required this.requiereMontoManual,
    @JsonKey(name: 'texto_ocr_crudo') this.textoOcrCrudo,
  }) : _confianzaDetalle = confianzaDetalle,
       super._();

  factory _$DatosVinetaExtraidosImpl.fromJson(Map<String, dynamic> json) =>
      _$$DatosVinetaExtraidosImplFromJson(json);

  @override
  @JsonKey(name: 'imagen_url')
  final String imagenUrl;
  @override
  @JsonKey(name: 'imagen_object_name')
  final String imagenObjectName;
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
  @JsonKey(name: 'requiere_monto_manual')
  final bool requiereMontoManual;
  @override
  @JsonKey(name: 'texto_ocr_crudo')
  final String? textoOcrCrudo;

  @override
  String toString() {
    return 'DatosVinetaExtraidos(imagenUrl: $imagenUrl, imagenObjectName: $imagenObjectName, vendedor: $vendedor, cliente: $cliente, telefono: $telefono, diaEntrega: $diaEntrega, destino: $destino, encomendista: $encomendista, precioProducto: $precioProducto, costoEnvio: $costoEnvio, total: $total, confianzaGlobal: $confianzaGlobal, confianzaDetalle: $confianzaDetalle, requiereMontoManual: $requiereMontoManual, textoOcrCrudo: $textoOcrCrudo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatosVinetaExtraidosImpl &&
            (identical(other.imagenUrl, imagenUrl) ||
                other.imagenUrl == imagenUrl) &&
            (identical(other.imagenObjectName, imagenObjectName) ||
                other.imagenObjectName == imagenObjectName) &&
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
            (identical(other.requiereMontoManual, requiereMontoManual) ||
                other.requiereMontoManual == requiereMontoManual) &&
            (identical(other.textoOcrCrudo, textoOcrCrudo) ||
                other.textoOcrCrudo == textoOcrCrudo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    imagenUrl,
    imagenObjectName,
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
    requiereMontoManual,
    textoOcrCrudo,
  );

  /// Create a copy of DatosVinetaExtraidos
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DatosVinetaExtraidosImplCopyWith<_$DatosVinetaExtraidosImpl>
  get copyWith =>
      __$$DatosVinetaExtraidosImplCopyWithImpl<_$DatosVinetaExtraidosImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DatosVinetaExtraidosImplToJson(this);
  }
}

abstract class _DatosVinetaExtraidos extends DatosVinetaExtraidos {
  const factory _DatosVinetaExtraidos({
    @JsonKey(name: 'imagen_url') required final String imagenUrl,
    @JsonKey(name: 'imagen_object_name') required final String imagenObjectName,
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
    @JsonKey(name: 'requiere_monto_manual')
    required final bool requiereMontoManual,
    @JsonKey(name: 'texto_ocr_crudo') final String? textoOcrCrudo,
  }) = _$DatosVinetaExtraidosImpl;
  const _DatosVinetaExtraidos._() : super._();

  factory _DatosVinetaExtraidos.fromJson(Map<String, dynamic> json) =
      _$DatosVinetaExtraidosImpl.fromJson;

  @override
  @JsonKey(name: 'imagen_url')
  String get imagenUrl;
  @override
  @JsonKey(name: 'imagen_object_name')
  String get imagenObjectName;
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
  @JsonKey(name: 'requiere_monto_manual')
  bool get requiereMontoManual;
  @override
  @JsonKey(name: 'texto_ocr_crudo')
  String? get textoOcrCrudo;

  /// Create a copy of DatosVinetaExtraidos
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DatosVinetaExtraidosImplCopyWith<_$DatosVinetaExtraidosImpl>
  get copyWith => throw _privateConstructorUsedError;
}

RegistrarRecepcionRequest _$RegistrarRecepcionRequestFromJson(
  Map<String, dynamic> json,
) {
  return _RegistrarRecepcionRequest.fromJson(json);
}

/// @nodoc
mixin _$RegistrarRecepcionRequest {
  @JsonKey(name: 'imagen_object_name')
  String get imagenObjectName => throw _privateConstructorUsedError;
  @JsonKey(name: 'punto_servicio_id')
  int get puntoServicioId => throw _privateConstructorUsedError;
  String? get vendedor => throw _privateConstructorUsedError;
  String? get cliente => throw _privateConstructorUsedError;
  String? get telefono => throw _privateConstructorUsedError;
  @JsonKey(name: 'dia_entrega')
  String? get diaEntrega => throw _privateConstructorUsedError;
  String? get destino => throw _privateConstructorUsedError;
  String? get encomendista => throw _privateConstructorUsedError;
  @JsonKey(name: 'precio_producto')
  double? get precioProducto => throw _privateConstructorUsedError;
  @JsonKey(name: 'costo_envio')
  double get costoEnvio => throw _privateConstructorUsedError;
  double? get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'tipo_cobro_envio')
  TipoCobroEnvio get tipoCobroEnvio => throw _privateConstructorUsedError;
  @JsonKey(name: 'monto_cobrar_cliente')
  double get montoACobrarCliente => throw _privateConstructorUsedError;
  @JsonKey(name: 'monto_para_vendedor')
  double get montoParaVendedor => throw _privateConstructorUsedError;
  String? get notas => throw _privateConstructorUsedError;

  /// Serializes this RegistrarRecepcionRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegistrarRecepcionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegistrarRecepcionRequestCopyWith<RegistrarRecepcionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrarRecepcionRequestCopyWith<$Res> {
  factory $RegistrarRecepcionRequestCopyWith(
    RegistrarRecepcionRequest value,
    $Res Function(RegistrarRecepcionRequest) then,
  ) = _$RegistrarRecepcionRequestCopyWithImpl<$Res, RegistrarRecepcionRequest>;
  @useResult
  $Res call({
    @JsonKey(name: 'imagen_object_name') String imagenObjectName,
    @JsonKey(name: 'punto_servicio_id') int puntoServicioId,
    String? vendedor,
    String? cliente,
    String? telefono,
    @JsonKey(name: 'dia_entrega') String? diaEntrega,
    String? destino,
    String? encomendista,
    @JsonKey(name: 'precio_producto') double? precioProducto,
    @JsonKey(name: 'costo_envio') double costoEnvio,
    double? total,
    @JsonKey(name: 'tipo_cobro_envio') TipoCobroEnvio tipoCobroEnvio,
    @JsonKey(name: 'monto_cobrar_cliente') double montoACobrarCliente,
    @JsonKey(name: 'monto_para_vendedor') double montoParaVendedor,
    String? notas,
  });
}

/// @nodoc
class _$RegistrarRecepcionRequestCopyWithImpl<
  $Res,
  $Val extends RegistrarRecepcionRequest
>
    implements $RegistrarRecepcionRequestCopyWith<$Res> {
  _$RegistrarRecepcionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegistrarRecepcionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagenObjectName = null,
    Object? puntoServicioId = null,
    Object? vendedor = freezed,
    Object? cliente = freezed,
    Object? telefono = freezed,
    Object? diaEntrega = freezed,
    Object? destino = freezed,
    Object? encomendista = freezed,
    Object? precioProducto = freezed,
    Object? costoEnvio = null,
    Object? total = freezed,
    Object? tipoCobroEnvio = null,
    Object? montoACobrarCliente = null,
    Object? montoParaVendedor = null,
    Object? notas = freezed,
  }) {
    return _then(
      _value.copyWith(
            imagenObjectName: null == imagenObjectName
                ? _value.imagenObjectName
                : imagenObjectName // ignore: cast_nullable_to_non_nullable
                      as String,
            puntoServicioId: null == puntoServicioId
                ? _value.puntoServicioId
                : puntoServicioId // ignore: cast_nullable_to_non_nullable
                      as int,
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
            costoEnvio: null == costoEnvio
                ? _value.costoEnvio
                : costoEnvio // ignore: cast_nullable_to_non_nullable
                      as double,
            total: freezed == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as double?,
            tipoCobroEnvio: null == tipoCobroEnvio
                ? _value.tipoCobroEnvio
                : tipoCobroEnvio // ignore: cast_nullable_to_non_nullable
                      as TipoCobroEnvio,
            montoACobrarCliente: null == montoACobrarCliente
                ? _value.montoACobrarCliente
                : montoACobrarCliente // ignore: cast_nullable_to_non_nullable
                      as double,
            montoParaVendedor: null == montoParaVendedor
                ? _value.montoParaVendedor
                : montoParaVendedor // ignore: cast_nullable_to_non_nullable
                      as double,
            notas: freezed == notas
                ? _value.notas
                : notas // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RegistrarRecepcionRequestImplCopyWith<$Res>
    implements $RegistrarRecepcionRequestCopyWith<$Res> {
  factory _$$RegistrarRecepcionRequestImplCopyWith(
    _$RegistrarRecepcionRequestImpl value,
    $Res Function(_$RegistrarRecepcionRequestImpl) then,
  ) = __$$RegistrarRecepcionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'imagen_object_name') String imagenObjectName,
    @JsonKey(name: 'punto_servicio_id') int puntoServicioId,
    String? vendedor,
    String? cliente,
    String? telefono,
    @JsonKey(name: 'dia_entrega') String? diaEntrega,
    String? destino,
    String? encomendista,
    @JsonKey(name: 'precio_producto') double? precioProducto,
    @JsonKey(name: 'costo_envio') double costoEnvio,
    double? total,
    @JsonKey(name: 'tipo_cobro_envio') TipoCobroEnvio tipoCobroEnvio,
    @JsonKey(name: 'monto_cobrar_cliente') double montoACobrarCliente,
    @JsonKey(name: 'monto_para_vendedor') double montoParaVendedor,
    String? notas,
  });
}

/// @nodoc
class __$$RegistrarRecepcionRequestImplCopyWithImpl<$Res>
    extends
        _$RegistrarRecepcionRequestCopyWithImpl<
          $Res,
          _$RegistrarRecepcionRequestImpl
        >
    implements _$$RegistrarRecepcionRequestImplCopyWith<$Res> {
  __$$RegistrarRecepcionRequestImplCopyWithImpl(
    _$RegistrarRecepcionRequestImpl _value,
    $Res Function(_$RegistrarRecepcionRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegistrarRecepcionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagenObjectName = null,
    Object? puntoServicioId = null,
    Object? vendedor = freezed,
    Object? cliente = freezed,
    Object? telefono = freezed,
    Object? diaEntrega = freezed,
    Object? destino = freezed,
    Object? encomendista = freezed,
    Object? precioProducto = freezed,
    Object? costoEnvio = null,
    Object? total = freezed,
    Object? tipoCobroEnvio = null,
    Object? montoACobrarCliente = null,
    Object? montoParaVendedor = null,
    Object? notas = freezed,
  }) {
    return _then(
      _$RegistrarRecepcionRequestImpl(
        imagenObjectName: null == imagenObjectName
            ? _value.imagenObjectName
            : imagenObjectName // ignore: cast_nullable_to_non_nullable
                  as String,
        puntoServicioId: null == puntoServicioId
            ? _value.puntoServicioId
            : puntoServicioId // ignore: cast_nullable_to_non_nullable
                  as int,
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
        costoEnvio: null == costoEnvio
            ? _value.costoEnvio
            : costoEnvio // ignore: cast_nullable_to_non_nullable
                  as double,
        total: freezed == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as double?,
        tipoCobroEnvio: null == tipoCobroEnvio
            ? _value.tipoCobroEnvio
            : tipoCobroEnvio // ignore: cast_nullable_to_non_nullable
                  as TipoCobroEnvio,
        montoACobrarCliente: null == montoACobrarCliente
            ? _value.montoACobrarCliente
            : montoACobrarCliente // ignore: cast_nullable_to_non_nullable
                  as double,
        montoParaVendedor: null == montoParaVendedor
            ? _value.montoParaVendedor
            : montoParaVendedor // ignore: cast_nullable_to_non_nullable
                  as double,
        notas: freezed == notas
            ? _value.notas
            : notas // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RegistrarRecepcionRequestImpl implements _RegistrarRecepcionRequest {
  const _$RegistrarRecepcionRequestImpl({
    @JsonKey(name: 'imagen_object_name') required this.imagenObjectName,
    @JsonKey(name: 'punto_servicio_id') required this.puntoServicioId,
    this.vendedor,
    this.cliente,
    this.telefono,
    @JsonKey(name: 'dia_entrega') this.diaEntrega,
    this.destino,
    this.encomendista,
    @JsonKey(name: 'precio_producto') this.precioProducto,
    @JsonKey(name: 'costo_envio') required this.costoEnvio,
    this.total,
    @JsonKey(name: 'tipo_cobro_envio') required this.tipoCobroEnvio,
    @JsonKey(name: 'monto_cobrar_cliente') required this.montoACobrarCliente,
    @JsonKey(name: 'monto_para_vendedor') required this.montoParaVendedor,
    this.notas,
  });

  factory _$RegistrarRecepcionRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegistrarRecepcionRequestImplFromJson(json);

  @override
  @JsonKey(name: 'imagen_object_name')
  final String imagenObjectName;
  @override
  @JsonKey(name: 'punto_servicio_id')
  final int puntoServicioId;
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
  @JsonKey(name: 'precio_producto')
  final double? precioProducto;
  @override
  @JsonKey(name: 'costo_envio')
  final double costoEnvio;
  @override
  final double? total;
  @override
  @JsonKey(name: 'tipo_cobro_envio')
  final TipoCobroEnvio tipoCobroEnvio;
  @override
  @JsonKey(name: 'monto_cobrar_cliente')
  final double montoACobrarCliente;
  @override
  @JsonKey(name: 'monto_para_vendedor')
  final double montoParaVendedor;
  @override
  final String? notas;

  @override
  String toString() {
    return 'RegistrarRecepcionRequest(imagenObjectName: $imagenObjectName, puntoServicioId: $puntoServicioId, vendedor: $vendedor, cliente: $cliente, telefono: $telefono, diaEntrega: $diaEntrega, destino: $destino, encomendista: $encomendista, precioProducto: $precioProducto, costoEnvio: $costoEnvio, total: $total, tipoCobroEnvio: $tipoCobroEnvio, montoACobrarCliente: $montoACobrarCliente, montoParaVendedor: $montoParaVendedor, notas: $notas)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrarRecepcionRequestImpl &&
            (identical(other.imagenObjectName, imagenObjectName) ||
                other.imagenObjectName == imagenObjectName) &&
            (identical(other.puntoServicioId, puntoServicioId) ||
                other.puntoServicioId == puntoServicioId) &&
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
            (identical(other.tipoCobroEnvio, tipoCobroEnvio) ||
                other.tipoCobroEnvio == tipoCobroEnvio) &&
            (identical(other.montoACobrarCliente, montoACobrarCliente) ||
                other.montoACobrarCliente == montoACobrarCliente) &&
            (identical(other.montoParaVendedor, montoParaVendedor) ||
                other.montoParaVendedor == montoParaVendedor) &&
            (identical(other.notas, notas) || other.notas == notas));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    imagenObjectName,
    puntoServicioId,
    vendedor,
    cliente,
    telefono,
    diaEntrega,
    destino,
    encomendista,
    precioProducto,
    costoEnvio,
    total,
    tipoCobroEnvio,
    montoACobrarCliente,
    montoParaVendedor,
    notas,
  );

  /// Create a copy of RegistrarRecepcionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrarRecepcionRequestImplCopyWith<_$RegistrarRecepcionRequestImpl>
  get copyWith =>
      __$$RegistrarRecepcionRequestImplCopyWithImpl<
        _$RegistrarRecepcionRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegistrarRecepcionRequestImplToJson(this);
  }
}

abstract class _RegistrarRecepcionRequest implements RegistrarRecepcionRequest {
  const factory _RegistrarRecepcionRequest({
    @JsonKey(name: 'imagen_object_name') required final String imagenObjectName,
    @JsonKey(name: 'punto_servicio_id') required final int puntoServicioId,
    final String? vendedor,
    final String? cliente,
    final String? telefono,
    @JsonKey(name: 'dia_entrega') final String? diaEntrega,
    final String? destino,
    final String? encomendista,
    @JsonKey(name: 'precio_producto') final double? precioProducto,
    @JsonKey(name: 'costo_envio') required final double costoEnvio,
    final double? total,
    @JsonKey(name: 'tipo_cobro_envio')
    required final TipoCobroEnvio tipoCobroEnvio,
    @JsonKey(name: 'monto_cobrar_cliente')
    required final double montoACobrarCliente,
    @JsonKey(name: 'monto_para_vendedor')
    required final double montoParaVendedor,
    final String? notas,
  }) = _$RegistrarRecepcionRequestImpl;

  factory _RegistrarRecepcionRequest.fromJson(Map<String, dynamic> json) =
      _$RegistrarRecepcionRequestImpl.fromJson;

  @override
  @JsonKey(name: 'imagen_object_name')
  String get imagenObjectName;
  @override
  @JsonKey(name: 'punto_servicio_id')
  int get puntoServicioId;
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
  @JsonKey(name: 'precio_producto')
  double? get precioProducto;
  @override
  @JsonKey(name: 'costo_envio')
  double get costoEnvio;
  @override
  double? get total;
  @override
  @JsonKey(name: 'tipo_cobro_envio')
  TipoCobroEnvio get tipoCobroEnvio;
  @override
  @JsonKey(name: 'monto_cobrar_cliente')
  double get montoACobrarCliente;
  @override
  @JsonKey(name: 'monto_para_vendedor')
  double get montoParaVendedor;
  @override
  String? get notas;

  /// Create a copy of RegistrarRecepcionRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegistrarRecepcionRequestImplCopyWith<_$RegistrarRecepcionRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
