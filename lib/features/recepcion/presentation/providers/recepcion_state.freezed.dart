// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recepcion_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RecepcionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() capturandoImagen,
    required TResult Function() procesandoOcr,
    required TResult Function(OcrResult resultado, String imagenPath)
    ocrCompletado,
    required TResult Function() cargandoPuntos,
    required TResult Function(
      OcrResult ocrResult,
      String imagenPath,
      List<Punto> puntos,
    )
    validandoDatos,
    required TResult Function() guardandoPaquete,
    required TResult Function(Paquete paquete) paqueteCreado,
    required TResult Function(String mensaje, String? imagenPath) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? capturandoImagen,
    TResult? Function()? procesandoOcr,
    TResult? Function(OcrResult resultado, String imagenPath)? ocrCompletado,
    TResult? Function()? cargandoPuntos,
    TResult? Function(
      OcrResult ocrResult,
      String imagenPath,
      List<Punto> puntos,
    )?
    validandoDatos,
    TResult? Function()? guardandoPaquete,
    TResult? Function(Paquete paquete)? paqueteCreado,
    TResult? Function(String mensaje, String? imagenPath)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? capturandoImagen,
    TResult Function()? procesandoOcr,
    TResult Function(OcrResult resultado, String imagenPath)? ocrCompletado,
    TResult Function()? cargandoPuntos,
    TResult Function(
      OcrResult ocrResult,
      String imagenPath,
      List<Punto> puntos,
    )?
    validandoDatos,
    TResult Function()? guardandoPaquete,
    TResult Function(Paquete paquete)? paqueteCreado,
    TResult Function(String mensaje, String? imagenPath)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CapturandoImagen value) capturandoImagen,
    required TResult Function(_ProcesandoOcr value) procesandoOcr,
    required TResult Function(_OcrCompletado value) ocrCompletado,
    required TResult Function(_CargandoPuntos value) cargandoPuntos,
    required TResult Function(_ValidandoDatos value) validandoDatos,
    required TResult Function(_GuardandoPaquete value) guardandoPaquete,
    required TResult Function(_PaqueteCreado value) paqueteCreado,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CapturandoImagen value)? capturandoImagen,
    TResult? Function(_ProcesandoOcr value)? procesandoOcr,
    TResult? Function(_OcrCompletado value)? ocrCompletado,
    TResult? Function(_CargandoPuntos value)? cargandoPuntos,
    TResult? Function(_ValidandoDatos value)? validandoDatos,
    TResult? Function(_GuardandoPaquete value)? guardandoPaquete,
    TResult? Function(_PaqueteCreado value)? paqueteCreado,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CapturandoImagen value)? capturandoImagen,
    TResult Function(_ProcesandoOcr value)? procesandoOcr,
    TResult Function(_OcrCompletado value)? ocrCompletado,
    TResult Function(_CargandoPuntos value)? cargandoPuntos,
    TResult Function(_ValidandoDatos value)? validandoDatos,
    TResult Function(_GuardandoPaquete value)? guardandoPaquete,
    TResult Function(_PaqueteCreado value)? paqueteCreado,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecepcionStateCopyWith<$Res> {
  factory $RecepcionStateCopyWith(
    RecepcionState value,
    $Res Function(RecepcionState) then,
  ) = _$RecepcionStateCopyWithImpl<$Res, RecepcionState>;
}

