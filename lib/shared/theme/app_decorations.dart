import 'package:flutter/material.dart';
import 'package:app/shared/theme/app_colors.dart';

class AppDecorations {
  AppDecorations._();

  static BoxDecoration card = BoxDecoration(
    color: AppColors.surface,
    borderRadius: BorderRadius.circular(12),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 8,
        offset: Offset(0, 2),
      ),
    ],
  );

  static BoxDecoration cardDark = BoxDecoration(
    color: AppColors.darkSurface,
    borderRadius: BorderRadius.circular(12),
    boxShadow: const [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 8,
        offset: Offset(0, 2),
      ),
    ],
  );

  static BoxDecoration rounded = BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: AppColors.outlineVariant),
  );

  static BoxDecoration roundedFilled = BoxDecoration(
    color: AppColors.surfaceVariant,
    borderRadius: BorderRadius.circular(12),
  );

  static BoxDecoration bottomSheet = const BoxDecoration(
    color: AppColors.surface,
    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 10,
        offset: Offset(0, -2),
      ),
    ],
  );

  static BoxDecoration inputField = BoxDecoration(
    color: AppColors.surfaceVariant,
    borderRadius: BorderRadius.circular(8),
    border: Border.all(color: AppColors.outline),
  );
}
