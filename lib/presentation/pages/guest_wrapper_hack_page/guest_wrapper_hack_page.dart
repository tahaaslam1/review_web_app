import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GuestWrapperHackPage extends StatelessWidget {
  static const route = ''; 
  const GuestWrapperHackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: AutoRouter(),
    );
  }
}