/// @nodoc
class _$RecepcionStateCopyWithImpl<$Res, $Val extends RecepcionState>
    implements $RecepcionStateCopyWith<$Res> {
  _$RecepcionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecepcionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$RecepcionStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecepcionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'RecepcionState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() capturandoImagen,
    required TResult Function() procesandoOcr,
    required TResult Function(OcrResult resultado, String imagenPath)
    ocrCompletado,
    required TResult Function() cargandoPuntos,
    required TResult Function(
      OcrResult ocrResult,
      String imagenPath,
      List<Punto> puntos,
    )
    validandoDatos,
    required TResult Function() guardandoPaquete,
    required TResult Function(Paquete paquete) paqueteCreado,
    required TResult Function(String mensaje, String? imagenPath) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? capturandoImagen,
    TResult? Function()? procesandoOcr,
    TResult? Function(OcrResult resultado, String imagenPath)? ocrCompletado,
    TResult? Function()? cargandoPuntos,
    TResult? Function(
      OcrResult ocrResult,
      String imagenPath,
      List<Punto> puntos,
    )?
    validandoDatos,
    TResult? Function()? guardandoPaquete,
    TResult? Function(Paquete paquete)? paqueteCreado,
    TResult? Function(String mensaje, String? imagenPath)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? capturandoImagen,
    TResult Function()? procesandoOcr,
    TResult Function(OcrResult resultado, String imagenPath)? ocrCompletado,
    TResult Function()? cargandoPuntos,
    TResult Function(
      OcrResult ocrResult,
      String imagenPath,
      List<Punto> puntos,
    )?
    validandoDatos,
    TResult Function()? guardandoPaquete,
    TResult Function(Paquete paquete)? paqueteCreado,
    TResult Function(String mensaje, String? imagenPath)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CapturandoImagen value) capturandoImagen,
    required TResult Function(_ProcesandoOcr value) procesandoOcr,
    required TResult Function(_OcrCompletado value) ocrCompletado,
    required TResult Function(_CargandoPuntos value) cargandoPuntos,
    required TResult Function(_ValidandoDatos value) validandoDatos,
    required TResult Function(_GuardandoPaquete value) guardandoPaquete,
    required TResult Function(_PaqueteCreado value) paqueteCreado,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CapturandoImagen value)? capturandoImagen,
    TResult? Function(_ProcesandoOcr value)? procesandoOcr,
    TResult? Function(_OcrCompletado value)? ocrCompletado,
    TResult? Function(_CargandoPuntos value)? cargandoPuntos,
    TResult? Function(_ValidandoDatos value)? validandoDatos,
    TResult? Function(_GuardandoPaquete value)? guardandoPaquete,
    TResult? Function(_PaqueteCreado value)? paqueteCreado,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CapturandoImagen value)? capturandoImagen,
    TResult Function(_ProcesandoOcr value)? procesandoOcr,
    TResult Function(_OcrCompletado value)? ocrCompletado,
    TResult Function(_CargandoPuntos value)? cargandoPuntos,
    TResult Function(_ValidandoDatos value)? validandoDatos,
    TResult Function(_GuardandoPaquete value)? guardandoPaquete,
    TResult Function(_PaqueteCreado value)? paqueteCreado,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RecepcionState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$CapturandoImagenImplCopyWith<$Res> {
  factory _$$CapturandoImagenImplCopyWith(
    _$CapturandoImagenImpl value,
    $Res Function(_$CapturandoImagenImpl) then,
  ) = __$$CapturandoImagenImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CapturandoImagenImplCopyWithImpl<$Res>
    extends _$RecepcionStateCopyWithImpl<$Res, _$CapturandoImagenImpl>
    implements _$$CapturandoImagenImplCopyWith<$Res> {
  __$$CapturandoImagenImplCopyWithImpl(
    _$CapturandoImagenImpl _value,
    $Res Function(_$CapturandoImagenImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecepcionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CapturandoImagenImpl implements _CapturandoImagen {
  const _$CapturandoImagenImpl();

  @override
  String toString() {
    return 'RecepcionState.capturandoImagen()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CapturandoImagenImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() capturandoImagen,
    required TResult Function() procesandoOcr,
    required TResult Function(OcrResult resultado, String imagenPath)
    ocrCompletado,
    required TResult Function() cargandoPuntos,
    required TResult Function(
      OcrResult ocrResult,
      String imagenPath,
      List<Punto> puntos,
    )
    validandoDatos,
    required TResult Function() guardandoPaquete,
    required TResult Function(Paquete paquete) paqueteCreado,
    required TResult Function(String mensaje, String? imagenPath) error,
  }) {
    return capturandoImagen();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? capturandoImagen,
    TResult? Function()? procesandoOcr,
    TResult? Function(OcrResult resultado, String imagenPath)? ocrCompletado,
    TResult? Function()? cargandoPuntos,
    TResult? Function(
      OcrResult ocrResult,
      String imagenPath,
      List<Punto> puntos,
    )?
    validandoDatos,
    TResult? Function()? guardandoPaquete,
    TResult? Function(Paquete paquete)? paqueteCreado,
    TResult? Function(String mensaje, String? imagenPath)? error,
  }) {
    return capturandoImagen?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? capturandoImagen,
    TResult Function()? procesandoOcr,
    TResult Function(OcrResult resultado, String imagenPath)? ocrCompletado,
    TResult Function()? cargandoPuntos,
    TResult Function(
      OcrResult ocrResult,
      String imagenPath,
      List<Punto> puntos,
    )?
    validandoDatos,
    TResult Function()? guardandoPaquete,
    TResult Function(Paquete paquete)? paqueteCreado,
    TResult Function(String mensaje, String? imagenPath)? error,
    required TResult orElse(),
  }) {
    if (capturandoImagen != null) {
      return capturandoImagen();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CapturandoImagen value) capturandoImagen,
    required TResult Function(_ProcesandoOcr value) procesandoOcr,
    required TResult Function(_OcrCompletado value) ocrCompletado,
    required TResult Function(_CargandoPuntos value) cargandoPuntos,
    required TResult Function(_ValidandoDatos value) validandoDatos,
    required TResult Function(_GuardandoPaquete value) guardandoPaquete,
    required TResult Function(_PaqueteCreado value) paqueteCreado,
    required TResult Function(_Error value) error,
  }) {
    return capturandoImagen(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CapturandoImagen value)? capturandoImagen,
    TResult? Function(_ProcesandoOcr value)? procesandoOcr,
    TResult? Function(_OcrCompletado value)? ocrCompletado,
    TResult? Function(_CargandoPuntos value)? cargandoPuntos,
    TResult? Function(_ValidandoDatos value)? validandoDatos,
    TResult? Function(_GuardandoPaquete value)? guardandoPaquete,
    TResult? Function(_PaqueteCreado value)? paqueteCreado,
    TResult? Function(_Error value)? error,
  }) {
    return capturandoImagen?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CapturandoImagen value)? capturandoImagen,
    TResult Function(_ProcesandoOcr value)? procesandoOcr,
    TResult Function(_OcrCompletado value)? ocrCompletado,
    TResult Function(_CargandoPuntos value)? cargandoPuntos,
    TResult Function(_ValidandoDatos value)? validandoDatos,
    TResult Function(_GuardandoPaquete value)? guardandoPaquete,
    TResult Function(_PaqueteCreado value)? paqueteCreado,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (capturandoImagen != null) {
      return capturandoImagen(this);
    }
    return orElse();
  }
}

abstract class _CapturandoImagen implements RecepcionState {
  const factory _CapturandoImagen() = _$CapturandoImagenImpl;
}

