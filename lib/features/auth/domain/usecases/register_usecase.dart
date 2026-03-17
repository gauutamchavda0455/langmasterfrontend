import 'package:app/features/auth/domain/entities/auth_token.dart';
import 'package:app/features/auth/domain/entities/user.dart';
import 'package:app/features/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository _repository;

  const RegisterUseCase(this._repository);

  Future<(User, AuthToken)> call({
    required String email,
    required String password,
    String? displayName,
  }) {
    // TODO: Add input validation
    return _repository.register(
      email: email,
      password: password,
      displayName: displayName,
    );
  }
}
