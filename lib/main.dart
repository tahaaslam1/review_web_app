import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_web_app/business_logic/providers/admin_provider.dart';
import 'package:review_web_app/business_logic/providers/identity_card_type_selection.dart';
import 'package:review_web_app/business_logic/providers/hrUserprovider.dart';
import 'package:review_web_app/presentation/app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AdminProvider>(create: (_) => AdminProvider()),
        ChangeNotifierProvider<IdentityCardTypeSelection>(
            create: (_) => IdentityCardTypeSelection()),
        ChangeNotifierProvider<HrProvider>(create: (_) => HrProvider()),
      ],
      child: const App(),
    ),
  );
}
