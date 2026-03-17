import 'package:app/features/auth/data/models/auth_token_model.dart';
import 'package:app/features/auth/data/models/user_model.dart';

class LoginResponseModel {
  final UserModel user;
  final AuthTokenModel token;

  const LoginResponseModel({
    required this.user,
    required this.token,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      token: AuthTokenModel.fromJson(json['token'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'token': token.toJson(),
    };
  }
}
