/// Resultado de una entrega exitosa
class EntregaResult {
  final String mensaje;
  final PaqueteEntregado paquete;
  final EvidenciaResumen evidencia;
  final String codigoDetectado;
  final int confianzaOcr;

  EntregaResult({
    required this.mensaje,
    required this.paquete,
    required this.evidencia,
    required this.codigoDetectado,
    required this.confianzaOcr,
  });

  factory EntregaResult.fromJson(Map<String, dynamic> json) {
    return EntregaResult(
      mensaje: json['mensaje'] as String,
      paquete: PaqueteEntregado.fromJson(json['paquete'] as Map<String, dynamic>),
      evidencia: EvidenciaResumen.fromJson(json['evidencia'] as Map<String, dynamic>),
      codigoDetectado: json['codigo_detectado'] as String,
      confianzaOcr: json['confianza_ocr'] as int,
    );
  }
}

/// Datos del paquete entregado
class PaqueteEntregado {
  final int id;
  final String codigoRastreo;
  final String estadoActual;
  final String destinatarioNombre;
  final String? destinatarioTelefono;
  final PuntoResumen? puntoOrigen;
  final PuntoResumen? puntoDestino;

  PaqueteEntregado({
    required this.id,
    required this.codigoRastreo,
    required this.estadoActual,
    required this.destinatarioNombre,
    this.destinatarioTelefono,
    this.puntoOrigen,
    this.puntoDestino,
  });

  factory PaqueteEntregado.fromJson(Map<String, dynamic> json) {
    return PaqueteEntregado(
      id: json['id_paquete'] as int,
      codigoRastreo: json['codigo_rastreo'] as String,
      estadoActual: json['estado_actual'] as String,
      destinatarioNombre: json['destinatario_nombre'] as String,
      destinatarioTelefono: json['destinatario_telefono'] as String?,
      puntoOrigen: json['punto_origen'] != null
          ? PuntoResumen.fromJson(json['punto_origen'] as Map<String, dynamic>)
          : null,
      puntoDestino: json['punto_destino'] != null
          ? PuntoResumen.fromJson(json['punto_destino'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Resumen de un punto de servicio
class PuntoResumen {
  final int? id;
  final String nombre;
  final String? ciudad;

  PuntoResumen({
    this.id,
    required this.nombre,
    this.ciudad,
  });

  factory PuntoResumen.fromJson(Map<String, dynamic> json) {
    return PuntoResumen(
      id: json['id_punto'] as int?,
      nombre: json['nombre'] as String,
      ciudad: json['ciudad'] as String?,
    );
  }
}

/// Resumen de la evidencia de entrega
class EvidenciaResumen {
  final int id;
  final String imagenUrl;
  final DateTime entregadoEn;

  EvidenciaResumen({
    required this.id,
    required this.imagenUrl,
    required this.entregadoEn,
  });

  factory EvidenciaResumen.fromJson(Map<String, dynamic> json) {
    return EvidenciaResumen(
      id: json['id'] as int,
      imagenUrl: json['imagen_url'] as String,
      entregadoEn: DateTime.parse(json['entregado_en'] as String),
    );
  }
}
