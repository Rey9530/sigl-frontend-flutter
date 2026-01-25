import '../entities/tipo_cobro_envio.dart';

/// Resultado del cálculo de cobro
class ResultadoCobro {
  /// Monto que el cliente debe pagar al recibir el paquete
  final double montoACobrarCliente;

  /// Monto que se le transfiere/paga al vendedor
  final double montoParaVendedor;

  const ResultadoCobro({
    required this.montoACobrarCliente,
    required this.montoParaVendedor,
  });
}

/// Calculadora que determina los montos según el tipo de cobro de envío
class CalculadoraCobro {
  const CalculadoraCobro._();

  /// Calcula los montos a cobrar y transferir según el escenario
  ///
  /// [tipoCobroEnvio] - Quién paga el envío
  /// [precioProducto] - Precio del producto
  /// [costoEnvio] - Costo del envío
  ///
  /// **Escenario A (Cliente paga envío):**
  /// - Cliente paga: producto + envío
  /// - Vendedor recibe: producto + envío
  ///
  /// **Escenario B (Vendedor absorbe envío):**
  /// - Cliente paga: $0 (ya pagó todo al vendedor)
  /// - Vendedor recibe: solo producto (el envío ya lo pagó)
  static ResultadoCobro calcular({
    required TipoCobroEnvio tipoCobroEnvio,
    required double precioProducto,
    required double costoEnvio,
  }) {
    switch (tipoCobroEnvio) {
      case TipoCobroEnvio.clientePagaEnvio:
        // Escenario A: Cliente paga todo al momento de la entrega
        final total = precioProducto + costoEnvio;
        return ResultadoCobro(
          montoACobrarCliente: total,
          montoParaVendedor: total,
        );

      case TipoCobroEnvio.vendedorAbsorbeEnvio:
        // Escenario B: El vendedor ya cobró al cliente, solo se entrega
        // El cliente ya pagó, no se cobra nada adicional
        // Al vendedor se le da solo el producto (sin envío)
        return ResultadoCobro(
          montoACobrarCliente: 0,
          montoParaVendedor: precioProducto,
        );
    }
  }

  /// Obtiene una descripción legible del resultado
  static String getDescripcion({
    required TipoCobroEnvio tipoCobroEnvio,
    required ResultadoCobro resultado,
  }) {
    switch (tipoCobroEnvio) {
      case TipoCobroEnvio.clientePagaEnvio:
        return 'El cliente pagará \$${resultado.montoACobrarCliente.toStringAsFixed(2)} al momento de la entrega';
      case TipoCobroEnvio.vendedorAbsorbeEnvio:
        return 'El cliente ya pagó al vendedor. Solo se entrega el paquete.';
    }
  }
}
