import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../domain/entities/recepcion_paquete.dart';
import '../providers/recepcion_provider.dart';
import '../widgets/costo_envio_modal.dart';

class ConfirmacionScreen extends ConsumerStatefulWidget {
  const ConfirmacionScreen({super.key});

  @override
  ConsumerState<ConfirmacionScreen> createState() => _ConfirmacionScreenState();
}

class _ConfirmacionScreenState extends ConsumerState<ConfirmacionScreen> {
  bool _modalMostrado = false;

  void _mostrarModalCostoEnvio(RecepcionPaquete recepcion) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => CostoEnvioModal(
        onConfirmar: (costoEnvio) async {
          return await ref.read(recepcionProvider.notifier).actualizarCostoEnvio(
                recepcion.id,
                costoEnvio,
              );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(recepcionProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vineta Procesada'),
        automaticallyImplyLeading: false,
      ),
      body: state.maybeWhen(
        recepcionCreada: (recepcion, imagenPath) {
          if (recepcion.costoEnvio == null && !_modalMostrado) {
            _modalMostrado = true;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _mostrarModalCostoEnvio(recepcion);
            });
          }
          return _buildContent(context, recepcion);
        },
        orElse: () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('No hay datos de recepcion'),
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

  Widget _buildContent(
    BuildContext context,
    RecepcionPaquete recepcion,
  ) {
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
            'Vineta procesada exitosamente',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'La informacion sera revisada en el sistema web',
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
                    recepcion.codigoRastreo,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3,
                          color: AppColors.primary,
                        ),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    onPressed: () {
                      Clipboard.setData(
                        ClipboardData(text: recepcion.codigoRastreo),
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
          const SizedBox(height: 24),

          // Codigo QR
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    'Escanear para rastrear',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: QrImageView(
                      data: recepcion.codigoRastreo,
                      version: QrVersions.auto,
                      size: 180,
                      backgroundColor: Colors.white,
                      errorCorrectionLevel: QrErrorCorrectLevel.M,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Resumen de datos OCR
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Datos Extraidos',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  _InfoRow(
                    icon: Icons.store,
                    label: 'Vendedor',
                    value: recepcion.vendedor ?? 'No detectado',
                  ),
                  _InfoRow(
                    icon: Icons.person,
                    label: 'Cliente',
                    value: recepcion.cliente ?? 'No detectado',
                  ),
                  _InfoRow(
                    icon: Icons.phone,
                    label: 'Telefono',
                    value: recepcion.telefono ?? 'No detectado',
                  ),
                  const Divider(),
                  _InfoRow(
                    icon: Icons.place,
                    label: 'Destino',
                    value: recepcion.destino ?? 'No detectado',
                  ),
                  _InfoRow(
                    icon: Icons.calendar_today,
                    label: 'Dia entrega',
                    value: recepcion.diaEntrega ?? 'No detectado',
                  ),
                  const Divider(),
                  _InfoRow(
                    icon: Icons.inventory_2,
                    label: 'Precio producto',
                    value: recepcion.precioProducto != null
                        ? '\$ ${recepcion.precioProducto!.toStringAsFixed(2)}'
                        : 'No detectado',
                  ),
                  _InfoRow(
                    icon: Icons.local_shipping,
                    label: 'Costo envio',
                    value: recepcion.costoEnvio != null
                        ? '\$ ${recepcion.costoEnvio!.toStringAsFixed(2)}'
                        : 'No detectado',
                  ),
                  _InfoRow(
                    icon: Icons.attach_money,
                    label: 'Total',
                    value: recepcion.total != null
                        ? '\$ ${recepcion.total!.toStringAsFixed(2)}'
                        : 'No detectado',
                    isHighlighted: true,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Indicador de confianza
          Card(
            color: _getConfianzaColor(recepcion.confianzaGlobal),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Icon(
                    _getConfianzaIcon(recepcion.confianzaGlobal),
                    color: Colors.white,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Confianza OCR',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '${recepcion.confianzaGlobal}%',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),

          // Botones
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: 'Nueva Captura',
                  icon: Icons.camera_alt,
                  onPressed: () {
                    ref.read(recepcionProvider.notifier).reiniciar();
                    context.go('/recepcion/captura');
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomButton(
                  text: 'Ir al Inicio',
                  icon: Icons.home,
                  isOutlined: true,
                  onPressed: () {
                    ref.read(recepcionProvider.notifier).reiniciar();
                    context.go('/home');
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Color _getConfianzaColor(int confianza) {
    if (confianza >= 80) return AppColors.success;
    if (confianza >= 50) return Colors.orange;
    return AppColors.error;
  }

  IconData _getConfianzaIcon(int confianza) {
    if (confianza >= 80) return Icons.verified;
    if (confianza >= 50) return Icons.warning_amber;
    return Icons.error_outline;
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isHighlighted;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.grey[600]),
          const SizedBox(width: 8),
          Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              fontWeight: isHighlighted ? FontWeight.bold : FontWeight.w500,
              fontSize: isHighlighted ? 16 : 14,
              color: isHighlighted ? AppColors.success : null,
            ),
          ),
        ],
      ),
    );
  }
}
