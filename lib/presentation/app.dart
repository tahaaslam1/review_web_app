import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:review_web_app/business_logic/providers/admin_provider.dart';
import 'package:review_web_app/business_logic/providers/auth_provider.dart';
import 'package:review_web_app/business_logic/providers/hrUserprovider.dart';
import 'package:review_web_app/business_logic/providers/identity_card_type_selection.dart';
import 'package:review_web_app/business_logic/providers/signup._provider.dart';
import 'package:review_web_app/data/repositories/auth_repository/auth_repository.dart';
import 'package:review_web_app/data/repositories/auth_repository/server_auth_repository.dart';
import 'package:review_web_app/logger.dart';
import 'package:review_web_app/models/user.dart';
import 'package:review_web_app/routes/router.gr.dart';

import '../business_logic/providers/login_provider.dart';

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
        ChangeNotifierProvider<SignupProvider>(
          create: (context) => SignupProvider(
            authenRepository: _authRepository,
          ),
        ),
        ChangeNotifierProvider<LoginProvider>(
          create: (context) => LoginProvider(
            authenRepository: _authRepository,
            authProvider: Provider.of<AuthProvider>(context, listen: false),
          ),
        ),

        // ChangeNotifierProvider<AdminProvider>(create: (_) => AdminProvider()),
        ChangeNotifierProvider<IdentityCardTypeSelection>(
            create: (_) => IdentityCardTypeSelection()),
        ChangeNotifierProvider<HrProvider>(
          create: (_) => HrProvider(
              // authProvider: Provider.of<AuthProvider>(context),
              
              ),
        ),

        ChangeNotifierProvider<AdminProvider>(
          create: (_) => AdminProvider(),
        ),
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
        logger.d(state.user.userType);
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerDelegate: AutoRouterDelegate.declarative(
            _appRouter,
            routes: (_) => [
              if (state.status == AuthenticationStatus.authenticated &&
                  state.user.userType == UserType.admin)
                const AdminAuthWrapperRoute()
              else if (state.status == AuthenticationStatus.authenticated &&
                  state.user.userType == UserType.hr)
                const UserAuthWrapperRoute()
              else if (state.status == AuthenticationStatus.unauthenticated &&
                  state.user.userType == UserType.guest)
                const GuestWrapperRoute()
              else if (state.status == AuthenticationStatus.unauthenticated &&
                  state.user.userType == UserType.unknown)
                const UnAuthWrapperRoute()
              else
                const SplashRoute(),
            ],
          ),
          routeInformationParser:
              _appRouter.defaultRouteParser(includePrefixMatches: true),
        );
      },
    );
  }
}
