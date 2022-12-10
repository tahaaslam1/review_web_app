import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class UserAuthHackPage extends StatelessWidget {
  static const route = '';
  const UserAuthHackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AutoRouter(),
    );
  }
}
