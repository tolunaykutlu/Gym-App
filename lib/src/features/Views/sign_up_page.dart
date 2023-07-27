import 'package:change30/src/core/components/custom_textfield.dart';
import 'package:change30/src/core/extension/size_extension.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/components/app_title_widget.dart';
import '../../core/components/custom_button.dart';
import '../../core/constants/app_contants.dart';
import '../riverpods/auth_riverpod.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  bool isChecked = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authNotifier = ref.watch(authProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                authNotifier
                    .signUpUserWithFirebase(
                        _emailCtrl.text, _passwordCtrl.text, _nameCtrl.text)
                    .then((value) => const Dialog(
                          //TODO: kayıt başarılı diye ekrana yazdırmak
                          child: AlertDialog(content: Text("Kayıt başarılı")),
                        ));
              },
              size: context.deviceSize,
              buttonText: "Sign Up"),
        ]),
      ),
    );
  }

  Column signUpPageTextFields(BuildContext context) {
    return Column(
      children: [
        spaceSmallH15(),
        Form(
          key: _formKey,
          child: CustomTextFormField(
            control: _nameCtrl,
            hintText: "Full Name",
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: CustomTextFormField(control: _emailCtrl, hintText: "Email"),
        ),
        CustomTextFormField(control: _phoneCtrl, hintText: "Phone"),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: CustomTextFormField(
            control: _passwordCtrl,
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
