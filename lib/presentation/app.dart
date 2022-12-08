import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:review_web_app/routes/router.gr.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: AutoRouterDelegate.declarative(
        _appRouter,
        routes: (_) => [

          ///TODO : check states and continue....
        ],
      ),
      routeInformationParser: _appRouter.defaultRouteParser(includePrefixMatches: true),
    );

    // MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   initialRoute: Playground.route,
    //   routes: {
    //     Playground.route: (context) => const Playground(),
    //     LoginPage.route: (context) => const LoginPage(),
    //     InsertReviewPage.route: (context) => const InsertReviewPage(),

    //    // AcceptReject.route: (context) => const AcceptReject(),

    //     //   ViewProfilePage.route : ( context) => ViewProfilePage(),

    //     HomePage.route: (context) => const HomePage(),
    //     InsertReviewPage.route: (context) => const InsertReviewPage(),
    //     SignUpPage.route: (context) => const SignUpPage(),
    //   },
    // );
  }
}
