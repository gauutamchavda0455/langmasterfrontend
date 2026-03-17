import 'package:app/features/auth/data/models/auth_token_model.dart';
import 'package:app/features/auth/data/models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheToken(AuthTokenModel token);

  Future<AuthTokenModel?> getCachedToken();

  Future<void> cacheUser(UserModel user);

  Future<UserModel?> getCachedUser();

  Future<void> clearCache();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  // TODO: Inject SharedPreferences or secure storage

  AuthLocalDataSourceImpl();

  @override
  Future<void> cacheToken(AuthTokenModel token) async {
    // TODO: Store token in secure storage
    throw UnimplementedError();
  }

  @override
  Future<AuthTokenModel?> getCachedToken() async {
    // TODO: Retrieve token from secure storage
    throw UnimplementedError();
  }

  @override
  Future<void> cacheUser(UserModel user) async {
    // TODO: Store user in local storage
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> getCachedUser() async {
    // TODO: Retrieve user from local storage
    throw UnimplementedError();
  }

  @override
  Future<void> clearCache() async {
    // TODO: Clear all cached auth data
    throw UnimplementedError();
  }
}
