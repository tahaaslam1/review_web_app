import 'package:flutter/material.dart';
import 'package:review_web_app/presentation/pages/accept-reject-screen/accept-reject.dart';
import 'package:review_web_app/presentation/pages/home_page/home_page.dart';
import 'package:review_web_app/presentation/pages/insert_review_page/insert_review_page.dart';

import 'package:review_web_app/presentation/pages/login_page/login_page.dart';
import 'package:review_web_app/presentation/pages/playground/playground.dart';
import 'package:review_web_app/presentation/pages/signup-page/signup_page.dart';
import 'package:review_web_app/presentation/pages/view_profile_page/view_profile_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Playground.route,
      routes: {
        Playground.route: (context) => const Playground(),
        LoginPage.route: (context) => const LoginPage(),
        InsertReview.route: (context) => const InsertReview(),

      
        AcceptReject.route: (context) => const AcceptReject(),

        ViewProfilePage.route : ( context) => ViewProfilePage(),

        HomePage.route: (context) => const HomePage(),
        InsertReview.route: (context) => const InsertReview(),
        SignUpPage.route: (context) => const SignUpPage(),
      },
    );
  }
}
