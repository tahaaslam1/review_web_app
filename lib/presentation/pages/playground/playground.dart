import 'package:flutter/material.dart';
import 'package:review_web_app/presentation/pages/login_page/login_page.dart';

import '../signup-page/signup_page.dart';

class Playground extends StatelessWidget {
  static const String route = '/';

  const Playground({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playground'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 12,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginPage.route);
                },
                child: const Text('Go to Login Page'),
              ),
              TextButton(
                onPressed: () {
                  //Navigate to Register Screen
                },
                child: const Text('Go to Register Page'),
              ),
              TextButton(
                onPressed: () {
                  //Navigate to Messages Screen
                },
                child: const Text('Go to Landing Page'),
              ),
              TextButton(
                onPressed: () {
                  //Navigate to Insert Review Screen
                },
                child: const Text('Go to Insert Review Page'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, SignUpPage.route);
                  //Navigate to Insert Review Screen
                },
                child: const Text('Signup page'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Main App'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
