import 'package:flutter/material.dart';

import 'package:app/features/auth/presentation/widgets/login_form.dart';
import 'package:app/features/auth/presentation/widgets/social_sign_in_buttons.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 48),
              // TODO: Add app logo
              LoginForm(),
              SizedBox(height: 24),
              SocialSignInButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
