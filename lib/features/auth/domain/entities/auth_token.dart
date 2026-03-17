class AuthToken {
  final String accessToken;
  final String refreshToken;
  final DateTime? expiresAt;

  const AuthToken({
    required this.accessToken,
    required this.refreshToken,
    this.expiresAt,
  });

  bool get isExpired {
    if (expiresAt == null) return false;
    return DateTime.now().isAfter(expiresAt!);
  }
}
