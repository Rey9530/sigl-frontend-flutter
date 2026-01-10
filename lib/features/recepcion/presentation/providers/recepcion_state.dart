import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/paquete.dart';
import '../../domain/entities/recepcion_paquete.dart';
import '../../domain/entities/punto.dart';

part 'recepcion_state.freezed.dart';

@freezed
class RecepcionState with _$RecepcionState {
  /// Estado inicial
  const factory RecepcionState.initial() = _Initial;

  /// Capturando imagen de vineta
  const factory RecepcionState.capturandoImagen() = _CapturandoImagen;

  /// Enviando imagen al servidor (subida + OCR)
  const factory RecepcionState.procesandoRecepcion() = _ProcesandoRecepcion;

  /// Recepcion creada exitosamente, mostrando datos OCR
  const factory RecepcionState.recepcionCreada({
    required RecepcionPaquete recepcion,
    required String imagenPath,
  }) = _RecepcionCreada;

  /// Cargando puntos de destino para conversion
  const factory RecepcionState.cargandoPuntos({
    required RecepcionPaquete recepcion,
    required String imagenPath,
  }) = _CargandoPuntos;

  /// Validando y editando datos OCR
  const factory RecepcionState.validandoDatos({
    required RecepcionPaquete recepcion,
    required String imagenPath,
    required List<Punto> puntosDestino,
  }) = _ValidandoDatos;

  /// Guardando cambios en recepcion
  const factory RecepcionState.guardandoCambios({
    required RecepcionPaquete recepcion,
    required String imagenPath,
    required List<Punto> puntosDestino,
  }) = _GuardandoCambios;

  /// Convirtiendo recepcion a paquete
  const factory RecepcionState.convirtiendoPaquete({
    required RecepcionPaquete recepcion,
    required String imagenPath,
  }) = _ConvirtiendoPaquete;

  /// Paquete creado exitosamente
  const factory RecepcionState.paqueteCreado({required Paquete paquete}) =
      _PaqueteCreado;

  /// Error durante el proceso
  const factory RecepcionState.error({
    required String mensaje,
    String? imagenPath,
    RecepcionPaquete? recepcion,
    List<Punto>? puntosDestino,
  }) = _Error;
}

extension RecepcionStateX on RecepcionState {
  /// Indica si esta en un estado de carga
  bool get isLoading => maybeWhen(
    procesandoRecepcion: () => true,
    cargandoPuntos: (_, _) => true,
    guardandoCambios: (_, _, _) => true,
    convirtiendoPaquete: (_, _) => true,
    orElse: () => false,
  );

  /// Indica si hay error
  bool get hasError =>
      maybeWhen(error: (_, _, _, _) => true, orElse: () => false);

  /// Mensaje de error actual
  String? get errorMessage =>
      maybeWhen(error: (mensaje, _, _, _) => mensaje, orElse: () => null);

  /// Recepcion actual
  RecepcionPaquete? get recepcion => maybeWhen(
    recepcionCreada: (recepcion, _) => recepcion,
    cargandoPuntos: (recepcion, _) => recepcion,
    validandoDatos: (recepcion, _, _) => recepcion,
    guardandoCambios: (recepcion, _, _) => recepcion,
    convirtiendoPaquete: (recepcion, _) => recepcion,
    error: (_, _, recepcion, _) => recepcion,
    orElse: () => null,
  );

  /// Paquete creado
  Paquete? get paquete =>
      maybeWhen(paqueteCreado: (paquete) => paquete, orElse: () => null);

  /// Lista de puntos de destino disponibles
  List<Punto>? get puntosDestino => maybeWhen(
    validandoDatos: (_, _, puntos) => puntos,
    guardandoCambios: (_, _, puntos) => puntos,
    error: (_, _, _, puntos) => puntos,
    orElse: () => null,
  );

  /// Path de la imagen capturada
  String? get imagenPath => maybeWhen(
    recepcionCreada: (_, imagenPath) => imagenPath,
    cargandoPuntos: (_, imagenPath) => imagenPath,
    validandoDatos: (_, imagenPath, _) => imagenPath,
    guardandoCambios: (_, imagenPath, _) => imagenPath,
    convirtiendoPaquete: (_, imagenPath) => imagenPath,
    error: (_, imagenPath, _, _) => imagenPath,
    orElse: () => null,
  );

  /// Indica si se puede editar la recepcion
  bool get puedeEditar => maybeWhen(
    validandoDatos: (recepcion, _, _) => recepcion.puedeEditar,
    orElse: () => false,
  );

  /// Indica si se puede convertir a paquete
  bool get puedeConvertir => maybeWhen(
    validandoDatos: (recepcion, _, _) => recepcion.puedeConvertir,
    orElse: () => false,
  );
}
