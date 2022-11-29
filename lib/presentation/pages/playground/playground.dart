import 'package:flutter/material.dart';
import 'package:review_web_app/presentation/pages/edit_user_profile/edit_user_profile.dart';
import 'package:review_web_app/presentation/pages/login_page/login_page.dart';
import 'package:review_web_app/presentation/pages/view_profile_page/view_profile_page.dart';

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
                  Navigator.pushNamed(context, ViewProfilePage.route);
                },
                child: const Text('Go to view profile Page'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, EditUserProfile.route);
                },
                child: const Text('Go to edit profile Page'),
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
