import 'dart:async';

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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.linearToSrgbGamma(),
                image: AssetImage("images/SplashScreen.png"),
                fit: BoxFit.cover)),
      ),
    );
  }

  SizedBox sz() {
    return const SizedBox(
      child: Text("oldu"),
    );
  }
}
