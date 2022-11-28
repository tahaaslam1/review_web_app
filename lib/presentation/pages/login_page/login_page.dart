import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const String route = 'login-page';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'login',
        ),
      ),
    );
  }
}
