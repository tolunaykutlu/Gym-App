import 'package:change30/core/constants/app_contants.dart';
import 'package:change30/screens/login_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme:
            const AppBarTheme(backgroundColor: Color(0xffE2E2E2), elevation: 0),
        textTheme: const TextTheme(titleLarge: TextStyle(color: Colors.white)),
        scaffoldBackgroundColor: const Color(0xffE2E2E2),
        colorScheme: ColorScheme.fromSeed(seedColor: AppContants.primaryColor),
      ),
      home: const LoginPage(),
    );
  }
}
