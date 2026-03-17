import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.isLoading = false,
    this.icon,
    this.style,
    this.width,
  });

  final VoidCallback? onPressed;
  final String label;
  final bool isLoading;
  final Widget? icon;
  final ButtonStyle? style;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: style,
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : icon != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    icon!,
                    const SizedBox(width: 8),
                    Text(label),
                  ],
                )
              : Text(label),
    );

    if (width != null) {
      return SizedBox(width: width, child: button);
    }
    return button;
  }
}
