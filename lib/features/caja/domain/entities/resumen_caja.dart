class ResumenCaja {
  final double total;
  final double precioProducto;
  final double costoEnvio;
  final int cantidadPaquetes;

  const ResumenCaja({
    required this.total,
    required this.precioProducto,
    required this.costoEnvio,
    required this.cantidadPaquetes,
  });

  factory ResumenCaja.fromJson(Map<String, dynamic> json) {
    return ResumenCaja(
      total: (json['total'] as num?)?.toDouble() ?? 0.0,
      precioProducto: (json['precio_producto'] as num?)?.toDouble() ?? 0.0,
      costoEnvio: (json['costo_envio'] as num?)?.toDouble() ?? 0.0,
      cantidadPaquetes: json['cantidad_paquetes'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'precio_producto': precioProducto,
      'costo_envio': costoEnvio,
      'cantidad_paquetes': cantidadPaquetes,
    };
  }

  ResumenCaja copyWith({
    double? total,
    double? precioProducto,
    double? costoEnvio,
    int? cantidadPaquetes,
  }) {
    return ResumenCaja(
      total: total ?? this.total,
      precioProducto: precioProducto ?? this.precioProducto,
      costoEnvio: costoEnvio ?? this.costoEnvio,
      cantidadPaquetes: cantidadPaquetes ?? this.cantidadPaquetes,
    );
  }

  bool get tienePendientes => cantidadPaquetes > 0;
  bool get estaVacia => cantidadPaquetes == 0 && total == 0;
}
