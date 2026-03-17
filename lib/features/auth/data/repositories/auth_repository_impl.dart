import 'package:app/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:app/features/auth/domain/entities/auth_token.dart';
import 'package:app/features/auth/domain/entities/user.dart';
import 'package:app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required AuthLocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  @override
  Future<(User, AuthToken)> login({
    required String email,
    required String password,
  }) async {
    // TODO: Add error handling and network checks
    final response = await _remoteDataSource.login(
      email: email,
      password: password,
    );
    await _localDataSource.cacheToken(response.token);
    await _localDataSource.cacheUser(response.user);
    return (response.user, response.token);
  }

  @override
  Future<(User, AuthToken)> register({
    required String email,
    required String password,
    String? displayName,
  }) async {
    // TODO: Add error handling and network checks
    final response = await _remoteDataSource.register(
      email: email,
      password: password,
      displayName: displayName,
    );
    await _localDataSource.cacheToken(response.token);
    await _localDataSource.cacheUser(response.user);
    return (response.user, response.token);
  }

  @override
  Future<void> logout() async {
    // TODO: Add error handling
    final token = await _localDataSource.getCachedToken();
    if (token != null) {
      await _remoteDataSource.logout(token.accessToken);
    }
    await _localDataSource.clearCache();
  }

  @override
  Future<User?> getCurrentUser() async {
    // TODO: Add network check, fallback to cache
    return _localDataSource.getCachedUser();
  }

  @override
  Future<AuthToken> refreshToken(String refreshToken) async {
    // TODO: Add error handling
    final newToken = await _remoteDataSource.refreshToken(refreshToken);
    await _localDataSource.cacheToken(newToken);
    return newToken;
  }
}
