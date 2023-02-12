import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_web_app/business_logic/providers/unauth_wrapper_provider/unauth_wrapper_provider.dart';
import 'package:review_web_app/routes/router.gr.dart';

class UnAuthWrapperPage extends StatelessWidget {
  static const String route = 'unauth';
  const UnAuthWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UnAuthWrapperProvider(),
      child: Consumer<UnAuthWrapperProvider>(
        builder: (context, state, _) {
          return AutoRouter.declarative(
            routes: (_) {
              return [
                if (state.page == Pages.landing) const LandingRoute() else if (state.page == Pages.login) const LoginRoute() else if (state.page == Pages.signup) const SignUpRoute(),
              ];
            },
          );
        },
      ),
    );
  }
}