/// @nodoc
abstract class _$$ProcesandoOcrImplCopyWith<$Res> {
  factory _$$ProcesandoOcrImplCopyWith(
    _$ProcesandoOcrImpl value,
    $Res Function(_$ProcesandoOcrImpl) then,
  ) = __$$ProcesandoOcrImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProcesandoOcrImplCopyWithImpl<$Res>
    extends _$RecepcionStateCopyWithImpl<$Res, _$ProcesandoOcrImpl>
    implements _$$ProcesandoOcrImplCopyWith<$Res> {
  __$$ProcesandoOcrImplCopyWithImpl(
    _$ProcesandoOcrImpl _value,
    $Res Function(_$ProcesandoOcrImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecepcionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProcesandoOcrImpl implements _ProcesandoOcr {
  const _$ProcesandoOcrImpl();

  @override
  String toString() {
    return 'RecepcionState.procesandoOcr()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProcesandoOcrImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() capturandoImagen,
    required TResult Function() procesandoOcr,
    required TResult Function(OcrResult resultado, String imagenPath)
    ocrCompletado,
    required TResult Function() cargandoPuntos,
    required TResult Function(
      OcrResult ocrResult,
      String imagenPath,
      List<Punto> puntos,
    )
    validandoDatos,
    required TResult Function() guardandoPaquete,
    required TResult Function(Paquete paquete) paqueteCreado,
    required TResult Function(String mensaje, String? imagenPath) error,
  }) {
    return procesandoOcr();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? capturandoImagen,
    TResult? Function()? procesandoOcr,
    TResult? Function(OcrResult resultado, String imagenPath)? ocrCompletado,
    TResult? Function()? cargandoPuntos,
    TResult? Function(
      OcrResult ocrResult,
      String imagenPath,
      List<Punto> puntos,
    )?
    validandoDatos,
    TResult? Function()? guardandoPaquete,
    TResult? Function(Paquete paquete)? paqueteCreado,
    TResult? Function(String mensaje, String? imagenPath)? error,
  }) {
    return procesandoOcr?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? capturandoImagen,
    TResult Function()? procesandoOcr,
    TResult Function(OcrResult resultado, String imagenPath)? ocrCompletado,
    TResult Function()? cargandoPuntos,
    TResult Function(
      OcrResult ocrResult,
      String imagenPath,
      List<Punto> puntos,
    )?
    validandoDatos,
    TResult Function()? guardandoPaquete,
    TResult Function(Paquete paquete)? paqueteCreado,
    TResult Function(String mensaje, String? imagenPath)? error,
    required TResult orElse(),
  }) {
    if (procesandoOcr != null) {
      return procesandoOcr();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CapturandoImagen value) capturandoImagen,
    required TResult Function(_ProcesandoOcr value) procesandoOcr,
    required TResult Function(_OcrCompletado value) ocrCompletado,
    required TResult Function(_CargandoPuntos value) cargandoPuntos,
    required TResult Function(_ValidandoDatos value) validandoDatos,
    required TResult Function(_GuardandoPaquete value) guardandoPaquete,
    required TResult Function(_PaqueteCreado value) paqueteCreado,
    required TResult Function(_Error value) error,
  }) {
    return procesandoOcr(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CapturandoImagen value)? capturandoImagen,
    TResult? Function(_ProcesandoOcr value)? procesandoOcr,
    TResult? Function(_OcrCompletado value)? ocrCompletado,
    TResult? Function(_CargandoPuntos value)? cargandoPuntos,
    TResult? Function(_ValidandoDatos value)? validandoDatos,
    TResult? Function(_GuardandoPaquete value)? guardandoPaquete,
    TResult? Function(_PaqueteCreado value)? paqueteCreado,
    TResult? Function(_Error value)? error,
  }) {
    return procesandoOcr?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CapturandoImagen value)? capturandoImagen,
    TResult Function(_ProcesandoOcr value)? procesandoOcr,
    TResult Function(_OcrCompletado value)? ocrCompletado,
    TResult Function(_CargandoPuntos value)? cargandoPuntos,
    TResult Function(_ValidandoDatos value)? validandoDatos,
    TResult Function(_GuardandoPaquete value)? guardandoPaquete,
    TResult Function(_PaqueteCreado value)? paqueteCreado,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (procesandoOcr != null) {
      return procesandoOcr(this);
    }
    return orElse();
  }
}

abstract class _ProcesandoOcr implements RecepcionState {
  const factory _ProcesandoOcr() = _$ProcesandoOcrImpl;
}

/// @nodoc
abstract class _$$OcrCompletadoImplCopyWith<$Res> {
  factory _$$OcrCompletadoImplCopyWith(
    _$OcrCompletadoImpl value,
    $Res Function(_$OcrCompletadoImpl) then,
  ) = __$$OcrCompletadoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OcrResult resultado, String imagenPath});

  $OcrResultCopyWith<$Res> get resultado;
}

