/// Exception thrown when a remote API call fails.
class ServerException implements Exception {
  const ServerException({this.message = 'Server error', this.statusCode});

  /// Human-readable error description.
  final String message;

  /// HTTP status code, when available.
  final int? statusCode;

  @override
  String toString() => 'ServerException(message: $message, statusCode: $statusCode)';
}

/// Exception thrown when a local cache operation fails.
class CacheException implements Exception {
  const CacheException({this.message = 'Cache error'});

  final String message;

  @override
  String toString() => 'CacheException(message: $message)';
}

/// Exception thrown when the device has no network connectivity.
class NetworkException implements Exception {
  const NetworkException({this.message = 'No internet connection'});

  final String message;

  @override
  String toString() => 'NetworkException(message: $message)';
}

/// Exception thrown when the user's auth token is missing or expired.
class UnauthorizedException implements Exception {
  const UnauthorizedException({this.message = 'Unauthorized'});

  final String message;

  @override
  String toString() => 'UnauthorizedException(message: $message)';
}

/// Exception thrown when a request times out.
class TimeoutException implements Exception {
  const TimeoutException({this.message = 'Request timed out'});

  final String message;

  @override
  String toString() => 'TimeoutException(message: $message)';
}
