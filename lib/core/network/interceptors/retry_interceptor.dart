// TODO: Add `dio` to pubspec.yaml dependencies.
// dependencies:
//   dio: ^5.4.0

import 'dart:developer' as developer;

import 'package:app/core/constants/api_constants.dart';

/// Interceptor that automatically retries failed requests a configurable
/// number of times with an exponential back-off delay.
///
/// Only retryable errors (timeouts, connection errors, 5xx) are retried.
///
/// TODO: Extend `Interceptor` from Dio once the dependency is added.
///
/// ```dart
/// class RetryInterceptor extends Interceptor { ... }
/// ```
class RetryInterceptor {
  RetryInterceptor({
    this.maxRetries = ApiConstants.maxRetries,
    this.retryDelayMs = ApiConstants.retryDelay,
    // TODO: Accept a Dio instance for retrying requests.
    // required this.dio,
  });

  /// Maximum number of retry attempts.
  final int maxRetries;

  /// Base delay in milliseconds between retries (doubled on each attempt).
  final int retryDelayMs;

  // TODO: Hold reference to the Dio instance so we can re-issue requests.
  // final Dio dio;

  /// Key used to track the retry count on a given request.
  static const String _retryCountKey = 'retryCount';

  // ---------------------------------------------------------------------------
  // Interceptor overrides (uncomment when Dio is added)
  // ---------------------------------------------------------------------------

  // @override
  Future<void> onError(dynamic error, dynamic handler) async {
    // TODO: Implement once Dio is available.
    //
    // final requestOptions = error.requestOptions;
    // final int retryCount = requestOptions.extra[_retryCountKey] ?? 0;
    //
    // if (_shouldRetry(error) && retryCount < maxRetries) {
    //   final nextRetry = retryCount + 1;
    //   requestOptions.extra[_retryCountKey] = nextRetry;
    //
    //   final delay = Duration(milliseconds: retryDelayMs * (1 << (nextRetry - 1)));
    //   developer.log(
    //     'Retrying request (attempt $nextRetry/$maxRetries) after ${delay.inMilliseconds}ms',
    //     name: 'RetryInterceptor',
    //   );
    //
    //   await Future.delayed(delay);
    //
    //   try {
    //     final response = await dio.fetch(requestOptions);
    //     return handler.resolve(response);
    //   } on DioException catch (e) {
    //     return handler.reject(e);
    //   }
    // }
    //
    // return handler.next(error);
  }

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  /// Determines whether the given error is eligible for a retry.
  ///
  /// TODO: Uncomment once Dio is available.
  // bool _shouldRetry(DioException error) {
  //   // Retry on connection issues and server errors (5xx).
  //   if (error.type == DioExceptionType.connectionTimeout ||
  //       error.type == DioExceptionType.sendTimeout ||
  //       error.type == DioExceptionType.receiveTimeout ||
  //       error.type == DioExceptionType.connectionError) {
  //     return true;
  //   }
  //
  //   final statusCode = error.response?.statusCode;
  //   if (statusCode != null && statusCode >= 500) {
  //     return true;
  //   }
  //
  //   return false;
  // }
}
