import 'package:change30/src/core/components/helpers/auth_error_dialog.dart';
import 'package:change30/src/core/components/widgets/app_title_widget.dart';
import 'package:change30/src/core/components/widgets/sign_in_with_widget.dart';
import 'package:change30/src/core/extension/size_extension.dart';
import 'package:change30/src/features/riverpods/auth_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import '../../core/components/widgets/custom_button.dart';
import '../../core/components/widgets/custom_textfield.dart';
import '../../core/constants/app_contants.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool secretPassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 60),
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
                Navigator.pushNamed(context, "/signUpPage");
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
        CustomTextFormField(
          labeltext: "Email",
          autoFocus: true,
          onChanged: (p0) {},
          control: _emailController,
          hintText: AppConstants.phoneAndEmailText,
          validator: (p0) =>
              p0.ext.isValidEmail ? null : "E-mail type is wrong",
        ),
        spaceSmallH15(),
        CustomTextFormField(
          labeltext: "Password",
          control: _passwordController,
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
          onpress: () async {
            setState(() {
              if (_emailController.text.isEmpty ||
                  _passwordController.text.isEmpty) {
                displayMessage(context, "Empty E-mail or password");
              } else {
                loginFunction();
                Navigator.pushNamed(context, "/choosePage");
              }
            });
          },
          buttonText: AppConstants.signInText,
          size: size,
        ),
        spaceSmallH15(),
        GestureDetector(
          onTap: () {
            setState(() {});
          },
          child: const Text(
            AppConstants.forgotPwText,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  void loginFunction() {
    ref.read(authProvider).loginUserWithFirebase(
        _emailController.text, _passwordController.text, context);
  }

  Column iconAndTitle(Size size, BuildContext context) {
    return Column(
      children: [
        /* Image.asset(
          "images/GymPoint.png",
          fit: BoxFit.cover,
        ), */
        spaceSmallH15(),
        const AppTitleWidget(),
      ],
    );
  }
}
