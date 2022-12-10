import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:review_web_app/routes/router.gr.dart';

class AdminAuthWrapperPage extends StatelessWidget {
  static const route = '/admin-auth';
  const AdminAuthWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoRouter.declarative(
      routes: (_) {
        return [const AdminAuthHackRoute()];
      },
    );
  }
}