/// @nodoc
class __$$OcrCompletadoImplCopyWithImpl<$Res>
    extends _$RecepcionStateCopyWithImpl<$Res, _$OcrCompletadoImpl>
    implements _$$OcrCompletadoImplCopyWith<$Res> {
  __$$OcrCompletadoImplCopyWithImpl(
    _$OcrCompletadoImpl _value,
    $Res Function(_$OcrCompletadoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecepcionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? resultado = null, Object? imagenPath = null}) {
    return _then(
      _$OcrCompletadoImpl(
        resultado: null == resultado
            ? _value.resultado
            : resultado // ignore: cast_nullable_to_non_nullable
                  as OcrResult,
        imagenPath: null == imagenPath
            ? _value.imagenPath
            : imagenPath // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }

  /// Create a copy of RecepcionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrResultCopyWith<$Res> get resultado {
    return $OcrResultCopyWith<$Res>(_value.resultado, (value) {
      return _then(_value.copyWith(resultado: value));
    });
  }
}

/// @nodoc

class _$OcrCompletadoImpl implements _OcrCompletado {
  const _$OcrCompletadoImpl({
    required this.resultado,
    required this.imagenPath,
  });

  @override
  final OcrResult resultado;
  @override
  final String imagenPath;

  @override
  String toString() {
    return 'RecepcionState.ocrCompletado(resultado: $resultado, imagenPath: $imagenPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OcrCompletadoImpl &&
            (identical(other.resultado, resultado) ||
                other.resultado == resultado) &&
            (identical(other.imagenPath, imagenPath) ||
                other.imagenPath == imagenPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, resultado, imagenPath);

  /// Create a copy of RecepcionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OcrCompletadoImplCopyWith<_$OcrCompletadoImpl> get copyWith =>
      __$$OcrCompletadoImplCopyWithImpl<_$OcrCompletadoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() capturandoImagen,
    required TResult Function() procesandoOcr,
    required TResult Function(OcrResult resultado, String imagenPath)
    ocrCompletado,
    required TResult Function() cargandoPuntos,
    required TResult Function(
      OcrResult ocrResult,
      String imagenPath,
      List<Punto> puntos,
    )
    validandoDatos,
    required TResult Function() guardandoPaquete,
    required TResult Function(Paquete paquete) paqueteCreado,
    required TResult Function(String mensaje, String? imagenPath) error,
  }) {
    return ocrCompletado(resultado, imagenPath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? capturandoImagen,
    TResult? Function()? procesandoOcr,
    TResult? Function(OcrResult resultado, String imagenPath)? ocrCompletado,
    TResult? Function()? cargandoPuntos,
    TResult? Function(
      OcrResult ocrResult,
      String imagenPath,
      List<Punto> puntos,
    )?
    validandoDatos,
    TResult? Function()? guardandoPaquete,
    TResult? Function(Paquete paquete)? paqueteCreado,
    TResult? Function(String mensaje, String? imagenPath)? error,
  }) {
    return ocrCompletado?.call(resultado, imagenPath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? capturandoImagen,
    TResult Function()? procesandoOcr,
    TResult Function(OcrResult resultado, String imagenPath)? ocrCompletado,
    TResult Function()? cargandoPuntos,
    TResult Function(
      OcrResult ocrResult,
      String imagenPath,
      List<Punto> puntos,
    )?
    validandoDatos,
    TResult Function()? guardandoPaquete,
    TResult Function(Paquete paquete)? paqueteCreado,
    TResult Function(String mensaje, String? imagenPath)? error,
    required TResult orElse(),
  }) {
    if (ocrCompletado != null) {
      return ocrCompletado(resultado, imagenPath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CapturandoImagen value) capturandoImagen,
    required TResult Function(_ProcesandoOcr value) procesandoOcr,
    required TResult Function(_OcrCompletado value) ocrCompletado,
    required TResult Function(_CargandoPuntos value) cargandoPuntos,
    required TResult Function(_ValidandoDatos value) validandoDatos,
    required TResult Function(_GuardandoPaquete value) guardandoPaquete,
    required TResult Function(_PaqueteCreado value) paqueteCreado,
    required TResult Function(_Error value) error,
  }) {
    return ocrCompletado(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CapturandoImagen value)? capturandoImagen,
    TResult? Function(_ProcesandoOcr value)? procesandoOcr,
    TResult? Function(_OcrCompletado value)? ocrCompletado,
    TResult? Function(_CargandoPuntos value)? cargandoPuntos,
    TResult? Function(_ValidandoDatos value)? validandoDatos,
    TResult? Function(_GuardandoPaquete value)? guardandoPaquete,
    TResult? Function(_PaqueteCreado value)? paqueteCreado,
    TResult? Function(_Error value)? error,
  }) {
    return ocrCompletado?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CapturandoImagen value)? capturandoImagen,
    TResult Function(_ProcesandoOcr value)? procesandoOcr,
    TResult Function(_OcrCompletado value)? ocrCompletado,
    TResult Function(_CargandoPuntos value)? cargandoPuntos,
    TResult Function(_ValidandoDatos value)? validandoDatos,
    TResult Function(_GuardandoPaquete value)? guardandoPaquete,
    TResult Function(_PaqueteCreado value)? paqueteCreado,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (ocrCompletado != null) {
      return ocrCompletado(this);
    }
    return orElse();
  }
}

abstract class _OcrCompletado implements RecepcionState {
  const factory _OcrCompletado({
    required final OcrResult resultado,
    required final String imagenPath,
  }) = _$OcrCompletadoImpl;

  OcrResult get resultado;
  String get imagenPath;

  /// Create a copy of RecepcionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OcrCompletadoImplCopyWith<_$OcrCompletadoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CargandoPuntosImplCopyWith<$Res> {
  factory _$$CargandoPuntosImplCopyWith(
    _$CargandoPuntosImpl value,
    $Res Function(_$CargandoPuntosImpl) then,
  ) = __$$CargandoPuntosImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CargandoPuntosImplCopyWithImpl<$Res>
    extends _$RecepcionStateCopyWithImpl<$Res, _$CargandoPuntosImpl>
    implements _$$CargandoPuntosImplCopyWith<$Res> {
  __$$CargandoPuntosImplCopyWithImpl(
    _$CargandoPuntosImpl _value,
    $Res Function(_$CargandoPuntosImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecepcionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CargandoPuntosImpl implements _CargandoPuntos {
  const _$CargandoPuntosImpl();

  @override
  String toString() {
    return 'RecepcionState.cargandoPuntos()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CargandoPuntosImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() capturandoImagen,
    required TResult Function() procesandoOcr,
    required TResult Function(OcrResult resultado, String imagenPath)
    ocrCompletado,
    required TResult Function() cargandoPuntos,
    required TResult Function(
      OcrResult ocrResult,
      String imagenPath,
      List<Punto> puntos,
    )
    validandoDatos,
    required TResult Function() guardandoPaquete,
    required TResult Function(Paquete paquete) paqueteCreado,
    required TResult Function(String mensaje, String? imagenPath) error,
  }) {
    return cargandoPuntos();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? capturandoImagen,
    TResult? Function()? procesandoOcr,
    TResult? Function(OcrResult resultado, String imagenPath)? ocrCompletado,
    TResult? Function()? cargandoPuntos,
    TResult? Function(
      OcrResult ocrResult,
      String imagenPath,
      List<Punto> puntos,
    )?
    validandoDatos,
    TResult? Function()? guardandoPaquete,
    TResult? Function(Paquete paquete)? paqueteCreado,
    TResult? Function(String mensaje, String? imagenPath)? error,
  }) {
    return cargandoPuntos?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? capturandoImagen,
    TResult Function()? procesandoOcr,
    TResult Function(OcrResult resultado, String imagenPath)? ocrCompletado,
    TResult Function()? cargandoPuntos,
    TResult Function(
      OcrResult ocrResult,
      String imagenPath,
      List<Punto> puntos,
    )?
    validandoDatos,
    TResult Function()? guardandoPaquete,
    TResult Function(Paquete paquete)? paqueteCreado,
    TResult Function(String mensaje, String? imagenPath)? error,
    required TResult orElse(),
  }) {
    if (cargandoPuntos != null) {
      return cargandoPuntos();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CapturandoImagen value) capturandoImagen,
    required TResult Function(_ProcesandoOcr value) procesandoOcr,
    required TResult Function(_OcrCompletado value) ocrCompletado,
    required TResult Function(_CargandoPuntos value) cargandoPuntos,
    required TResult Function(_ValidandoDatos value) validandoDatos,
    required TResult Function(_GuardandoPaquete value) guardandoPaquete,
    required TResult Function(_PaqueteCreado value) paqueteCreado,
    required TResult Function(_Error value) error,
  }) {
    return cargandoPuntos(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CapturandoImagen value)? capturandoImagen,
    TResult? Function(_ProcesandoOcr value)? procesandoOcr,
    TResult? Function(_OcrCompletado value)? ocrCompletado,
    TResult? Function(_CargandoPuntos value)? cargandoPuntos,
    TResult? Function(_ValidandoDatos value)? validandoDatos,
    TResult? Function(_GuardandoPaquete value)? guardandoPaquete,
    TResult? Function(_PaqueteCreado value)? paqueteCreado,
    TResult? Function(_Error value)? error,
  }) {
    return cargandoPuntos?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CapturandoImagen value)? capturandoImagen,
    TResult Function(_ProcesandoOcr value)? procesandoOcr,
    TResult Function(_OcrCompletado value)? ocrCompletado,
    TResult Function(_CargandoPuntos value)? cargandoPuntos,
    TResult Function(_ValidandoDatos value)? validandoDatos,
    TResult Function(_GuardandoPaquete value)? guardandoPaquete,
    TResult Function(_PaqueteCreado value)? paqueteCreado,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (cargandoPuntos != null) {
      return cargandoPuntos(this);
    }
    return orElse();
  }
}

