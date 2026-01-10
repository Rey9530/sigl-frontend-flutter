// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ocr_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OcrResult _$OcrResultFromJson(Map<String, dynamic> json) {
  return _OcrResult.fromJson(json);
}

/// @nodoc
mixin _$OcrResult {
  @JsonKey(name: 'remitente_nombre')
  String? get remitenteNombre => throw _privateConstructorUsedError;
  @JsonKey(name: 'remitente_telefono')
  String? get remitenteTelefono => throw _privateConstructorUsedError;
  @JsonKey(name: 'destinatario_nombre')
  String? get destinatarioNombre => throw _privateConstructorUsedError;
  @JsonKey(name: 'destinatario_telefono')
  String? get destinatarioTelefono => throw _privateConstructorUsedError;
  @JsonKey(name: 'destino_ciudad')
  String? get destinoCiudad => throw _privateConstructorUsedError;
  int get confianza => throw _privateConstructorUsedError;
  @JsonKey(name: 'texto_crudo')
  String get textoCrudo => throw _privateConstructorUsedError;

  /// Serializes this OcrResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OcrResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OcrResultCopyWith<OcrResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OcrResultCopyWith<$Res> {
  factory $OcrResultCopyWith(OcrResult value, $Res Function(OcrResult) then) =
      _$OcrResultCopyWithImpl<$Res, OcrResult>;
  @useResult
  $Res call({
    @JsonKey(name: 'remitente_nombre') String? remitenteNombre,
    @JsonKey(name: 'remitente_telefono') String? remitenteTelefono,
    @JsonKey(name: 'destinatario_nombre') String? destinatarioNombre,
    @JsonKey(name: 'destinatario_telefono') String? destinatarioTelefono,
    @JsonKey(name: 'destino_ciudad') String? destinoCiudad,
    int confianza,
    @JsonKey(name: 'texto_crudo') String textoCrudo,
  });
}

/// @nodoc
class _$OcrResultCopyWithImpl<$Res, $Val extends OcrResult>
    implements $OcrResultCopyWith<$Res> {
  _$OcrResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OcrResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remitenteNombre = freezed,
    Object? remitenteTelefono = freezed,
    Object? destinatarioNombre = freezed,
    Object? destinatarioTelefono = freezed,
    Object? destinoCiudad = freezed,
    Object? confianza = null,
    Object? textoCrudo = null,
  }) {
    return _then(
      _value.copyWith(
            remitenteNombre: freezed == remitenteNombre
                ? _value.remitenteNombre
                : remitenteNombre // ignore: cast_nullable_to_non_nullable
                      as String?,
            remitenteTelefono: freezed == remitenteTelefono
                ? _value.remitenteTelefono
                : remitenteTelefono // ignore: cast_nullable_to_non_nullable
                      as String?,
            destinatarioNombre: freezed == destinatarioNombre
                ? _value.destinatarioNombre
                : destinatarioNombre // ignore: cast_nullable_to_non_nullable
                      as String?,
            destinatarioTelefono: freezed == destinatarioTelefono
                ? _value.destinatarioTelefono
                : destinatarioTelefono // ignore: cast_nullable_to_non_nullable
                      as String?,
            destinoCiudad: freezed == destinoCiudad
                ? _value.destinoCiudad
                : destinoCiudad // ignore: cast_nullable_to_non_nullable
                      as String?,
            confianza: null == confianza
                ? _value.confianza
                : confianza // ignore: cast_nullable_to_non_nullable
                      as int,
            textoCrudo: null == textoCrudo
                ? _value.textoCrudo
                : textoCrudo // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OcrResultImplCopyWith<$Res>
    implements $OcrResultCopyWith<$Res> {
  factory _$$OcrResultImplCopyWith(
    _$OcrResultImpl value,
    $Res Function(_$OcrResultImpl) then,
  ) = __$$OcrResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'remitente_nombre') String? remitenteNombre,
    @JsonKey(name: 'remitente_telefono') String? remitenteTelefono,
    @JsonKey(name: 'destinatario_nombre') String? destinatarioNombre,
    @JsonKey(name: 'destinatario_telefono') String? destinatarioTelefono,
    @JsonKey(name: 'destino_ciudad') String? destinoCiudad,
    int confianza,
    @JsonKey(name: 'texto_crudo') String textoCrudo,
  });
}

