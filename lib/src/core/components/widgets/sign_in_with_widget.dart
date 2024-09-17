import 'package:change30/src/core/constants/app_contants.dart';
<<<<<<< Updated upstream

import 'package:flutter/material.dart';
=======
import 'package:change30/src/core/extension/size_extension.dart';
import 'package:change30/src/features/riverpods/auth_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
>>>>>>> Stashed changes

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
<<<<<<< Updated upstream
        spaceMediumH25(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: () {},
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
                onTap: () {},
                child: const Icon(
                  Icons.g_mobiledata,
                  size: 40,
                  color: Colors.redAccent,
                ))
          ],
=======
        AppConstants.spaceMediumH25(),
        Consumer(
          builder: (context, ref, child) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  ref.read(authProvider).fauth.signInWithGoogle().then((value) {
                    if (value != null) {
                      Navigator.of(context).pushNamed('/choosePage');
                    }
                  });
                },
                child: Container(
                  width: context.deviceSize.width / 1.5,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 2)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset("assets/logos/google_logo.png"),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            "Sign in with Google",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
>>>>>>> Stashed changes
        ),
        spaceSmallH15(),
      ],
    );
  }
}
