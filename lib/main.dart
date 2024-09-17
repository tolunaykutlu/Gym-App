import 'package:change30/src/features/firebase/firebase_options.dart';
import 'package:change30/src/core/constants/app_contants.dart';
import 'package:change30/src/features/Views/calculation_page.dart';
import 'package:change30/src/features/Views/level_page.dart';
import 'package:change30/src/features/Views/choose_gender_page.dart';
import 'package:change30/src/features/Views/login_page.dart';
import 'package:change30/src/features/Views/selected_challenge.dart';
import 'package:change30/src/features/Views/sign_up_page.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
        dialogTheme: DialogTheme(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        appBarTheme: const AppBarTheme(
<<<<<<< Updated upstream
            backgroundColor: Color(0xffE2E2E2),
=======
            scrolledUnderElevation: 0,
            backgroundColor: Colors.white,
>>>>>>> Stashed changes
            elevation: 0,
            foregroundColor: Colors.black),
        textTheme: const TextTheme(titleLarge: TextStyle(color: Colors.white)),
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppConstants.primaryColor),
      ),
      initialRoute: "/",
      routes: {
        '/': (context) => FirebaseAuth.instance.currentUser != null
            ? const LevelSelectionPage()
            : const LoginPage(),
        '/loginPage': (context) => const LoginPage(),
        '/choosePage': (context) => const ChoosePage(),
        '/signUpPage': (context) => const SignUpPage(),
        '/challengePage': (context) => const LevelSelectionPage(),
        '/calculationPage': (context) => const CalculationPage(),
        '/selectedChallenge': (context) => const SelectedChallenge()
      },
    );
  }
}
