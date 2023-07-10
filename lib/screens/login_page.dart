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
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            spaceSmall(),
            iconAndTitle(size, context),
            spaceSmall(),
            buttonSection(size, context),
            spaceLarge(),
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

  SizedBox buttonSection(Size size, BuildContext context) {
    return SizedBox(
      height: size.height * 0.30,
      child: Column(
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
            buttonText: "Sign In",
            size: size,
          ),
          spaceSmall(),
          const Text("Forgot Password?"),
        ],
      ),
    );
  }

  SizedBox iconAndTitle(Size size, BuildContext context) {
    return SizedBox(
      height: size.height * 0.25,
      child: Column(
        children: [
          const Center(child: Image(image: AssetImage("images/GymPoint.png"))),
          spaceSmall(),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "CHANGE ",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  "30",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Colors.amber.shade900,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
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
