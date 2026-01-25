import 'package:json_annotation/json_annotation.dart';

/// Enum que define quién asume el costo del envío
enum TipoCobroEnvio {
  /// Escenario A: El cliente paga el envío
  /// Cliente paga: producto + envío
  /// Vendedor recibe: producto + envío
  @JsonValue('CLIENTE_PAGA_ENVIO')
  clientePagaEnvio,

  /// Escenario B: El vendedor absorbe el envío
  /// Cliente paga: $0 (ya pagó al vendedor)
  /// Vendedor recibe: solo el producto
  @JsonValue('VENDEDOR_ABSORBE_ENVIO')
  vendedorAbsorbeEnvio,
}

/// Extensión para obtener el valor JSON del enum
extension TipoCobroEnvioExtension on TipoCobroEnvio {
  String get jsonValue {
    switch (this) {
      case TipoCobroEnvio.clientePagaEnvio:
        return 'CLIENTE_PAGA_ENVIO';
      case TipoCobroEnvio.vendedorAbsorbeEnvio:
        return 'VENDEDOR_ABSORBE_ENVIO';
    }
  }

  String get descripcion {
    switch (this) {
      case TipoCobroEnvio.clientePagaEnvio:
        return 'Cliente paga el envío';
      case TipoCobroEnvio.vendedorAbsorbeEnvio:
        return 'Vendedor ya pagó el envío';
    }
  }
}
