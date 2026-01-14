import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../providers/caja_provider.dart';
import '../providers/caja_state.dart';

class ContadorCajaWidget extends ConsumerWidget {
  final VoidCallback? onTap;

  const ContadorCajaWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cajaProvider);

    if (state is CajaInitial) {
      return const SizedBox.shrink();
    }

    if (state is CajaLoading) {
      return const _ContadorSkeleton();
    }

    if (state is CajaError) {
      return _ContadorError(
        mensaje: state.mensaje,
        onRetry: () => ref.read(cajaProvider.notifier).cargarResumen(),
      );
    }

    if (state is CajaLoaded) {
      return _ContadorCard(resumen: state.resumen, onTap: onTap);
    }

    return const SizedBox.shrink();
  }
}

class _ContadorCard extends StatelessWidget {
  final dynamic resumen;
  final VoidCallback? onTap;

  const _ContadorCard({required this.resumen, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primary,
              AppColors.primary.withValues(alpha: 0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Mi Caja del Turno',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                Icon(
                  Icons.account_balance_wallet,
                  color: Colors.white.withValues(alpha: 0.7),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '\$ ${resumen.costoEnvio.toStringAsFixed(2)}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${resumen.cantidadPaquetes} paquete${resumen.cantidadPaquetes == 1 ? '' : 's'} pendiente${resumen.cantidadPaquetes == 1 ? '' : 's'}',
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _DetalleItem(label: 'Productos', valor: resumen.precioProducto),
                const SizedBox(width: 24),
                _DetalleItem(label: 'Envios', valor: resumen.costoEnvio),
              ],
            ),
            if (onTap != null) ...[
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Ver detalles',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: Colors.white.withValues(alpha: 0.9),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _DetalleItem extends StatelessWidget {
  final String label;
  final double valor;

  const _DetalleItem({required this.label, required this.valor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.6),
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          '\$ ${valor.toStringAsFixed(2)}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _ContadorSkeleton extends StatelessWidget {
  const _ContadorSkeleton();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 120,
                height: 14,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
              Icon(Icons.account_balance_wallet, color: Colors.grey),
            ],
          ),
          SizedBox(height: 8),
          SizedBox(
            width: 150,
            height: 32,
            child: DecoratedBox(decoration: BoxDecoration(color: Colors.white)),
          ),
          SizedBox(height: 8),
          SizedBox(
            width: 100,
            height: 14,
            child: DecoratedBox(decoration: BoxDecoration(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class _ContadorError extends StatelessWidget {
  final String mensaje;
  final VoidCallback onRetry;

  const _ContadorError({required this.mensaje, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.red[200]!),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: Colors.red),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Error al cargar caja',
              style: TextStyle(color: Colors.red[700]),
            ),
          ),
          TextButton(onPressed: onRetry, child: const Text('Reintentar')),
        ],
      ),
    );
  }
}
