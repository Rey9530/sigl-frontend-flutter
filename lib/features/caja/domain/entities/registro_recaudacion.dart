class RegistroRecaudacion {
  final int id;
  final int paqueteId;
  final String codigoRastreo;
  final String destinatarioNombre;
  final double precioProducto;
  final double costoEnvio;
  final double total;
  final String estado;
  final DateTime creadoEn;

  const RegistroRecaudacion({
    required this.id,
    required this.paqueteId,
    required this.codigoRastreo,
    required this.destinatarioNombre,
    required this.precioProducto,
    required this.costoEnvio,
    required this.total,
    required this.estado,
    required this.creadoEn,
  });

  factory RegistroRecaudacion.fromJson(Map<String, dynamic> json) {
    final paquete = json['paquete'] as Map<String, dynamic>?;

    return RegistroRecaudacion(
      id: json['id_registro'] as int,
      paqueteId: json['paquete_id'] as int,
      codigoRastreo: paquete?['codigo_rastreo'] as String? ?? '',
      destinatarioNombre: paquete?['destinatario_nombre'] as String? ?? '',
      precioProducto: (json['precio_producto'] as num?)?.toDouble() ?? 0.0,
      costoEnvio: (json['costo_envio'] as num?)?.toDouble() ?? 0.0,
      total: (json['total'] as num?)?.toDouble() ?? 0.0,
      estado: json['estado'] as String? ?? 'PENDIENTE',
      creadoEn: DateTime.parse(json['creado_en'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_registro': id,
      'paquete_id': paqueteId,
      'codigo_rastreo': codigoRastreo,
      'destinatario_nombre': destinatarioNombre,
      'precio_producto': precioProducto,
      'costo_envio': costoEnvio,
      'total': total,
      'estado': estado,
      'creado_en': creadoEn.toIso8601String(),
    };
  }

  bool get isPendiente => estado == 'PENDIENTE';
  bool get isEntregado => estado == 'ENTREGADO';
}
