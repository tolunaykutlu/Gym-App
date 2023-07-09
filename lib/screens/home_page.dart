import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(children: const [
        OnboardPage1(),
        OnboardPage2(),
        OnboardPage3(),
      ]),
    );
  }
}

class OnboardPage1 extends StatefulWidget {
  const OnboardPage1({super.key});

  @override
  State<OnboardPage1> createState() => _OnboardPage1State();
}

class _OnboardPage1State extends State<OnboardPage1> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "onboardpage ",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: const Text("dark"))
        ],
      ),
    );
  }
}

class OnboardPage2 extends StatelessWidget {
  const OnboardPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "onboardpage 2",
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}

class OnboardPage3 extends StatelessWidget {
  const OnboardPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "onboardpage 3",
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
