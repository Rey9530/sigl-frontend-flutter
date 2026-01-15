import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// Modal para ingresar codigo de rastreo manualmente
/// Se muestra cuando el OCR no puede detectar el codigo
class CodigoManualModal extends StatefulWidget {
  final Function(String) onConfirmar;
  final String? mensajeError;

  const CodigoManualModal({
    super.key,
    required this.onConfirmar,
    this.mensajeError,
  });

  @override
  State<CodigoManualModal> createState() => _CodigoManualModalState();
}

class _CodigoManualModalState extends State<CodigoManualModal> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 24,
        right: 24,
        top: 24,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle para arrastrar
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),

            // Icono
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.warning.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.qr_code_scanner,
                size: 48,
                color: AppColors.warning,
              ),
            ),
            const SizedBox(height: 16),

            // Titulo
            Text(
              'Codigo no detectado',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),

            // Mensaje
            Text(
              widget.mensajeError ??
                  'No pudimos leer el codigo automaticamente.\nIngresalo manualmente:',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),

            // Campo de texto
            TextFormField(
              controller: _controller,
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                labelText: 'Codigo de Rastreo',
                hintText: 'Ej: ABC123 o SV20260109...',
                prefixIcon: const Icon(Icons.tag),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Ingresa el codigo de rastreo';
                }
                if (value.trim().length < 6) {
                  return 'El codigo debe tener al menos 6 caracteres';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),

            // Botones
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Cancelar'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pop(context);
                        widget.onConfirmar(_controller.text.trim().toUpperCase());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Buscar Paquete',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
