import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:review_web_app/routes/router.gr.dart';

class GuestWrapperPage extends StatelessWidget {
  static const route = 'guest';
  const GuestWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoRouter.declarative(
      routes: (_) {
        return [const GuestWrapperHackRoute()];
      },
    );
  }
}
