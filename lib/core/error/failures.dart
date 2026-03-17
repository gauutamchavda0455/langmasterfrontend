/// Base failure class used in the domain layer to represent errors
/// without leaking implementation details (HTTP codes, platform exceptions,
/// etc.) across boundaries.
///
/// Every failure carries an optional human-readable [message] and an
/// optional [statusCode] for cases where the caller needs it.
abstract class Failure {
  const Failure({this.message = '', this.statusCode});

  /// A human-readable description of the failure.
  final String message;

  /// An optional status / error code (e.g., HTTP status code).
  final int? statusCode;

  @override
  String toString() => '$runtimeType(message: $message, statusCode: $statusCode)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Failure &&
          runtimeType == other.runtimeType &&
          message == other.message &&
          statusCode == other.statusCode;

  @override
  int get hashCode => message.hashCode ^ statusCode.hashCode;
}

/// Failure originating from a remote server (API error, 5xx, etc.).
class ServerFailure extends Failure {
  const ServerFailure({super.message = 'Server error', super.statusCode});
}

/// Failure originating from the local cache layer.
class CacheFailure extends Failure {
  const CacheFailure({super.message = 'Cache error', super.statusCode});
}

/// Failure caused by a missing or unreliable network connection.
class NetworkFailure extends Failure {
  const NetworkFailure({
    super.message = 'No internet connection',
    super.statusCode,
  });
}

/// Failure when the user is not authenticated or the token has expired.
class AuthFailure extends Failure {
  const AuthFailure({
    super.message = 'Authentication error',
    super.statusCode,
  });
}

/// Failure when input validation fails in the domain layer.
class ValidationFailure extends Failure {
  const ValidationFailure({super.message = 'Validation error', super.statusCode});
}

/// Generic / unexpected failure.
class UnexpectedFailure extends Failure {
  const UnexpectedFailure({
    super.message = 'An unexpected error occurred',
    super.statusCode,
  });
}
