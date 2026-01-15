import '../../domain/entities/entrega_result.dart';

/// Estados posibles del flujo de entrega
sealed class EntregaState {
  const EntregaState();
}

/// Estado inicial
class EntregaInitial extends EntregaState {
  const EntregaInitial();
}

/// Procesando imagen y registrando entrega
class EntregaProcesando extends EntregaState {
  const EntregaProcesando();
}

/// Entrega registrada exitosamente
class EntregaExitosa extends EntregaState {
  final EntregaResult resultado;
  final String imagenPath;

  const EntregaExitosa({
    required this.resultado,
    required this.imagenPath,
  });
}

/// Error: codigo no detectado por OCR, se puede reintentar con codigo manual
class EntregaCodigoNoDetectado extends EntregaState {
  final String imagenPath;
  final String? mensajeOcr;

  const EntregaCodigoNoDetectado({
    required this.imagenPath,
    this.mensajeOcr,
  });
}

/// Error: paquete no encontrado con el codigo proporcionado
class EntregaPaqueteNoEncontrado extends EntregaState {
  final String codigoBuscado;

  const EntregaPaqueteNoEncontrado({
    required this.codigoBuscado,
  });
}

/// Error: paquete ya fue entregado (conflicto)
class EntregaConflicto extends EntregaState {
  final String mensaje;

  const EntregaConflicto({
    required this.mensaje,
  });
}

/// Error generico
class EntregaError extends EntregaState {
  final String mensaje;
  final String? imagenPath;

  const EntregaError({
    required this.mensaje,
    this.imagenPath,
  });
}

/// Extension con helpers para el estado
extension EntregaStateX on EntregaState {
  /// Indica si esta en un estado de carga
  bool get isLoading => this is EntregaProcesando;

  /// Indica si hay error
  bool get hasError =>
      this is EntregaError ||
      this is EntregaCodigoNoDetectado ||
      this is EntregaPaqueteNoEncontrado ||
      this is EntregaConflicto;

  /// Mensaje de error actual
  String? get errorMessage {
    return switch (this) {
      EntregaError(mensaje: final m) => m,
      EntregaCodigoNoDetectado(mensajeOcr: final m) => m,
      EntregaPaqueteNoEncontrado(codigoBuscado: final c) =>
        'No se encontro paquete con codigo: $c',
      EntregaConflicto(mensaje: final m) => m,
      _ => null,
    };
  }

  /// Resultado de la entrega
  EntregaResult? get resultado {
    return switch (this) {
      EntregaExitosa(resultado: final r) => r,
      _ => null,
    };
  }

  /// Path de la imagen capturada
  String? get imagenPath {
    return switch (this) {
      EntregaExitosa(imagenPath: final p) => p,
      EntregaCodigoNoDetectado(imagenPath: final p) => p,
      EntregaError(imagenPath: final p) => p,
      _ => null,
    };
  }
}
