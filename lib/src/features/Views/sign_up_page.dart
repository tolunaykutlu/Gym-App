import 'package:change30/src/core/components/widgets/custom_textfield.dart';
import 'package:change30/src/core/extension/size_extension.dart';
import 'package:change30/src/features/Controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import '../../core/components/helpers/database_helper.dart';
import '../../core/components/widgets/app_title_widget.dart';
import '../../core/components/widgets/custom_button.dart';
import '../../core/constants/app_contants.dart';
import '../riverpods/auth_riverpod.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final DatabaseServiceHelper databaseServiceHelper =
      DatabaseServiceHelper.instance;
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  bool isChecked = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authNotifier = ref.watch(authProvider);
    final Map<String, dynamic> tableRow = {
      "columnName": _nameCtrl.text,
      "columnTime": 22,
    };

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
              onpress: () async {
                ref.read(userProvider).userName = _nameCtrl.text;
                ref.read(userProvider).email = _emailCtrl.text;
                ref.read(userProvider).password = _passwordCtrl.text;

                databaseServiceHelper.insert(tableRow);

                if (_nameCtrl.text.isEmpty ||
                    _emailCtrl.text.isEmpty ||
                    _passwordCtrl.text.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        actions: [],
                        content: Text("Fill The necessary boxes"),
                      );
                    },
                  );
                } else {
                  await authNotifier
                      .signUpUserWithFirebase(_emailCtrl.text,
                          _passwordCtrl.text, _nameCtrl.text, context)
                      .then((value) => showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text(value.user!.uid),
                              );
                            },
                          ));
                }
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
        Form(
          key: _formKey,
          child: CustomTextFormField(
            control: _nameCtrl,
            hintText: "User name",
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: CustomTextFormField(
            control: _emailCtrl,
            hintText: "Email",
            validator: (p0) {
              return p0.ext.isValidEmail ? null : "E-mail type is wrong";
            },
          ),
        ),
        CustomTextFormField(
          validator: (p0) => p0.ext.isValidPassword
              ? null
              : "Password must be at least 6 character",
          control: _passwordCtrl,
          hintText: "Password",
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox.adaptive(
              activeColor: AppConstants.primaryColor,
              checkColor: Colors.white,
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
