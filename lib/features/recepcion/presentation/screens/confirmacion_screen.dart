import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../providers/recepcion_provider.dart';

class ConfirmacionScreen extends ConsumerWidget {
  const ConfirmacionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(recepcionProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Paquete Registrado'),
        automaticallyImplyLeading: false,
      ),
      body: state.maybeWhen(
        paqueteCreado: (paquete) => SingleChildScrollView(
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
                'Paquete registrado exitosamente',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
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
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                              color: AppColors.primary,
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
                          data: paquete.codigoRastreo,
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

              // Resumen del paquete
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Resumen',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Divider(),
                      _InfoRow(
                        icon: Icons.person_outline,
                        label: 'Remitente',
                        value: paquete.remitenteNombre,
                      ),
                      _InfoRow(
                        icon: Icons.phone_outlined,
                        label: 'Tel. Remitente',
                        value: paquete.remitenteTelefono,
                      ),
                      const SizedBox(height: 8),
                      _InfoRow(
                        icon: Icons.person,
                        label: 'Destinatario',
                        value: paquete.destinatarioNombre,
                      ),
                      _InfoRow(
                        icon: Icons.phone,
                        label: 'Tel. Destinatario',
                        value: paquete.destinatarioTelefono,
                      ),
                      const Divider(),
                      _InfoRow(
                        icon: Icons.location_on_outlined,
                        label: 'Origen',
                        value: paquete.puntoOrigen?.nombre ?? 'N/A',
                      ),
                      _InfoRow(
                        icon: Icons.flag_outlined,
                        label: 'Destino',
                        value: paquete.puntoDestino?.nombre ?? 'N/A',
                      ),
                      const Divider(),
                      _InfoRow(
                        icon: Icons.attach_money,
                        label: 'Costo envio',
                        value: '\$${paquete.costoEnvio.toStringAsFixed(2)}',
                      ),
                      if (paquete.valorPaquete != null)
                        _InfoRow(
                          icon: Icons.inventory_2_outlined,
                          label: 'Valor declarado',
                          value:
                              '\$${paquete.valorPaquete!.toStringAsFixed(2)}',
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
                      text: 'Nuevo Paquete',
                      icon: Icons.add,
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
        ),
        orElse: () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('No hay datos de paquete'),
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

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
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
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
