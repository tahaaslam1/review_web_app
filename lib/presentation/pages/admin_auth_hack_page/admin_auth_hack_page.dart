import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AdminAuthHackPage extends StatelessWidget {
  static const String route = '';
  const AdminAuthHackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AutoRouter(),
    );
  }
}
