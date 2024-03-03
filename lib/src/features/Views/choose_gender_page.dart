import 'package:change30/src/core/components/widgets/app_title_widget.dart';
import 'package:change30/src/core/components/widgets/custom_button.dart';
import 'package:change30/src/core/constants/app_contants.dart';
import 'package:change30/src/core/extension/size_extension.dart';
import 'package:change30/src/features/Controllers/user_controller.dart';

import 'package:change30/src/features/riverpods/auth_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_model.dart';

class ChoosePage extends ConsumerStatefulWidget {
  const ChoosePage({super.key});

  @override
  ConsumerState<ChoosePage> createState() => _ChoosePageState();
}

class _ChoosePageState extends ConsumerState<ChoosePage> {
  @override
  Widget build(BuildContext context) {
    var userDataProvider = ref.watch(userProvider);
    var authPro = ref.watch(authProvider);
    String uid = "";
    if (authPro.fauth.isUserActive()) {
      uid = authPro.fstore.getUserUuid();
    } else {
      uid = "yok";
    }

    Map<String, dynamic> data = {
      "height": userDataProvider.heightController,
      "weight": userDataProvider.weigthController,
      "gender": userDataProvider.isMale ? "Male" : userDataProvider.gender,
      "age": userDataProvider.ageController,
      "userId": uid,
      "giris": 1,
    };
    var userInfo = UserModel.fromMap(data);
    /* void addDataToUserModel() {
      userDataProvider.addUserData(UserModel.fromMap(data));
    }  */

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              spaceLargeH35(),
              const AppTitleWidget(),
              spaceSmallH15(),
              GenderPickContainers(ref: ref, context: context),
              spaceSmallH15(),
              Text(
                AppConstants.selectAgeTitle,
                style: smallTitleTextStyle(),
              ),
              spaceSmallH15(),
              selectAgeContainer(context),
              spaceMediumH25(),
              Text(AppConstants.selectWeigthTitle,
                  style: smallTitleTextStyle()),
              spaceSmallH15(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WeightAndAgeSlider(
                      context: context,
                      controller: userDataProvider.weigthController,
                      s: "KG",
                      minimum: 50,
                      maximum: 200,
                      func: (p0) {
                        setState(() {
                          userDataProvider.weigthController = p0.toInt();
                        });
                      }),
                  WeightAndAgeSlider(
                      context: context,
                      controller: userDataProvider.heightController,
                      s: "CM",
                      minimum: 150,
                      maximum: 230,
                      func: (p0) {
                        setState(() {
                          userDataProvider.heightController = p0.toInt();
                        });
                      }),
                ],
              ),
              spaceMediumH25(),
              CustomButton(
                  onpress: () {
                    setState(() {
                      ref
                          .read(authProvider)
                          .fstore
                          .addDataToFirestore(userInfo.toMap(), 'users', uid)
                          .then((value) {
                        print(userInfo.toMap());
                        return Future.delayed(
                            const Duration(seconds: 1),
                            () =>
                                Navigator.pushNamed(context, '/challengePage'));
                      });
                    });
                  },
                  size: context.deviceSize,
                  buttonText: AppConstants.btnContinue),
            ],
          ),
        ),
      ),
    );
  }

  Container selectAgeContainer(
    BuildContext context,
  ) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: AppConstants.secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 60,
            width: 60,
            child: Card(
                elevation: 3,
                child: Icon(
                  Icons.date_range_outlined,
                  color: Colors.amber.shade700,
                  size: 45,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100),
            child: SizedBox(
              child: Row(
                children: [
                  SizedBox(
                      height: 40,
                      width: 50,
                      child: ref.read(userProvider).ageController > 0 &&
                              ref.read(userProvider).ageController < 85
                          ? Text(
                              ref.read(userProvider).ageController.toString(),
                              style: bigtitleTextStyle(Colors.black, fsize: 25))
                          : Text("${ref.read(userProvider).ageController = 18}",
                              style:
                                  bigtitleTextStyle(Colors.black, fsize: 25))),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Column(
                      children: [
                        Expanded(
                          child: IconButton(
                              iconSize: 25,
                              onPressed: () {
                                setState(() {
                                  ref.read(userProvider).ageController++;
                                });
                              },
                              icon: const Icon(Icons.arrow_circle_up_sharp)),
                        ),
                        IconButton(
                            hoverColor: Colors.green,
                            iconSize: 25,
                            onPressed: () {
                              setState(() {
                                ref.read(userProvider).ageController--;
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_circle_down_sharp,
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GenderPickContainers extends StatefulWidget {
  const GenderPickContainers({
    super.key,
    required this.ref,
    required this.context,
  });

  final WidgetRef ref;

  final BuildContext context;

  @override
  State<GenderPickContainers> createState() => _GenderPickContainersState();
}

class _GenderPickContainersState extends State<GenderPickContainers> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(AppConstants.chooseGender, style: smallTitleTextStyle()),
        spaceSmallH15(),
        GenderSelectionWidget(
          border: widget.ref.read(userProvider).isMale == true
              ? Border.all(width: 2, color: AppConstants.primaryColor)
              : null,
          onTap: () {
            setState(() {
              widget.ref.read(userProvider).isMale = true;

              widget.ref.read(userProvider).gender = AppConstants.male;
            });
          },
          genderTitle: AppConstants.male,
          icon: const Icon(
            Icons.male_sharp,
            size: 45,
            color: Colors.blue,
          ),
        ),
        spaceSmallH15(),
        GenderSelectionWidget(
          border: widget.ref.read(userProvider).isMale == false
              ? Border.all(width: 2, color: AppConstants.primaryColor)
              : null,
          onTap: () {
            setState(() {
              widget.ref.read(userProvider).isMale = false;

              widget.ref.read(userProvider).gender = AppConstants.female;
            });
          },
          genderTitle: AppConstants.female,
          icon: const Icon(
            Icons.female_sharp,
            size: 45,
            color: Colors.pink,
          ),
        )
      ],
    );
  }
}

class WeightAndAgeSlider extends StatelessWidget {
  const WeightAndAgeSlider({
    super.key,
    required this.context,
    required this.controller,
    required this.s,
    required this.minimum,
    required this.maximum,
    required this.func,
  });

  final BuildContext context;
  final int controller;
  final String s;
  final double minimum;
  final double maximum;
  final Function(double p1)? func;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 90,
      decoration: BoxDecoration(
          color: AppConstants.secondaryColor,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(controller.toString(),
                      style: bigtitleTextStyle(Colors.black, fsize: 25)),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      s,
                      style: bigtitleTextStyle(AppConstants.primaryColor,
                          fsize: 25),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 130,
                child: Slider(
                  activeColor: AppConstants.primaryColor,
                  min: minimum,
                  max: maximum,
                  value: controller.toDouble(),
                  onChanged: func,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class GenderSelectionWidget extends StatefulWidget {
  final Widget icon;
  final String genderTitle;
  final void Function()? onTap;

  final BoxBorder? border;
  const GenderSelectionWidget({
    super.key,
    required this.icon,
    required this.genderTitle,
    this.onTap,
    this.border,
  });

  @override
  State<GenderSelectionWidget> createState() => _GenderSelectionWidgetState();
}

class _GenderSelectionWidgetState extends State<GenderSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
            color: AppConstants.secondaryColor,
            borderRadius: BorderRadius.circular(10),
            border: widget.border),
        child: Row(
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: Card(elevation: 3, child: widget.icon),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                widget.genderTitle,
                style: bigtitleTextStyle(Colors.black, fsize: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}
