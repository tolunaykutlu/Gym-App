import 'package:change30/src/core/components/custom_textfield.dart';
import 'package:change30/src/core/extension/size_extension.dart';

import 'package:flutter/material.dart';

import '../../core/components/app_title_widget.dart';
import '../../core/components/custom_button.dart';
import '../../core/components/sign_in_with_widget.dart';
import '../../core/constants/app_contants.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const AppTitleWidget(),
          if (context.deviceHeight > 668)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: signUpPageTextFields(context),
            )
          else
            signUpPageTextFields(context),
          CustomButton(
              onpress: () {
                Navigator.of(context).pop();
              },
              size: context.deviceSize,
              buttonText: "Sign Up"),
          spaceLargeH35(),
          const SignInWithWidget()
        ]),
      ),
    );
  }

  Column signUpPageTextFields(BuildContext context) {
    return Column(
      children: [
        spaceSmallH15(),
        CustomTextField(
          control: nameCtrl,
          hintText: "Full Name",
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: CustomTextField(control: emailCtrl, hintText: "Email"),
        ),
        CustomTextField(control: phoneCtrl, hintText: "Phone"),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: CustomTextField(
            control: passwordCtrl,
            hintText: "Password",
          ),
        ),
        Row(
          children: [
            Checkbox.adaptive(
              activeColor: AppConstants.primaryColor,
              checkColor: Colors.black,
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = !isChecked;
                });
              },
            ),
            Text(
              "By clicking you accept our Privacy Policy",
              style: TextStyle(
                  color: Colors.grey.shade700, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ],
    );
  }
}
