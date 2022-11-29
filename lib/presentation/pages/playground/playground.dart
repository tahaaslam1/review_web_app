import 'package:flutter/material.dart';
import 'package:review_web_app/presentation/pages/home_page/home_page.dart';
import 'package:review_web_app/presentation/pages/login_page/login_page.dart';

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
                  Navigator.pushNamed(context, HomePage.route);
                },
                child: const Text('Go to Home Page'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Go to Insert Review Page'),
              ),
            ],
          ),
        ),
      ),
    ); //Navigate to Insert Review Screen
  }
}
