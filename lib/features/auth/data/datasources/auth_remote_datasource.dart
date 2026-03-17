import 'package:app/features/auth/data/models/auth_token_model.dart';
import 'package:app/features/auth/data/models/login_response_model.dart';
import 'package:app/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> login({
    required String email,
    required String password,
  });

  Future<LoginResponseModel> register({
    required String email,
    required String password,
    String? displayName,
  });

  Future<void> logout(String accessToken);

  Future<UserModel> getCurrentUser(String accessToken);

  Future<AuthTokenModel> refreshToken(String refreshToken);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  // TODO: Inject HTTP client (e.g., Dio)

  AuthRemoteDataSourceImpl();

  @override
  Future<LoginResponseModel> login({
    required String email,
    required String password,
  }) async {
    // TODO: Implement API call to POST /auth/login
    throw UnimplementedError();
  }

  @override
  Future<LoginResponseModel> register({
    required String email,
    required String password,
    String? displayName,
  }) async {
    // TODO: Implement API call to POST /auth/register
    throw UnimplementedError();
  }

  @override
  Future<void> logout(String accessToken) async {
    // TODO: Implement API call to POST /auth/logout
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getCurrentUser(String accessToken) async {
    // TODO: Implement API call to GET /auth/me
    throw UnimplementedError();
  }

  @override
  Future<AuthTokenModel> refreshToken(String refreshToken) async {
    // TODO: Implement API call to POST /auth/refresh
    throw UnimplementedError();
  }
}
