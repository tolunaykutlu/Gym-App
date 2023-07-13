import 'package:change30/components/app_title_widget.dart';
import 'package:change30/screens/choose_gender_page.dart';
import 'package:change30/screens/sign_up_page.dart';
import 'package:flutter/material.dart';

import '../components/appbar_menu.dart';
import '../components/custom_button.dart';
import '../components/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController controller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool secretPassword = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const AppBarMenuIcon(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            iconAndTitle(size, context),
            spaceSmall(),
            if (size.height > 668)
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: buttonSection(size, context))
            else
              buttonSection(size, context),
            spaceMedium(),
            bottomSection(context),
          ],
        ),
      ),
    );
  }

  Column bottomSection(BuildContext context) {
    return Column(
      children: [
        Text(
          "Sign in With",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        spaceSmall(),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.apple),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Icon(Icons.facebook),
            ),
            Icon(Icons.g_mobiledata)
          ],
        ),
        spaceSmall(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't have an Account?"),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SignUpPage(),
                ));
              },
              child: const Text(
                "Sign Up",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        )
      ],
    );
  }

  Column buttonSection(Size size, BuildContext context) {
    return Column(
      children: [
        Text(
          "Sign In",
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        spaceSmall(),
        CustomTextField(
          control: controller,
          hintText: "Phone/E-mail",
        ),
        spaceSmall(),
        CustomTextField(
          control: passwordController,
          hintText: "Password",
          secret: secretPassword,
          sufIcon: Card(
            color: Colors.white60,
            child: IconButton(
                onPressed: () {
                  setState(() {
                    secretPassword = !secretPassword;
                  });
                },
                icon: secretPassword
                    ? const Icon(Icons.lock)
                    : const Icon(Icons.lock_open)),
          ),
        ),
        spaceSmall(),
        CustomButton(
          onpress: () {
            setState(() {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const ChoosePage()));
            });
          },
          buttonText: "Sign In",
          size: size,
        ),
        spaceSmall(),
        const Text("Forgot Password?"),
      ],
    );
  }

  Column iconAndTitle(Size size, BuildContext context) {
    return Column(
      children: [
        const Image(
          image: AssetImage("images/GymPoint.png"),
        ),
        spaceSmall(),
        const AppTitleWidget(),
      ],
    );
  }
}

SizedBox spaceSmall() {
  return const SizedBox(
    height: 15,
  );
}

SizedBox spaceMedium() {
  return const SizedBox(
    height: 25,
  );
}

SizedBox spaceLarge() {
  return const SizedBox(
    height: 35,
  );
}
