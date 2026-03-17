import 'package:app/features/auth/domain/entities/auth_token.dart';
import 'package:app/features/auth/domain/repositories/auth_repository.dart';

class RefreshTokenUseCase {
  final AuthRepository _repository;

  const RefreshTokenUseCase(this._repository);

  Future<AuthToken> call(String refreshToken) {
    return _repository.refreshToken(refreshToken);
  }
}
