import 'package:flutter/material.dart';

class AppSnackbar {
  AppSnackbar._();

  static void show(
    BuildContext context, {
    required String message,
    Color? backgroundColor,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: backgroundColor,
          duration: duration,
          action: action,
        ),
      );
  }

  static void success(BuildContext context, {required String message}) {
    show(
      context,
      message: message,
      backgroundColor: Colors.green,
    );
  }

  static void error(BuildContext context, {required String message}) {
    show(
      context,
      message: message,
      backgroundColor: Colors.red,
    );
  }

  static void info(BuildContext context, {required String message}) {
    show(
      context,
      message: message,
      backgroundColor: Colors.blue,
    );
  }
}
