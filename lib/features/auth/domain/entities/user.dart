class User {
  final String id;
  final String email;
  final String? displayName;
  final String? photoUrl;
  final DateTime? createdAt;

  const User({
    required this.id,
    required this.email,
    this.displayName,
    this.photoUrl,
    this.createdAt,
  });
}
