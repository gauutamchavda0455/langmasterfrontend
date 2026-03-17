// TODO: Add `dio` to pubspec.yaml dependencies.
// dependencies:
//   dio: ^5.4.0

import 'dart:developer' as developer;

/// Interceptor that logs HTTP request and response details to the
/// developer console.
///
/// Only active in debug mode to avoid leaking sensitive data in release
/// builds.
///
/// TODO: Extend `Interceptor` from Dio once the dependency is added.
///
/// ```dart
/// class LoggingInterceptor extends Interceptor { ... }
/// ```
class LoggingInterceptor {
  LoggingInterceptor({this.enableInRelease = false});

  /// Whether to log in release mode. Defaults to `false`.
  final bool enableInRelease;

  // ---------------------------------------------------------------------------
  // Interceptor overrides (uncomment when Dio is added)
  // ---------------------------------------------------------------------------

  /// Logs the outgoing request.
  // @override
  void onRequest(dynamic options, dynamic handler) {
    // TODO: Implement once Dio is available.
    //
    // _log('──── REQUEST ────');
    // _log('${options.method} ${options.uri}');
    // _log('Headers: ${options.headers}');
    // if (options.data != null) {
    //   _log('Body: ${options.data}');
    // }
    // handler.next(options);
  }

  /// Logs the received response.
  // @override
  void onResponse(dynamic response, dynamic handler) {
    // TODO: Implement once Dio is available.
    //
    // _log('──── RESPONSE ────');
    // _log('${response.statusCode} ${response.requestOptions.uri}');
    // _log('Data: ${response.data}');
    // handler.next(response);
  }

  /// Logs the error.
  // @override
  void onError(dynamic error, dynamic handler) {
    // TODO: Implement once Dio is available.
    //
    // _log('──── ERROR ────');
    // _log('${error.requestOptions.method} ${error.requestOptions.uri}');
    // _log('Message: ${error.message}');
    // if (error.response != null) {
    //   _log('Status: ${error.response?.statusCode}');
    //   _log('Data: ${error.response?.data}');
    // }
    // handler.next(error);
  }

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  /// Writes a log line using `dart:developer` [log].
  void _log(String message) {
    // In a real app, gate this behind `kDebugMode` from foundation.
    // ignore: avoid_print
    developer.log(message, name: 'HTTP');
  }
}
