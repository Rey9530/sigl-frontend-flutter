import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/registro_recaudacion.dart';
import '../providers/caja_provider.dart';
import '../providers/caja_state.dart';
import '../widgets/contador_caja_widget.dart';

class PendientesScreen extends ConsumerStatefulWidget {
  const PendientesScreen({super.key});

  @override
  ConsumerState<PendientesScreen> createState() => _PendientesScreenState();
}

class _PendientesScreenState extends ConsumerState<PendientesScreen> {
  @override
  void initState() {
    super.initState();
    // Cargar pendientes al entrar
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(cajaProvider.notifier).cargarPendientes();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(cajaProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pendientes de Entregar'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(cajaProvider.notifier).cargarResumen();
              ref.read(cajaProvider.notifier).cargarPendientes();
            },
            tooltip: 'Actualizar',
          ),
        ],
      ),
      body: Column(
        children: [
          // Widget contador de total
          const ContadorCajaWidget(),

          // Lista de paquetes pendientes
          Expanded(child: _buildListaPendientes(state)),
        ],
      ),
    );
  }

  Widget _buildListaPendientes(CajaState state) {
    if (state is CajaLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is CajaError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text(state.mensaje),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => ref.read(cajaProvider.notifier).cargarResumen(),
              child: const Text('Reintentar'),
            ),
          ],
        ),
      );
    }

    if (state is CajaLoaded) {
      final pendientes = state.pendientes;

      if (pendientes.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 64,
                color: Colors.green[300],
              ),
              const SizedBox(height: 16),
              const Text(
                'No hay pendientes',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              Text(
                'Todos los paquetes han sido entregados',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        );
      }

      return RefreshIndicator(
        onRefresh: () async {
          await ref.read(cajaProvider.notifier).cargarResumen();
          await ref.read(cajaProvider.notifier).cargarPendientes();
        },
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: pendientes.length,
          itemBuilder: (context, index) {
            final item = pendientes[index];
            return _PendienteCard(registro: item);
          },
        ),
      );
    }

    return const SizedBox.shrink();
  }
}

class _PendienteCard extends StatelessWidget {
  final RegistroRecaudacion registro;

  const _PendienteCard({required this.registro});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Codigo de rastreo
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    registro.codigoRastreo,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),

                // Total
                Text(
                  '\$ ${registro.costoEnvio.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              registro.destinatarioNombre,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _InfoChip(
                  label: 'Producto',
                  valor: '\$ ${registro.precioProducto.toStringAsFixed(2)}',
                ),
                const SizedBox(width: 12),
                _InfoChip(
                  label: 'Envio',
                  valor: '\$ ${registro.costoEnvio.toStringAsFixed(2)}',
                ),
                const Spacer(),
                Text(
                  _formatFecha(registro.creadoEn),
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatFecha(DateTime fecha) {
    final ahora = DateTime.now();
    final diferencia = ahora.difference(fecha);

    if (diferencia.inMinutes < 60) {
      return 'Hace ${diferencia.inMinutes} min';
    } else if (diferencia.inHours < 24) {
      return 'Hace ${diferencia.inHours} h';
    } else {
      return '${fecha.day}/${fecha.month}/${fecha.year}';
    }
  }
}

class _InfoChip extends StatelessWidget {
  final String label;
  final String valor;

  const _InfoChip({required this.label, required this.valor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$label: ',
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          ),
          Text(
            valor,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
