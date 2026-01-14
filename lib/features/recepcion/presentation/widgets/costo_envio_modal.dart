import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../../../shared/widgets/custom_text_field.dart';

class CostoEnvioModal extends StatefulWidget {
  final Future<bool> Function(double costoEnvio) onConfirmar;

  const CostoEnvioModal({
    super.key,
    required this.onConfirmar,
  });

  @override
  State<CostoEnvioModal> createState() => _CostoEnvioModalState();
}

class _CostoEnvioModalState extends State<CostoEnvioModal> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  bool _isLoading = false;
  String? _errorMessage;

  bool get _isValid {
    final valor = double.tryParse(_controller.text);
    return valor != null && valor >= 0;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _onConfirmar() async {
    if (!_isValid) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final costoEnvio = double.parse(_controller.text);
    final success = await widget.onConfirmar(costoEnvio);

    if (!mounted) return;

    if (success) {
      Navigator.of(context).pop();
    } else {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Error al guardar. Intenta de nuevo.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 24,
          right: 24,
          top: 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.warning.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.local_shipping,
                size: 48,
                color: AppColors.warning,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Costo de Envio Requerido',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'El sistema no pudo detectar el costo de envio. '
              'Por favor ingresalo manualmente para continuar.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),
            CustomTextField(
              controller: _controller,
              focusNode: _focusNode,
              label: 'Costo de Envio',
              hint: '0.00',
              prefixIcon: Icons.attach_money,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
              ],
              onChanged: (_) => setState(() {
                _errorMessage = null;
              }),
              enabled: !_isLoading,
              errorText: _errorMessage,
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: 'Confirmar',
              isLoading: _isLoading,
              onPressed: _isValid && !_isLoading ? _onConfirmar : null,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
