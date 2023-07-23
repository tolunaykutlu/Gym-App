import 'package:change30/src/core/constants/app_contants.dart';
import 'package:change30/src/features/Views/calculation_page.dart';
import 'package:change30/src/features/Views/level_page.dart';
import 'package:change30/src/features/Views/choose_gender_page.dart';
import 'package:change30/src/features/Views/login_page.dart';
import 'package:change30/src/features/Views/selected_challenge.dart';
import 'package:change30/src/features/Views/sign_up_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xffE2E2E2),
            elevation: 0,
            foregroundColor: Colors.black),
        textTheme: const TextTheme(titleLarge: TextStyle(color: Colors.white)),
        scaffoldBackgroundColor: const Color.fromARGB(255, 226, 226, 226),
        colorScheme: ColorScheme.fromSeed(seedColor: AppConstants.primaryColor),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/choosePage': (context) => const ChoosePage(),
        '/signUpPage': (context) => const SignUpPage(),
        '/challengePage': (context) => const LevelSelectionPage(),
        '/calculationPage': (context) => const CalculationPage(),
        '/selectedChallenge': (context) => const SelectedChallenge()
      },
    );
  }
}
