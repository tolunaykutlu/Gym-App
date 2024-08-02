import 'package:change30/src/core/constants/app_contants.dart';
import 'package:change30/src/features/riverpods/auth_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInWithWidget extends StatelessWidget {
  const SignInWithWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppConstants.signInWithText,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        AppConstants.spaceMediumH25(),
        Consumer(
          builder: (context, ref, child) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    //ref.read(authProvider).fauth.loginWithApple();
                  },
                  child: const Icon(
                    Icons.apple,
                    size: 40,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.facebook,
                      size: 40,
                      color: Colors.blue,
                    )),
              ),
              InkWell(
                  onTap: () {
                    ref
                        .read(authProvider)
                        .fauth
                        .signInWithGoogle()
                        .then((value) => print(value));
                  },
                  child: const Icon(
                    Icons.g_mobiledata,
                    size: 40,
                    color: Colors.redAccent,
                  ))
            ],
          ),
        ),
        AppConstants.spaceSmallH15(),
      ],
    );
  }
}
