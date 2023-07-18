import 'package:change30/core/components/app_title_widget.dart';
import 'package:change30/core/components/sign_in_with_widget.dart';
import 'package:change30/core/extension/size_extension.dart';
import 'package:change30/features/Views/choose_gender_page.dart';
import 'package:change30/features/Views/sign_up_page.dart';
import 'package:flutter/material.dart';

import '../../core/components/appbar_menu.dart';
import '../../core/components/custom_button.dart';
import '../../core/components/custom_textfield.dart';
import '../../core/constants/app_contants.dart';

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
    return Scaffold(
      appBar: AppBar(
        leading: const AppBarMenuIcon(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            iconAndTitle(context.deviceSize, context),
            spaceSmallH15(),
            if (context.deviceSize.height > 668)
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: buttonSection(context.deviceSize, context))
            else
              buttonSection(context.deviceSize, context),
            spaceMediumH25(),
            bottomSection(context),
          ],
        ),
      ),
    );
  }

  Column bottomSection(BuildContext context) {
    return Column(
      children: [
        const SignInWithWidget(),
        spaceSmallH15(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppConstants.donthaveAccText,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade700),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SignUpPage(),
                ));
              },
              child: const Text(
                AppConstants.signUpText,
                style: TextStyle(
                    fontSize: 15,
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
        spaceSmallH15(),
        CustomTextField(
          control: controller,
          hintText: AppConstants.phoneAndEmailText,
        ),
        spaceSmallH15(),
        CustomTextField(
          control: passwordController,
          hintText: AppConstants.passwordText,
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
        spaceSmallH15(),
        CustomButton(
          onpress: () {
            setState(() {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const ChoosePage()));
            });
          },
          buttonText: AppConstants.signInText,
          size: size,
        ),
        spaceSmallH15(),
        GestureDetector(
          onTap: () {},
          child: const Text(
            AppConstants.forgotPwText,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Column iconAndTitle(Size size, BuildContext context) {
    return Column(
      children: [
        const Image(
          image: AssetImage("images/GymPoint.png"),
        ),
        spaceSmallH15(),
        const AppTitleWidget(),
      ],
    );
  }
}
