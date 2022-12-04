import 'package:flutter/material.dart';
import 'package:review_web_app/presentation/pages/insert_review_page/insert_review_page.dart';
import 'package:provider/provider.dart';

import 'package:review_web_app/presentation/pages/accept-reject-screen/accept-reject.dart';
import 'package:review_web_app/presentation/pages/edit_user_profile/edit_user_profile.dart';
import 'package:review_web_app/presentation/pages/home_page/home_page.dart';
import 'package:review_web_app/presentation/pages/login_page/login_page.dart';
import 'package:review_web_app/presentation/pages/view_profile_page/view_profile_page.dart';
import '../signup-page/signup_page.dart';
import '../../../business_logic/providers/admin_provide.dart';
import '../admin_screen/admin_screen.dart';


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
              ElevatedButton(
                child: Text("Admin Screen"),
                onPressed: () async {
                  await context.read<AdminProvider>().GetAllUsers();
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminScreen(),
                    ),
                  );
                  //  tryGettingComp(context);
                },
              ),
              ElevatedButton(
                child: Text("goto user profile"),
                onPressed: () async {
                  await context.read<AdminProvider>().GetAllUsers();
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewProfilePage(
                            "5020b68e-d0a2-4062-8713-cf7cea98d387", "1")),
                  );
                  //  tryGettingComp(context);
                },
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
                  Navigator.pushNamed(context, AcceptReject.route);
                },
                child: const Text('Go to Accept/Reject Invitations Page'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, HomePage.route);
                },
                child: const Text('Go to Home Page'),
              ),
              TextButton(
                onPressed: () {
      
                  Navigator.pushNamed(context, SignUpPage.route);
                  //Navigate to Insert Review Screen
                },
                child: const Text('Signup page'),
              ),
              TextButton(
                onPressed: () {
                Navigator.pushNamed(context, InsertReview.route);
                },
                child: const Text('Go to Insert Review Page'),
              ),
            ],
          ),
        ),
      ),
    ); //Navigate to Insert Review Screen
  }
}
