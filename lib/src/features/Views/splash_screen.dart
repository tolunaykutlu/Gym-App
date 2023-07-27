import 'dart:async';

import 'package:change30/src/core/components/app_title_widget.dart';
import 'package:change30/src/core/extension/size_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startTime();
    super.initState();
  }

  //timer oluşturup 3 saniye sonra ne yapması gerektiğini söylüyoruz
  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  //diğer sayfaya giden method
  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.deviceWidth,
        height: context.deviceHeight,
        /* decoration: const BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.linearToSrgbGamma(),
                image: AssetImage("images/SplashScreen.png"),
                fit: BoxFit.cover)), */
        child: const AppTitleWidget(),
      ),
    );
  }

  SizedBox sz() {
    return const SizedBox(
      child: Text("oldu"),
    );
  }
}