abstract class _CargandoPuntos implements RecepcionState {
  const factory _CargandoPuntos() = _$CargandoPuntosImpl;
}

/// @nodoc
abstract class _$$ValidandoDatosImplCopyWith<$Res> {
  factory _$$ValidandoDatosImplCopyWith(
    _$ValidandoDatosImpl value,
    $Res Function(_$ValidandoDatosImpl) then,
  ) = __$$ValidandoDatosImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OcrResult ocrResult, String imagenPath, List<Punto> puntos});

  $OcrResultCopyWith<$Res> get ocrResult;
}

/// @nodoc
class __$$ValidandoDatosImplCopyWithImpl<$Res>
    extends _$RecepcionStateCopyWithImpl<$Res, _$ValidandoDatosImpl>
    implements _$$ValidandoDatosImplCopyWith<$Res> {
  __$$ValidandoDatosImplCopyWithImpl(
    _$ValidandoDatosImpl _value,
    $Res Function(_$ValidandoDatosImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecepcionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ocrResult = null,
    Object? imagenPath = null,
    Object? puntos = null,
  }) {
    return _then(
      _$ValidandoDatosImpl(
        ocrResult: null == ocrResult
            ? _value.ocrResult
            : ocrResult // ignore: cast_nullable_to_non_nullable
                  as OcrResult,
        imagenPath: null == imagenPath
            ? _value.imagenPath
            : imagenPath // ignore: cast_nullable_to_non_nullable
                  as String,
        puntos: null == puntos
            ? _value._puntos
            : puntos // ignore: cast_nullable_to_non_nullable
                  as List<Punto>,
      ),
    );
  }

  /// Create a copy of RecepcionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OcrResultCopyWith<$Res> get ocrResult {
    return $OcrResultCopyWith<$Res>(_value.ocrResult, (value) {
      return _then(_value.copyWith(ocrResult: value));
    });
  }
}

/// @nodoc

class _$ValidandoDatosImpl implements _ValidandoDatos {
  const _$ValidandoDatosImpl({
    required this.ocrResult,
    required this.imagenPath,
    required final List<Punto> puntos,
  }) : _puntos = puntos;

