import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class OcrConfidenceIndicator extends StatelessWidget {
  final int confianza;
  final String textoCrudo;

  const OcrConfidenceIndicator({
    super.key,
    required this.confianza,
    required this.textoCrudo,
  });

  Color get _color {
    if (confianza >= 70) return AppColors.success;
    if (confianza >= 40) return Colors.orange;
    return AppColors.error;
  }

  String get _label {
    if (confianza >= 70) return 'Alta';
    if (confianza >= 40) return 'Media';
    return 'Baja';
  }

  IconData get _icon {
    if (confianza >= 70) return Icons.check_circle;
    if (confianza >= 40) return Icons.warning;
    return Icons.error;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _color.withValues(alpha: 0.1),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(_icon, color: _color, size: 24),
                const SizedBox(width: 8),
                Text(
                  'Confianza OCR: $_label',
                  style: TextStyle(
                    color: _color,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _color,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '$confianza%',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: confianza / 100,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(_color),
              minHeight: 8,
              borderRadius: BorderRadius.circular(4),
            ),
            if (confianza < 70) ...[
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.info_outline, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Verifica y corrige los datos extraidos antes de guardar',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ),
                ],
              ),
            ],
            if (textoCrudo.isNotEmpty) ...[
              const SizedBox(height: 16),
              ExpansionTile(
                title: const Text(
                  'Ver texto detectado',
                  style: TextStyle(fontSize: 14),
                ),
                tilePadding: EdgeInsets.zero,
                childrenPadding: const EdgeInsets.only(top: 8),
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Text(
                      textoCrudo,
                      style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 12,
                        color: Colors.grey[800],
                      ),
                    ),
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
