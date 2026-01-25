import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/recepcion_repository_impl.dart';
import '../../domain/entities/datos_vineta_extraidos.dart';
import '../../domain/entities/tipo_cobro_envio.dart';
import '../../domain/utils/calculadora_cobro.dart';

import 'recepcion_state.dart';

class RecepcionNotifier extends StateNotifier<RecepcionState> {
  final RecepcionRepository _repository;
  String? _imagenPath;
  DatosVinetaExtraidos? _datosExtraidos;
  double? _costoEnvioConfirmado;

  RecepcionNotifier(this._repository) : super(const RecepcionState.initial());

  // ============================================
  // Nuevo flujo: Extracción → Verificación → Cobro → Registro
  // ============================================

  /// Fase 1: Extrae datos de la viñeta usando OCR (sin guardar en BD)
  Future<void> extraerDatos(File imagen, int puntoServicioId) async {
    _imagenPath = imagen.path;
    state = const RecepcionState.extrayendoDatos();

    final result = await _repository.extraerDatosVineta(imagen);

    result.fold(
      (failure) {
        state = RecepcionState.error(
          mensaje: failure.message,
          imagenPath: _imagenPath,
        );
      },
      (datosExtraidos) {
        _datosExtraidos = datosExtraidos;
        state = RecepcionState.datosExtraidos(
          datos: datosExtraidos,
          imagenPath: _imagenPath!,
        );
      },
    );
  }

  /// Fase 2: Usuario confirma que los datos son correctos
  /// Pasa al estado de confirmación de cobro
  void confirmarDatos(DatosVinetaExtraidos datosEditados, double costoEnvio) {
    _datosExtraidos = datosEditados;
    _costoEnvioConfirmado = costoEnvio;
    state = RecepcionState.confirmandoCobro(
      datos: datosEditados,
      imagenPath: _imagenPath!,
      costoEnvioConfirmado: costoEnvio,
    );
  }

  /// Fase 3: Usuario decide sobre el cobro y se registra la recepción
  Future<void> registrarRecepcion(
    int puntoServicioId,
    TipoCobroEnvio tipoCobroEnvio, {
    double? costoEnvioOverride,
  }) async {
    if (_datosExtraidos == null) {
      state = RecepcionState.error(
        mensaje: 'No hay datos para registrar',
        imagenPath: _imagenPath,
      );
      return;
    }

    state = const RecepcionState.registrandoRecepcion();

    final costoEnvio = costoEnvioOverride ?? _costoEnvioConfirmado ?? 0.0;
    final precioProducto = _datosExtraidos!.precioProducto ?? 0.0;

    // Calcular montos según el tipo de cobro
    final resultadoCobro = CalculadoraCobro.calcular(
      tipoCobroEnvio: tipoCobroEnvio,
      precioProducto: precioProducto,
      costoEnvio: costoEnvio,
    );
    final montoParaVendedor =
        tipoCobroEnvio == TipoCobroEnvio.vendedorAbsorbeEnvio
        ? 0.0
        : resultadoCobro.montoParaVendedor;
    final request = RegistrarRecepcionRequest(
      imagenObjectName: _datosExtraidos!.imagenObjectName,
      puntoServicioId: puntoServicioId,
      vendedor: _datosExtraidos!.vendedor,
      cliente: _datosExtraidos!.cliente,
      telefono: _datosExtraidos!.telefono,
      diaEntrega: _datosExtraidos!.diaEntrega,
      destino: _datosExtraidos!.destino,
      encomendista: _datosExtraidos!.encomendista,
      precioProducto: _datosExtraidos!.precioProducto,
      costoEnvio: costoEnvio,
      total: _datosExtraidos!.total,
      tipoCobroEnvio: tipoCobroEnvio,
      montoACobrarCliente: resultadoCobro.montoACobrarCliente,
      montoParaVendedor: montoParaVendedor,
    );

    final result = await _repository.registrarRecepcionConfirmada(request);

    result.fold(
      (failure) {
        state = RecepcionState.error(
          mensaje: failure.message,
          imagenPath: _imagenPath,
        );
      },
      (recepcion) {
        state = RecepcionState.recepcionCreada(
          recepcion: recepcion,
          imagenPath: _imagenPath!,
        );
      },
    );
  }

  /// Vuelve al estado inicial para capturar una nueva foto
  void volverACapturar() {
    _imagenPath = null;
    _datosExtraidos = null;
    _costoEnvioConfirmado = null;
    state = const RecepcionState.initial();
  }

  /// Actualiza los datos extraídos con las ediciones del usuario
  void actualizarDatosExtraidos(DatosVinetaExtraidos datosEditados) {
    _datosExtraidos = datosEditados;
    if (_imagenPath != null) {
      state = RecepcionState.datosExtraidos(
        datos: datosEditados,
        imagenPath: _imagenPath!,
      );
    }
  }

  // ============================================
  // Flujo legacy (mantener compatibilidad)
  // ============================================

  /// Crea una recepcion enviando imagen y punto de servicio
  /// El backend genera automaticamente el codigo de rastreo de 6 caracteres
  Future<void> crearRecepcion(
    File imagen,
    int puntoServicioId, {
    String? notas,
  }) async {
    _imagenPath = imagen.path;
    state = const RecepcionState.procesandoRecepcion();

    final result = await _repository.crearRecepcion(
      imagen,
      puntoServicioId,
      notas: notas,
    );

    result.fold(
      (failure) {
        state = RecepcionState.error(
          mensaje: failure.message,
          imagenPath: _imagenPath,
        );
      },
      (recepcion) {
        state = RecepcionState.recepcionCreada(
          recepcion: recepcion,
          imagenPath: _imagenPath!,
        );
      },
    );
  }

  /// Actualiza el costo de envio de una recepcion
  Future<bool> actualizarCostoEnvio(int recepcionId, double costoEnvio) async {
    final result = await _repository.actualizarCostoEnvio(
      recepcionId,
      costoEnvio,
    );

    return result.fold(
      (failure) {
        return false;
      },
      (recepcionActualizada) {
        state = RecepcionState.recepcionCreada(
          recepcion: recepcionActualizada,
          imagenPath: _imagenPath ?? '',
        );
        return true;
      },
    );
  }

  /// Reinicia el estado para una nueva recepcion
  void reiniciar() {
    _imagenPath = null;
    _datosExtraidos = null;
    _costoEnvioConfirmado = null;
    state = const RecepcionState.initial();
  }
}

final recepcionProvider =
    StateNotifierProvider<RecepcionNotifier, RecepcionState>((ref) {
      final repository = ref.watch(recepcionRepositoryProvider);
      return RecepcionNotifier(repository);
    });
