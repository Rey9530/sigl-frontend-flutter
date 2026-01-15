import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../domain/entities/entrega_result.dart';
import '../providers/entrega_provider.dart';
import '../providers/entrega_state.dart';

class ConfirmacionEntregaScreen extends ConsumerWidget {
  const ConfirmacionEntregaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(entregaProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrega Registrada'),
        automaticallyImplyLeading: false,
      ),
      body: state is EntregaExitosa
          ? _buildContent(context, ref, state.resultado)
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('No hay datos de entrega'),
                  const SizedBox(height: 16),
                  CustomButton(
                    text: 'Volver al inicio',
                    onPressed: () {
                      ref.read(entregaProvider.notifier).reiniciar();
                      context.go('/home');
                    },
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref,
    EntregaResult resultado,
  ) {
    final paquete = resultado.paquete;
    final evidencia = resultado.evidencia;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          // Icono de exito
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.success.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_circle,
              size: 80,
              color: AppColors.success,
            ),
          ),
          const SizedBox(height: 24),

          Text(
            'Entrega Registrada',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            resultado.mensaje,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),

          // Codigo de rastreo
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    'Codigo de Rastreo',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                  ),
                  const SizedBox(height: 8),
                  SelectableText(
                    paquete.codigoRastreo,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3,
                          color: AppColors.success,
                        ),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    onPressed: () {
                      Clipboard.setData(
                        ClipboardData(text: paquete.codigoRastreo),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Codigo copiado al portapapeles'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    icon: const Icon(Icons.copy, size: 18),
                    label: const Text('Copiar codigo'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Estado del paquete
          Card(
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.success.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.local_shipping,
                  color: AppColors.success,
                ),
              ),
              title: const Text('Estado'),
              subtitle: Text(
                paquete.estadoActual,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.success,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Datos del destinatario
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.person, color: AppColors.primary),
                      const SizedBox(width: 8),
                      Text(
                        'Destinatario',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  const Divider(),
                  _buildInfoRow(
                    context,
                    'Nombre',
                    paquete.destinatarioNombre,
                  ),
                  if (paquete.destinatarioTelefono != null)
                    _buildInfoRow(
                      context,
                      'Telefono',
                      paquete.destinatarioTelefono!,
                    ),
                  if (paquete.puntoDestino != null)
                    _buildInfoRow(
                      context,
                      'Destino',
                      '${paquete.puntoDestino!.nombre}${paquete.puntoDestino!.ciudad != null ? ' - ${paquete.puntoDestino!.ciudad}' : ''}',
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Datos de la evidencia
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.verified, color: AppColors.success),
                      const SizedBox(width: 8),
                      Text(
                        'Evidencia de Entrega',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  const Divider(),
                  _buildInfoRow(
                    context,
                    'Fecha/Hora',
                    _formatDateTime(evidencia.entregadoEn),
                  ),
                  _buildInfoRow(
                    context,
                    'Confianza OCR',
                    '${resultado.confianzaOcr}%',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),

          // Botones de accion
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    ref.read(entregaProvider.notifier).reiniciar();
                    context.go('/home');
                  },
                  icon: const Icon(Icons.home),
                  label: const Text('Ir al Inicio'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    ref.read(entregaProvider.notifier).reiniciar();
                    context.go('/entrega/captura');
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Nueva Entrega'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.success,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    final day = dateTime.day.toString().padLeft(2, '0');
    final month = dateTime.month.toString().padLeft(2, '0');
    final year = dateTime.year;
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$day/$month/$year $hour:$minute';
  }
}
