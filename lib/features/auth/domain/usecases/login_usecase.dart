import 'package:app/features/auth/domain/entities/auth_token.dart';
import 'package:app/features/auth/domain/entities/user.dart';
import 'package:app/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _repository;

  const LoginUseCase(this._repository);

  Future<(User, AuthToken)> call({
    required String email,
    required String password,
  }) {
    // TODO: Add input validation
    return _repository.login(email: email, password: password);
  }
}