  @override
  final OcrResult ocrResult;
  @override
  final String imagenPath;
  final List<Punto> _puntos;
  @override
  List<Punto> get puntos {
    if (_puntos is EqualUnmodifiableListView) return _puntos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_puntos);
  }

  @override
  String toString() {
    return 'RecepcionState.validandoDatos(ocrResult: $ocrResult, imagenPath: $imagenPath, puntos: $puntos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidandoDatosImpl &&
            (identical(other.ocrResult, ocrResult) ||
                other.ocrResult == ocrResult) &&
            (identical(other.imagenPath, imagenPath) ||
                other.imagenPath == imagenPath) &&
            const DeepCollectionEquality().equals(other._puntos, _puntos));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    ocrResult,
    imagenPath,
    const DeepCollectionEquality().hash(_puntos),
  );

  /// Create a copy of RecepcionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidandoDatosImplCopyWith<_$ValidandoDatosImpl> get copyWith =>
      __$$ValidandoDatosImplCopyWithImpl<_$ValidandoDatosImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() capturandoImagen,
    required TResult Function() procesandoOcr,
    required TResult Function(OcrResult resultado, String imagenPath)
    ocrCompletado,
    required TResult Function() cargandoPuntos,
    required TResult Function(
      OcrResult ocrResult,
      String imagenPath,
      List<Punto> puntos,
    )
    validandoDatos,
    required TResult Function() guardandoPaquete,
    required TResult Function(Paquete paquete) paqueteCreado,
    required TResult Function(String mensaje, String? imagenPath) error,
  }) {
    return validandoDatos(ocrResult, imagenPath, puntos);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? capturandoImagen,
    TResult? Function()? procesandoOcr,
    TResult? Function(OcrResult resultado, String imagenPath)? ocrCompletado,
    TResult? Function()? cargandoPuntos,
    TResult? Function(
      OcrResult ocrResult,
      String imagenPath,
      List<Punto> puntos,
    )?
    validandoDatos,
    TResult? Function()? guardandoPaquete,
    TResult? Function(Paquete paquete)? paqueteCreado,
    TResult? Function(String mensaje, String? imagenPath)? error,
  }) {
    return validandoDatos?.call(ocrResult, imagenPath, puntos);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? capturandoImagen,
    TResult Function()? procesandoOcr,
    TResult Function(OcrResult resultado, String imagenPath)? ocrCompletado,
    TResult Function()? cargandoPuntos,
    TResult Function(
      OcrResult ocrResult,
      String imagenPath,
      List<Punto> puntos,
    )?
    validandoDatos,
    TResult Function()? guardandoPaquete,
    TResult Function(Paquete paquete)? paqueteCreado,
    TResult Function(String mensaje, String? imagenPath)? error,
    required TResult orElse(),
  }) {
    if (validandoDatos != null) {
      return validandoDatos(ocrResult, imagenPath, puntos);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CapturandoImagen value) capturandoImagen,
    required TResult Function(_ProcesandoOcr value) procesandoOcr,
    required TResult Function(_OcrCompletado value) ocrCompletado,
    required TResult Function(_CargandoPuntos value) cargandoPuntos,
    required TResult Function(_ValidandoDatos value) validandoDatos,
    required TResult Function(_GuardandoPaquete value) guardandoPaquete,
    required TResult Function(_PaqueteCreado value) paqueteCreado,
    required TResult Function(_Error value) error,
  }) {
    return validandoDatos(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CapturandoImagen value)? capturandoImagen,
    TResult? Function(_ProcesandoOcr value)? procesandoOcr,
    TResult? Function(_OcrCompletado value)? ocrCompletado,
    TResult? Function(_CargandoPuntos value)? cargandoPuntos,
    TResult? Function(_ValidandoDatos value)? validandoDatos,
    TResult? Function(_GuardandoPaquete value)? guardandoPaquete,
    TResult? Function(_PaqueteCreado value)? paqueteCreado,
    TResult? Function(_Error value)? error,
  }) {
    return validandoDatos?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CapturandoImagen value)? capturandoImagen,
    TResult Function(_ProcesandoOcr value)? procesandoOcr,
    TResult Function(_OcrCompletado value)? ocrCompletado,
    TResult Function(_CargandoPuntos value)? cargandoPuntos,
    TResult Function(_ValidandoDatos value)? validandoDatos,
    TResult Function(_GuardandoPaquete value)? guardandoPaquete,
    TResult Function(_PaqueteCreado value)? paqueteCreado,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (validandoDatos != null) {
      return validandoDatos(this);
    }
    return orElse();
  }
}

abstract class _ValidandoDatos implements RecepcionState {
  const factory _ValidandoDatos({
    required final OcrResult ocrResult,
    required final String imagenPath,
    required final List<Punto> puntos,
  }) = _$ValidandoDatosImpl;

  OcrResult get ocrResult;
  String get imagenPath;
  List<Punto> get puntos;

  /// Create a copy of RecepcionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidandoDatosImplCopyWith<_$ValidandoDatosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GuardandoPaqueteImplCopyWith<$Res> {
  factory _$$GuardandoPaqueteImplCopyWith(
    _$GuardandoPaqueteImpl value,
    $Res Function(_$GuardandoPaqueteImpl) then,
  ) = __$$GuardandoPaqueteImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GuardandoPaqueteImplCopyWithImpl<$Res>
    extends _$RecepcionStateCopyWithImpl<$Res, _$GuardandoPaqueteImpl>
    implements _$$GuardandoPaqueteImplCopyWith<$Res> {
  __$$GuardandoPaqueteImplCopyWithImpl(
    _$GuardandoPaqueteImpl _value,
    $Res Function(_$GuardandoPaqueteImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecepcionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GuardandoPaqueteImpl implements _GuardandoPaquete {
  const _$GuardandoPaqueteImpl();

  @override
  String toString() {
    return 'RecepcionState.guardandoPaquete()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GuardandoPaqueteImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() capturandoImagen,
    required TResult Function() procesandoOcr,
    required TResult Function(OcrResult resultado, String imagenPath)
    ocrCompletado,
    required TResult Function() cargandoPuntos,
    required TResult Function(
      OcrResult ocrResult,
      String imagenPath,
      List<Punto> puntos,
    )
    validandoDatos,
    required TResult Function() guardandoPaquete,
    required TResult Function(Paquete paquete) paqueteCreado,
    required TResult Function(String mensaje, String? imagenPath) error,
  }) {
    return guardandoPaquete();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? capturandoImagen,
    TResult? Function()? procesandoOcr,
    TResult? Function(OcrResult resultado, String imagenPath)? ocrCompletado,
    TResult? Function()? cargandoPuntos,
    TResult? Function(
      OcrResult ocrResult,
      String imagenPath,
      List<Punto> puntos,
    )?
    validandoDatos,
    TResult? Function()? guardandoPaquete,
    TResult? Function(Paquete paquete)? paqueteCreado,
    TResult? Function(String mensaje, String? imagenPath)? error,
  }) {
    return guardandoPaquete?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? capturandoImagen,
    TResult Function()? procesandoOcr,
    TResult Function(OcrResult resultado, String imagenPath)? ocrCompletado,
    TResult Function()? cargandoPuntos,
    TResult Function(
      OcrResult ocrResult,
      String imagenPath,
      List<Punto> puntos,
    )?
    validandoDatos,
    TResult Function()? guardandoPaquete,
    TResult Function(Paquete paquete)? paqueteCreado,
    TResult Function(String mensaje, String? imagenPath)? error,
    required TResult orElse(),
  }) {
    if (guardandoPaquete != null) {
      return guardandoPaquete();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CapturandoImagen value) capturandoImagen,
    required TResult Function(_ProcesandoOcr value) procesandoOcr,
    required TResult Function(_OcrCompletado value) ocrCompletado,
    required TResult Function(_CargandoPuntos value) cargandoPuntos,
    required TResult Function(_ValidandoDatos value) validandoDatos,
    required TResult Function(_GuardandoPaquete value) guardandoPaquete,
    required TResult Function(_PaqueteCreado value) paqueteCreado,
    required TResult Function(_Error value) error,
  }) {
    return guardandoPaquete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CapturandoImagen value)? capturandoImagen,
    TResult? Function(_ProcesandoOcr value)? procesandoOcr,
    TResult? Function(_OcrCompletado value)? ocrCompletado,
    TResult? Function(_CargandoPuntos value)? cargandoPuntos,
    TResult? Function(_ValidandoDatos value)? validandoDatos,
    TResult? Function(_GuardandoPaquete value)? guardandoPaquete,
    TResult? Function(_PaqueteCreado value)? paqueteCreado,
    TResult? Function(_Error value)? error,
  }) {
    return guardandoPaquete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CapturandoImagen value)? capturandoImagen,
    TResult Function(_ProcesandoOcr value)? procesandoOcr,
    TResult Function(_OcrCompletado value)? ocrCompletado,
    TResult Function(_CargandoPuntos value)? cargandoPuntos,
    TResult Function(_ValidandoDatos value)? validandoDatos,
    TResult Function(_GuardandoPaquete value)? guardandoPaquete,
    TResult Function(_PaqueteCreado value)? paqueteCreado,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (guardandoPaquete != null) {
      return guardandoPaquete(this);
    }
    return orElse();
  }
}

