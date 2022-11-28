import 'package:flutter/material.dart';
import 'package:review_web_app/presentation/pages/insert_review_page/insert_review_page.dart';
import 'package:review_web_app/presentation/pages/login_page/login_page.dart';
import 'package:review_web_app/presentation/pages/playground/playground.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Playground.route,
      routes: {
        Playground.route: (context) => const Playground(),
        LoginPage.route: (context) => const LoginPage(),
        InsertReview.route: (context) => const InsertReview(),

      },
    );
  }
}
