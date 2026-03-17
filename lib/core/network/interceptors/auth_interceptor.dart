// TODO: Add `dio` to pubspec.yaml dependencies.
// dependencies:
//   dio: ^5.4.0

import 'package:app/core/constants/api_constants.dart';

/// Interceptor that attaches the current auth token to every outgoing
/// request and handles 401 responses by attempting a token refresh.
///
/// TODO: Extend `Interceptor` from the Dio package once the dependency is added.
///
/// ```dart
/// class AuthInterceptor extends Interceptor { ... }
/// ```
class AuthInterceptor {
  AuthInterceptor({
    // TODO: Inject a token provider / auth repository.
    // required TokenProvider tokenProvider,
  });

  // TODO: Store reference to token provider.
  // final TokenProvider _tokenProvider;

  /// Called before every request is sent.
  ///
  /// Reads the current access token and attaches it as a Bearer token.
  // @override
  Future<void> onRequest(
    dynamic options,
    dynamic handler,
  ) async {
    // TODO: Implement once Dio is available.
    //
    // final token = await _tokenProvider.accessToken;
    // if (token != null && token.isNotEmpty) {
    //   options.headers[ApiConstants.headerAuthorization] = 'Bearer $token';
    // }
    // handler.next(options);
  }

  /// Called when a response is received.
  // @override
  Future<void> onResponse(
    dynamic response,
    dynamic handler,
  ) async {
    // TODO: Pass through by default.
    // handler.next(response);
  }

  /// Called when an error occurs.
  ///
  /// If the error is a 401, attempt to refresh the token and retry the
  /// original request. If the refresh itself fails, reject.
  // @override
  Future<void> onError(
    dynamic error,
    dynamic handler,
  ) async {
    // TODO: Implement token refresh logic.
    //
    // if (error.response?.statusCode == 401) {
    //   try {
    //     final newToken = await _tokenProvider.refreshToken();
    //     // Retry the failed request with the new token.
    //     final options = error.requestOptions;
    //     options.headers[ApiConstants.headerAuthorization] = 'Bearer $newToken';
    //     final response = await Dio().fetch(options);
    //     return handler.resolve(response);
    //   } catch (_) {
    //     // Refresh failed – propagate the original error.
    //     return handler.reject(error);
    //   }
    // }
    // handler.next(error);
  }
}