abstract class _GuardandoPaquete implements RecepcionState {
  const factory _GuardandoPaquete() = _$GuardandoPaqueteImpl;
}

/// @nodoc
abstract class _$$PaqueteCreadoImplCopyWith<$Res> {
  factory _$$PaqueteCreadoImplCopyWith(
    _$PaqueteCreadoImpl value,
    $Res Function(_$PaqueteCreadoImpl) then,
  ) = __$$PaqueteCreadoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Paquete paquete});

  $PaqueteCopyWith<$Res> get paquete;
}

/// @nodoc
class __$$PaqueteCreadoImplCopyWithImpl<$Res>
    extends _$RecepcionStateCopyWithImpl<$Res, _$PaqueteCreadoImpl>
    implements _$$PaqueteCreadoImplCopyWith<$Res> {
  __$$PaqueteCreadoImplCopyWithImpl(
    _$PaqueteCreadoImpl _value,
    $Res Function(_$PaqueteCreadoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecepcionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? paquete = null}) {
    return _then(
      _$PaqueteCreadoImpl(
        paquete: null == paquete
            ? _value.paquete
            : paquete // ignore: cast_nullable_to_non_nullable
                  as Paquete,
      ),
    );
  }

  /// Create a copy of RecepcionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaqueteCopyWith<$Res> get paquete {
    return $PaqueteCopyWith<$Res>(_value.paquete, (value) {
      return _then(_value.copyWith(paquete: value));
    });
  }
}

/// @nodoc

class _$PaqueteCreadoImpl implements _PaqueteCreado {
  const _$PaqueteCreadoImpl({required this.paquete});

  @override
  final Paquete paquete;

  @override
  String toString() {
    return 'RecepcionState.paqueteCreado(paquete: $paquete)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaqueteCreadoImpl &&
            (identical(other.paquete, paquete) || other.paquete == paquete));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paquete);

  /// Create a copy of RecepcionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaqueteCreadoImplCopyWith<_$PaqueteCreadoImpl> get copyWith =>
      __$$PaqueteCreadoImplCopyWithImpl<_$PaqueteCreadoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() capturandoImagen,
    required TResult Function() procesandoOcr,
    required TResult Function(OcrResult resultado, String imagenPath)
    ocrCompletado,
    required TResult Function() cargandoPuntos,
    required TResult Function(
      OcrResult ocrResult,
      String imagenPath,
      List<Punto> puntos,
    )
    validandoDatos,
    required TResult Function() guardandoPaquete,
    required TResult Function(Paquete paquete) paqueteCreado,
    required TResult Function(String mensaje, String? imagenPath) error,
  }) {
    return paqueteCreado(paquete);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? capturandoImagen,
    TResult? Function()? procesandoOcr,
    TResult? Function(OcrResult resultado, String imagenPath)? ocrCompletado,
    TResult? Function()? cargandoPuntos,
    TResult? Function(
      OcrResult ocrResult,
      String imagenPath,
      List<Punto> puntos,
    )?
    validandoDatos,
    TResult? Function()? guardandoPaquete,
    TResult? Function(Paquete paquete)? paqueteCreado,
    TResult? Function(String mensaje, String? imagenPath)? error,
  }) {
    return paqueteCreado?.call(paquete);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? capturandoImagen,
    TResult Function()? procesandoOcr,
    TResult Function(OcrResult resultado, String imagenPath)? ocrCompletado,
    TResult Function()? cargandoPuntos,
    TResult Function(
      OcrResult ocrResult,
      String imagenPath,
      List<Punto> puntos,
    )?
    validandoDatos,
    TResult Function()? guardandoPaquete,
    TResult Function(Paquete paquete)? paqueteCreado,
    TResult Function(String mensaje, String? imagenPath)? error,
    required TResult orElse(),
  }) {
    if (paqueteCreado != null) {
      return paqueteCreado(paquete);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CapturandoImagen value) capturandoImagen,
    required TResult Function(_ProcesandoOcr value) procesandoOcr,
    required TResult Function(_OcrCompletado value) ocrCompletado,
    required TResult Function(_CargandoPuntos value) cargandoPuntos,
    required TResult Function(_ValidandoDatos value) validandoDatos,
    required TResult Function(_GuardandoPaquete value) guardandoPaquete,
    required TResult Function(_PaqueteCreado value) paqueteCreado,
    required TResult Function(_Error value) error,
  }) {
    return paqueteCreado(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CapturandoImagen value)? capturandoImagen,
    TResult? Function(_ProcesandoOcr value)? procesandoOcr,
    TResult? Function(_OcrCompletado value)? ocrCompletado,
    TResult? Function(_CargandoPuntos value)? cargandoPuntos,
    TResult? Function(_ValidandoDatos value)? validandoDatos,
    TResult? Function(_GuardandoPaquete value)? guardandoPaquete,
    TResult? Function(_PaqueteCreado value)? paqueteCreado,
    TResult? Function(_Error value)? error,
  }) {
    return paqueteCreado?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CapturandoImagen value)? capturandoImagen,
    TResult Function(_ProcesandoOcr value)? procesandoOcr,
    TResult Function(_OcrCompletado value)? ocrCompletado,
    TResult Function(_CargandoPuntos value)? cargandoPuntos,
    TResult Function(_ValidandoDatos value)? validandoDatos,
    TResult Function(_GuardandoPaquete value)? guardandoPaquete,
    TResult Function(_PaqueteCreado value)? paqueteCreado,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (paqueteCreado != null) {
      return paqueteCreado(this);
    }
    return orElse();
  }
}

