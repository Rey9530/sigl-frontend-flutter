import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// Widget compacto para mostrar nivel de confianza de un campo OCR
class ConfidenceBadge extends StatelessWidget {
  final int confianza;
  final bool showLabel;

  const ConfidenceBadge({
    super.key,
    required this.confianza,
    this.showLabel = true,
  });

  Color get _color {
    if (confianza >= 80) return AppColors.success;
    if (confianza >= 50) return Colors.orange;
    return AppColors.error;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: _color,
            shape: BoxShape.circle,
          ),
        ),
        if (showLabel) ...[
          const SizedBox(width: 4),
          Text(
            '$confianza%',
            style: TextStyle(
              fontSize: 11,
              color: _color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
    );
  }
}
