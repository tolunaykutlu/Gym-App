import 'package:change30/components/appbar_menu.dart';
import 'package:change30/components/custom_button.dart';
import 'package:change30/components/custom_textfield.dart';
import 'package:change30/screens/login_page.dart';
import 'package:flutter/material.dart';

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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const AppBarMenuIcon(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Row(
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
            spaceMedium(),
            Text(
              "Sign Up",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            spaceSmall(),
            CustomTextField(control: nameCtrl, hintText: "Full Name"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CustomTextField(control: emailCtrl, hintText: "Email"),
            ),
            CustomTextField(control: phoneCtrl, hintText: "Phone"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child:
                  CustomTextField(control: passwordCtrl, hintText: "Password"),
            ),
            Row(
              children: [
                Checkbox.adaptive(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                ),
                Text(
                  "By clicking you accept our Privacy Policy",
                  style: TextStyle(color: Colors.grey.shade700),
                )
              ],
            ),
            spaceSmall(),
            CustomButton(size: size, buttonText: "Sign In"),
            spaceLarge(),
            bottomSection(context)
          ]),
        ),
      ),
    );
  }
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
