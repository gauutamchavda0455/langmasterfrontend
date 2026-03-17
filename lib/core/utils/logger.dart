import 'dart:developer' as developer;

/// Lightweight application logger that wraps `dart:developer` [log].
///
/// Usage:
/// ```dart
/// AppLogger.debug('Loading user profile');
/// AppLogger.info('User logged in', tag: 'AUTH');
/// AppLogger.warning('Token expires soon');
/// AppLogger.error('Failed to fetch data', error: e, stackTrace: st);
/// ```
class AppLogger {
  AppLogger._();

  /// Whether logging is enabled. Set to `false` in production builds.
  ///
  /// Typically controlled via `kDebugMode` from `package:flutter/foundation.dart`.
  static bool enabled = true;

  // -- Log levels -----------------------------------------------------------

  /// Logs a debug-level message (level 500).
  static void debug(
    String message, {
    String tag = 'APP',
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(message, tag: tag, level: 500, error: error, stackTrace: stackTrace);
  }

  /// Logs an info-level message (level 800).
  static void info(
    String message, {
    String tag = 'APP',
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(message, tag: tag, level: 800, error: error, stackTrace: stackTrace);
  }

  /// Logs a warning-level message (level 900).
  static void warning(
    String message, {
    String tag = 'APP',
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(message, tag: tag, level: 900, error: error, stackTrace: stackTrace);
  }

  /// Logs an error-level message (level 1000).
  static void error(
    String message, {
    String tag = 'APP',
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(message, tag: tag, level: 1000, error: error, stackTrace: stackTrace);
  }

  /// Logs a fatal/critical message (level 1200).
  static void fatal(
    String message, {
    String tag = 'APP',
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(message, tag: tag, level: 1200, error: error, stackTrace: stackTrace);
  }

  // -- Internal -------------------------------------------------------------

  static void _log(
    String message, {
    required String tag,
    required int level,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (!enabled) return;

    developer.log(
      message,
      name: tag,
      level: level,
      error: error,
      stackTrace: stackTrace,
      time: DateTime.now(),
    );
  }
}
