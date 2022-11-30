import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_web_app/business_logic/providers/admin_provide.dart';
import 'package:review_web_app/presentation/app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AdminProvider>(create: (_) => AdminProvider())
      ],
      child: App(),
    ),
  );
}
