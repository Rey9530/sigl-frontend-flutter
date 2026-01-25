import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../domain/entities/datos_vineta_extraidos.dart';
import '../../domain/entities/tipo_cobro_envio.dart';
import '../../domain/utils/calculadora_cobro.dart';
import '../providers/recepcion_provider.dart';
import '../providers/recepcion_state.dart';

class ConfirmacionCobroScreen extends ConsumerWidget {
  const ConfirmacionCobroScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(recepcionProvider);

    // Listener para navegacion
    ref.listen<RecepcionState>(recepcionProvider, (previous, next) {
      next.maybeWhen(
        recepcionCreada: (recepcion, imagenPath) {
          context.go('/recepcion/confirmacion');
        },
        error: (mensaje, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(mensaje), backgroundColor: AppColors.error),
          );
        },
        orElse: () {},
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmar Cobro'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: state.maybeWhen(
        confirmandoCobro: (datos, imagenPath, costoEnvio) =>
            _CobroContent(datos: datos, costoEnvio: costoEnvio),
        registrandoRecepcion: () =>
            const LoadingScreen(message: 'Registrando recepcion...'),
        orElse: () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('No hay datos para confirmar'),
              const SizedBox(height: 16),
              CustomButton(
                text: 'Volver al inicio',
                onPressed: () {
                  ref.read(recepcionProvider.notifier).reiniciar();
                  context.go('/home');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CobroContent extends ConsumerStatefulWidget {
  final DatosVinetaExtraidos datos;
  final double costoEnvio;

  const _CobroContent({required this.datos, required this.costoEnvio});

  @override
  ConsumerState<_CobroContent> createState() => _CobroContentState();
}

class _CobroContentState extends ConsumerState<_CobroContent> {
  TipoCobroEnvio? _tipoSeleccionado;

  int? _getPuntoId() {
    final authState = ref.read(authStateProvider);
    return authState.user?.puntoId;
  }

  void _onConfirmar() {
    if (_tipoSeleccionado == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Selecciona una opcion de cobro'),
          backgroundColor: AppColors.warning,
        ),
      );
      return;
    }

    final puntoId = _getPuntoId();
    if (puntoId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No tienes un punto de servicio asignado'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    ref
        .read(recepcionProvider.notifier)
        .registrarRecepcion(
          puntoId,
          _tipoSeleccionado!,
          costoEnvioOverride: widget.costoEnvio,
        );
  }

  @override
  Widget build(BuildContext context) {
    final precioProducto = widget.datos.precioProducto ?? 0.0;
    final costoEnvio = widget.costoEnvio;

    // Calcular montos para ambos escenarios
    final resultadoClientePaga = CalculadoraCobro.calcular(
      tipoCobroEnvio: TipoCobroEnvio.clientePagaEnvio,
      precioProducto: precioProducto,
      costoEnvio: costoEnvio,
    );

    final resultadoVendedorAbsorbe = CalculadoraCobro.calcular(
      tipoCobroEnvio: TipoCobroEnvio.vendedorAbsorbeEnvio,
      precioProducto: precioProducto,
      costoEnvio: costoEnvio,
    );

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    // Icono de pregunta
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.payments_outlined,
                        size: 64,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Pregunta principal
                    Text(
                      'Seleccione una opción',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Selecciona como se maneja el pago del paquete',
                      style: TextStyle(color: Colors.grey[600], fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),

                    // Resumen de precios
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _PrecioChip(
                            label: 'Producto',
                            monto: precioProducto,
                            icon: Icons.inventory_2,
                          ),
                          Container(
                            width: 1,
                            height: 40,
                            color: Colors.grey[300],
                          ),
                          _PrecioChip(
                            label: 'Envio',
                            monto: costoEnvio,
                            icon: Icons.local_shipping,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Opcion A: Cliente paga envio
                    _OpcionCobroCard(
                      tipo: TipoCobroEnvio.clientePagaEnvio,
                      titulo: 'Cobrar al cliente',
                      subtitulo:
                          'El cliente debe pagar al momento de la entrega',
                      icono: Icons.person,
                      montoCliente: resultadoClientePaga.montoACobrarCliente,
                      montoVendedor: resultadoClientePaga.montoParaVendedor,
                      seleccionado:
                          _tipoSeleccionado == TipoCobroEnvio.clientePagaEnvio,
                      onTap: () {
                        setState(() {
                          _tipoSeleccionado = TipoCobroEnvio.clientePagaEnvio;
                        });
                      },
                    ),
                    const SizedBox(height: 16),

                    // Opcion B: Vendedor absorbe envio
                    _OpcionCobroCard(
                      tipo: TipoCobroEnvio.vendedorAbsorbeEnvio,
                      titulo: 'No cobrar al cliente',
                      subtitulo:
                          'El cliente no debe pagar nada al momento de la entrega',
                      icono: Icons.store,
                      montoCliente: 0,
                      montoVendedor: 0,
                      seleccionado:
                          _tipoSeleccionado ==
                          TipoCobroEnvio.vendedorAbsorbeEnvio,
                      onTap: () {
                        setState(() {
                          _tipoSeleccionado =
                              TipoCobroEnvio.vendedorAbsorbeEnvio;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Boton de confirmar
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _tipoSeleccionado != null ? _onConfirmar : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  disabledBackgroundColor: Colors.grey[300],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, size: 24),
                    SizedBox(width: 8),
                    Text(
                      'Confirmar y Registrar',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PrecioChip extends StatelessWidget {
  final String label;
  final double monto;
  final IconData icon;

  const _PrecioChip({
    required this.label,
    required this.monto,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 24, color: Colors.grey[600]),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        const SizedBox(height: 2),
        Text(
          '\$${monto.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _OpcionCobroCard extends StatelessWidget {
  final TipoCobroEnvio tipo;
  final String titulo;
  final String subtitulo;
  final IconData icono;
  final double montoCliente;
  final double montoVendedor;
  final bool seleccionado;
  final VoidCallback onTap;

  const _OpcionCobroCard({
    required this.tipo,
    required this.titulo,
    required this.subtitulo,
    required this.icono,
    required this.montoCliente,
    required this.montoVendedor,
    required this.seleccionado,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = seleccionado ? AppColors.primary : Colors.grey[300]!;
    final bgColor = seleccionado
        ? AppColors.primary.withValues(alpha: 0.05)
        : Colors.white;

    return Material(
      color: bgColor,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor, width: seleccionado ? 2 : 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: seleccionado
                          ? AppColors.primary.withValues(alpha: 0.1)
                          : Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      icono,
                      size: 28,
                      color: seleccionado
                          ? AppColors.primary
                          : Colors.grey[600],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          titulo,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: seleccionado
                                ? AppColors.primary
                                : Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          subtitulo,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (seleccionado)
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              const Divider(height: 1),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _MontoInfo(
                      label: 'Cliente paga',
                      monto: montoCliente,
                      color: montoCliente > 0
                          ? AppColors.warning
                          : Colors.green,
                      icon: Icons.person,
                    ),
                  ),
                  Container(width: 1, height: 50, color: Colors.grey[200]),
                  Expanded(
                    child: _MontoInfo(
                      label: 'Vendedor recibe',
                      monto: montoVendedor,
                      color: AppColors.success,
                      icon: Icons.store,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MontoInfo extends StatelessWidget {
  final String label;
  final double monto;
  final Color color;
  final IconData icon;

  const _MontoInfo({
    required this.label,
    required this.monto,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 16, color: Colors.grey[500]),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          '\$${monto.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
