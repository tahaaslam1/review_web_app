import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:review_web_app/business_logic/providers/admin_provider.dart';
import 'package:review_web_app/business_logic/providers/auth_provider.dart';
import 'package:review_web_app/business_logic/providers/hrUserprovider.dart';
import 'package:review_web_app/business_logic/providers/identity_card_type_selection.dart';
import 'package:review_web_app/data/repositories/auth_repository/auth_repository.dart';
import 'package:review_web_app/data/repositories/auth_repository/server_auth_repository.dart';
import 'package:review_web_app/models/user.dart';
import 'package:review_web_app/routes/router.gr.dart';

class App extends StatelessWidget {
  App({super.key});

  // final AppRouter _appRouter = AppRouter();

  final _authRepository = ServerAuthRepository();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => _authRepository,
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(
            authenticationRepository: _authRepository,
          ),
        ),
        // ChangeNotifierProvider<AdminProvider>(create: (_) => AdminProvider()),
        ChangeNotifierProvider<IdentityCardTypeSelection>(create: (_) => IdentityCardTypeSelection()),
        ChangeNotifierProvider<HrProvider>(create: (_) => HrProvider()),
      ],
      child: const MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, state, _) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerDelegate: AutoRouterDelegate.declarative(
            _appRouter,
            routes: (_) => [
              if (state.status == AuthenticationStatus.authenticated && state.user.userType == UserType.admin)
                const AdminAuthWrapperRoute()
              else if (state.status == AuthenticationStatus.authenticated && state.user.userType == UserType.hr)
                const UserAuthWrapperRoute()
              else if (state.status == AuthenticationStatus.unauthenticated)
                const UnAuthWrapperRoute()
              else
                const SplashRoute(),
            ],
          ),
          routeInformationParser: _appRouter.defaultRouteParser(includePrefixMatches: true),
        );
      },
    );
  }
}
