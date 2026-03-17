import 'package:flutter/material.dart';

/// Convenience getters on [BuildContext] to reduce boilerplate.
///
/// Instead of `Theme.of(context).textTheme` you can write
/// `context.textTheme`.
extension ContextExtensions on BuildContext {
  // -- Theme ---------------------------------------------------------------

  /// The current [ThemeData].
  ThemeData get theme => Theme.of(this);

  /// The current [TextTheme].
  TextTheme get textTheme => theme.textTheme;

  /// The current [ColorScheme].
  ColorScheme get colorScheme => theme.colorScheme;

  /// Whether the current theme brightness is dark.
  bool get isDarkMode => theme.brightness == Brightness.dark;

  // -- Media query ---------------------------------------------------------

  /// The current [MediaQueryData].
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Screen size shortcut.
  Size get screenSize => mediaQuery.size;

  /// Screen width shortcut.
  double get screenWidth => screenSize.width;

  /// Screen height shortcut.
  double get screenHeight => screenSize.height;

  /// Padding (safe area insets) shortcut.
  EdgeInsets get padding => mediaQuery.padding;

  /// View insets (e.g., keyboard height) shortcut.
  EdgeInsets get viewInsets => mediaQuery.viewInsets;

  /// Device pixel ratio.
  double get devicePixelRatio => mediaQuery.devicePixelRatio;

  /// The current platform brightness (light/dark) reported by the OS.
  Brightness get platformBrightness => mediaQuery.platformBrightness;

  /// Text scale factor set by the user in accessibility settings.
  double get textScaleFactor => mediaQuery.textScaleFactor;

  // -- Navigation ----------------------------------------------------------

  /// Shorthand for `Navigator.of(context)`.
  NavigatorState get navigator => Navigator.of(this);

  /// Shorthand for `Navigator.of(context).pop()`.
  void pop<T>([T? result]) => Navigator.of(this).pop(result);

  /// Shorthand for pushing a named route.
  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed<T>(routeName, arguments: arguments);
  }

  // -- Scaffold / Snackbar -------------------------------------------------

  /// Shows a [SnackBar] using the nearest [ScaffoldMessenger].
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    String message, {
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) {
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(content: Text(message), duration: duration, action: action),
    );
  }

  // -- Focus ---------------------------------------------------------------

  /// Unfocuses (dismisses the keyboard) the current focus node.
  void unfocus() => FocusScope.of(this).unfocus();
}