/// @nodoc
class __$$OcrResultImplCopyWithImpl<$Res>
    extends _$OcrResultCopyWithImpl<$Res, _$OcrResultImpl>
    implements _$$OcrResultImplCopyWith<$Res> {
  __$$OcrResultImplCopyWithImpl(
    _$OcrResultImpl _value,
    $Res Function(_$OcrResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OcrResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remitenteNombre = freezed,
    Object? remitenteTelefono = freezed,
    Object? destinatarioNombre = freezed,
    Object? destinatarioTelefono = freezed,
    Object? destinoCiudad = freezed,
    Object? confianza = null,
    Object? textoCrudo = null,
  }) {
    return _then(
      _$OcrResultImpl(
        remitenteNombre: freezed == remitenteNombre
            ? _value.remitenteNombre
            : remitenteNombre // ignore: cast_nullable_to_non_nullable
                  as String?,
        remitenteTelefono: freezed == remitenteTelefono
            ? _value.remitenteTelefono
            : remitenteTelefono // ignore: cast_nullable_to_non_nullable
                  as String?,
        destinatarioNombre: freezed == destinatarioNombre
            ? _value.destinatarioNombre
            : destinatarioNombre // ignore: cast_nullable_to_non_nullable
                  as String?,
        destinatarioTelefono: freezed == destinatarioTelefono
            ? _value.destinatarioTelefono
            : destinatarioTelefono // ignore: cast_nullable_to_non_nullable
                  as String?,
        destinoCiudad: freezed == destinoCiudad
            ? _value.destinoCiudad
            : destinoCiudad // ignore: cast_nullable_to_non_nullable
                  as String?,
        confianza: null == confianza
            ? _value.confianza
            : confianza // ignore: cast_nullable_to_non_nullable
                  as int,
        textoCrudo: null == textoCrudo
            ? _value.textoCrudo
            : textoCrudo // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OcrResultImpl implements _OcrResult {
  const _$OcrResultImpl({
    @JsonKey(name: 'remitente_nombre') this.remitenteNombre,
    @JsonKey(name: 'remitente_telefono') this.remitenteTelefono,
    @JsonKey(name: 'destinatario_nombre') this.destinatarioNombre,
    @JsonKey(name: 'destinatario_telefono') this.destinatarioTelefono,
    @JsonKey(name: 'destino_ciudad') this.destinoCiudad,
    required this.confianza,
    @JsonKey(name: 'texto_crudo') required this.textoCrudo,
  });

  factory _$OcrResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$OcrResultImplFromJson(json);

  @override
  @JsonKey(name: 'remitente_nombre')
  final String? remitenteNombre;
  @override
  @JsonKey(name: 'remitente_telefono')
  final String? remitenteTelefono;
  @override
  @JsonKey(name: 'destinatario_nombre')
  final String? destinatarioNombre;
  @override
  @JsonKey(name: 'destinatario_telefono')
  final String? destinatarioTelefono;
  @override
  @JsonKey(name: 'destino_ciudad')
  final String? destinoCiudad;
  @override
  final int confianza;
  @override
  @JsonKey(name: 'texto_crudo')
  final String textoCrudo;

  @override
  String toString() {
    return 'OcrResult(remitenteNombre: $remitenteNombre, remitenteTelefono: $remitenteTelefono, destinatarioNombre: $destinatarioNombre, destinatarioTelefono: $destinatarioTelefono, destinoCiudad: $destinoCiudad, confianza: $confianza, textoCrudo: $textoCrudo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OcrResultImpl &&
            (identical(other.remitenteNombre, remitenteNombre) ||
                other.remitenteNombre == remitenteNombre) &&
            (identical(other.remitenteTelefono, remitenteTelefono) ||
                other.remitenteTelefono == remitenteTelefono) &&
            (identical(other.destinatarioNombre, destinatarioNombre) ||
                other.destinatarioNombre == destinatarioNombre) &&
            (identical(other.destinatarioTelefono, destinatarioTelefono) ||
                other.destinatarioTelefono == destinatarioTelefono) &&
            (identical(other.destinoCiudad, destinoCiudad) ||
                other.destinoCiudad == destinoCiudad) &&
            (identical(other.confianza, confianza) ||
                other.confianza == confianza) &&
            (identical(other.textoCrudo, textoCrudo) ||
                other.textoCrudo == textoCrudo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    remitenteNombre,
    remitenteTelefono,
    destinatarioNombre,
    destinatarioTelefono,
    destinoCiudad,
    confianza,
    textoCrudo,
  );

  /// Create a copy of OcrResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OcrResultImplCopyWith<_$OcrResultImpl> get copyWith =>
      __$$OcrResultImplCopyWithImpl<_$OcrResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OcrResultImplToJson(this);
  }
}

abstract class _OcrResult implements OcrResult {
  const factory _OcrResult({
    @JsonKey(name: 'remitente_nombre') final String? remitenteNombre,
    @JsonKey(name: 'remitente_telefono') final String? remitenteTelefono,
    @JsonKey(name: 'destinatario_nombre') final String? destinatarioNombre,
    @JsonKey(name: 'destinatario_telefono') final String? destinatarioTelefono,
    @JsonKey(name: 'destino_ciudad') final String? destinoCiudad,
    required final int confianza,
    @JsonKey(name: 'texto_crudo') required final String textoCrudo,
  }) = _$OcrResultImpl;

  factory _OcrResult.fromJson(Map<String, dynamic> json) =
      _$OcrResultImpl.fromJson;

  @override
  @JsonKey(name: 'remitente_nombre')
  String? get remitenteNombre;
  @override
  @JsonKey(name: 'remitente_telefono')
  String? get remitenteTelefono;
  @override
  @JsonKey(name: 'destinatario_nombre')
  String? get destinatarioNombre;
  @override
  @JsonKey(name: 'destinatario_telefono')
  String? get destinatarioTelefono;
  @override
  @JsonKey(name: 'destino_ciudad')
  String? get destinoCiudad;
  @override
  int get confianza;
  @override
  @JsonKey(name: 'texto_crudo')
  String get textoCrudo;

  /// Create a copy of OcrResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OcrResultImplCopyWith<_$OcrResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
