import 'package:flutter/material.dart';

class ChallengePage extends StatelessWidget {
  const ChallengePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(), //TODO: bu sayfada bir kaç tane challenge listelenecek mesela 10 dk da 100 şınav 100 mekik gibi basit hareketler zorluk derecesine göre değişebilecek
      body: const Center(
        child: Text("Challenge"),
      ),
    );
  }
}
