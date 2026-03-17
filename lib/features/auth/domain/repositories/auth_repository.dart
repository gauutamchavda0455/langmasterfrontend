import 'package:app/features/auth/domain/entities/auth_token.dart';
import 'package:app/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<(User, AuthToken)> login({
    required String email,
    required String password,
  });

  Future<(User, AuthToken)> register({
    required String email,
    required String password,
    String? displayName,
  });

  Future<void> logout();

  Future<User?> getCurrentUser();

  Future<AuthToken> refreshToken(String refreshToken);
}
