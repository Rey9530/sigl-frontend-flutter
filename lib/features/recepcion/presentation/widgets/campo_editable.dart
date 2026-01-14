import 'package:flutter/material.dart';
import 'confidence_badge.dart';

/// Widget para mostrar un campo editable con indicador de confianza OCR
class CampoEditable extends StatelessWidget {
  final String label;
  final String? value;
  final int? confianza;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final String? prefijo;
  final bool enabled;
  final TextEditingController? controller;

  final int? maxLines;
  final FormFieldValidator<String>? validator;

  const CampoEditable({
    super.key,
    required this.label,
    this.value,
    this.confianza,
    this.onChanged,
    this.keyboardType,
    this.prefijo,
    this.enabled = true,
    this.controller,
    this.maxLines = 1,
    this.validator,
  });

  bool get _confianzaBaja => (confianza ?? 0) < 50;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: _confianzaBaja ? Colors.red[700] : Colors.grey[700],
              ),
            ),
            const SizedBox(width: 8),
            if (confianza != null) ConfidenceBadge(confianza: confianza!),
          ],
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          initialValue: controller == null ? value : null,
          onChanged: onChanged,
          keyboardType: keyboardType,
          enabled: enabled,
          maxLines: maxLines,

          validator: validator,
          style: const TextStyle(fontSize: 15),
          decoration: InputDecoration(
            prefixText: prefijo,
            prefixStyle: const TextStyle(fontSize: 15, color: Colors.black87),
            isDense: true,
            filled: true,
            fillColor: enabled
                ? (_confianzaBaja ? Colors.red[50] : Colors.grey[50])
                : Colors.grey[100],
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: _confianzaBaja ? Colors.red[300]! : Colors.grey[300]!,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: _confianzaBaja ? Colors.red[300]! : Colors.grey[300]!,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: _confianzaBaja
                    ? Colors.red
                    : Theme.of(context).primaryColor,
                width: 2,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
          ),
        ),
      ],
    );
  }
}