abstract class _PaqueteCreado implements RecepcionState {
  const factory _PaqueteCreado({required final Paquete paquete}) =
      _$PaqueteCreadoImpl;

  Paquete get paquete;

  /// Create a copy of RecepcionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaqueteCreadoImplCopyWith<_$PaqueteCreadoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String mensaje, String? imagenPath});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$RecepcionStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecepcionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? mensaje = null, Object? imagenPath = freezed}) {
    return _then(
      _$ErrorImpl(
        mensaje: null == mensaje
            ? _value.mensaje
            : mensaje // ignore: cast_nullable_to_non_nullable
                  as String,
        imagenPath: freezed == imagenPath
            ? _value.imagenPath
            : imagenPath // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.mensaje, this.imagenPath});

  @override
  final String mensaje;
  @override
  final String? imagenPath;

  @override
  String toString() {
    return 'RecepcionState.error(mensaje: $mensaje, imagenPath: $imagenPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.mensaje, mensaje) || other.mensaje == mensaje) &&
            (identical(other.imagenPath, imagenPath) ||
                other.imagenPath == imagenPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mensaje, imagenPath);

  /// Create a copy of RecepcionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() capturandoImagen,
    required TResult Function() procesandoOcr,
    required TResult Function(OcrResult resultado, String imagenPath)
    ocrCompletado,
    required TResult Function() cargandoPuntos,
    required TResult Function(
      OcrResult ocrResult,
      String imagenPath,
      List<Punto> puntos,
    )
    validandoDatos,
    required TResult Function() guardandoPaquete,
    required TResult Function(Paquete paquete) paqueteCreado,
    required TResult Function(String mensaje, String? imagenPath) error,
  }) {
    return error(mensaje, imagenPath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? capturandoImagen,
    TResult? Function()? procesandoOcr,
    TResult? Function(OcrResult resultado, String imagenPath)? ocrCompletado,
    TResult? Function()? cargandoPuntos,
    TResult? Function(
      OcrResult ocrResult,
      String imagenPath,
      List<Punto> puntos,
    )?
    validandoDatos,
    TResult? Function()? guardandoPaquete,
    TResult? Function(Paquete paquete)? paqueteCreado,
    TResult? Function(String mensaje, String? imagenPath)? error,
  }) {
    return error?.call(mensaje, imagenPath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? capturandoImagen,
    TResult Function()? procesandoOcr,
    TResult Function(OcrResult resultado, String imagenPath)? ocrCompletado,
    TResult Function()? cargandoPuntos,
    TResult Function(
      OcrResult ocrResult,
      String imagenPath,
      List<Punto> puntos,
    )?
    validandoDatos,
    TResult Function()? guardandoPaquete,
    TResult Function(Paquete paquete)? paqueteCreado,
    TResult Function(String mensaje, String? imagenPath)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(mensaje, imagenPath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CapturandoImagen value) capturandoImagen,
    required TResult Function(_ProcesandoOcr value) procesandoOcr,
    required TResult Function(_OcrCompletado value) ocrCompletado,
    required TResult Function(_CargandoPuntos value) cargandoPuntos,
    required TResult Function(_ValidandoDatos value) validandoDatos,
    required TResult Function(_GuardandoPaquete value) guardandoPaquete,
    required TResult Function(_PaqueteCreado value) paqueteCreado,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CapturandoImagen value)? capturandoImagen,
    TResult? Function(_ProcesandoOcr value)? procesandoOcr,
    TResult? Function(_OcrCompletado value)? ocrCompletado,
    TResult? Function(_CargandoPuntos value)? cargandoPuntos,
    TResult? Function(_ValidandoDatos value)? validandoDatos,
    TResult? Function(_GuardandoPaquete value)? guardandoPaquete,
    TResult? Function(_PaqueteCreado value)? paqueteCreado,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CapturandoImagen value)? capturandoImagen,
    TResult Function(_ProcesandoOcr value)? procesandoOcr,
    TResult Function(_OcrCompletado value)? ocrCompletado,
    TResult Function(_CargandoPuntos value)? cargandoPuntos,
    TResult Function(_ValidandoDatos value)? validandoDatos,
    TResult Function(_GuardandoPaquete value)? guardandoPaquete,
    TResult Function(_PaqueteCreado value)? paqueteCreado,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements RecepcionState {
  const factory _Error({
    required final String mensaje,
    final String? imagenPath,
  }) = _$ErrorImpl;

  String get mensaje;
  String? get imagenPath;

  /// Create a copy of RecepcionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
