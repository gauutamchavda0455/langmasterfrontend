/// API-level constants used across the networking layer.
///
/// All values are compile-time constants so they can be used in annotations
/// and switch statements.
class ApiConstants {
  ApiConstants._(); // prevent instantiation

  /// Base URL for the production API.
  static const String baseUrl = 'https://api.example.com/v1';

  /// Base URL used during development / staging.
  static const String stagingUrl = 'https://staging-api.example.com/v1';

  /// Default connection timeout in milliseconds.
  static const int connectionTimeout = 30000;

  /// Default receive timeout in milliseconds.
  static const int receiveTimeout = 30000;

  /// Default send timeout in milliseconds.
  static const int sendTimeout = 30000;

  /// Maximum number of retry attempts for failed requests.
  static const int maxRetries = 3;

  /// Delay between retry attempts in milliseconds.
  static const int retryDelay = 1000;

  // -- Header keys --------------------------------------------------------

  static const String headerAuthorization = 'Authorization';
  static const String headerContentType = 'Content-Type';
  static const String headerAccept = 'Accept';
  static const String headerApiKey = 'X-Api-Key';

  // -- Content types -------------------------------------------------------

  static const String contentTypeJson = 'application/json';
  static const String contentTypeFormData = 'multipart/form-data';

  // -- Endpoint paths (examples) -------------------------------------------

  /// Authentication endpoints.
  static const String loginEndpoint = '/auth/login';
  static const String registerEndpoint = '/auth/register';
  static const String refreshTokenEndpoint = '/auth/refresh';
  static const String logoutEndpoint = '/auth/logout';

  /// User endpoints.
  static const String userProfile = '/user/profile';
}
