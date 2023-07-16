import 'dart:developer';

import 'package:change30/core/components/app_title_widget.dart';
import 'package:change30/core/components/custom_button.dart';
import 'package:change30/core/constants/app_contants.dart';
import 'package:change30/core/extension/size_extension.dart';
import 'package:change30/data/get_user_data.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'calculation_page.dart';

String gender = "";
int heightController = 179;
int ageController = 18;
int weigthController = 60;
bool isMale = true;

class ChoosePage extends ConsumerStatefulWidget {
  const ChoosePage({super.key});

  @override
  ConsumerState<ChoosePage> createState() => _ChoosePageState();
}

class _ChoosePageState extends ConsumerState<ChoosePage> {
  @override
  Widget build(BuildContext context) {
    var userDataProvider = ref.read(userProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const AppTitleWidget(),
            spaceSmallH15(),
            genderPickContainers(context),
            spaceSmallH15(),
            Text(
              AppContants.selectAgeTitle,
              style: smallTitleTextStyle(),
            ),
            spaceSmallH15(),
            selectAgeContainer(context),
            spaceMediumH25(),
            Text(AppContants.selectWeigthTitle, style: smallTitleTextStyle()),
            spaceSmallH15(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                selectWeightAndHeightCon(
                    context, userDataProvider.weigthController, "KG", 30, 170,
                    (p0) {
                  setState(() {
                    userDataProvider.weigthController = p0.toInt();
                  });
                }),
                selectWeightAndHeightCon(
                  context,
                  userDataProvider.heightController,
                  "CM",
                  150,
                  230,
                  (p0) {
                    setState(() {
                      userDataProvider.heightController = p0.toInt();
                    });
                  },
                ),
              ],
            ),
            spaceMediumH25(),
            CustomButton(
                onpress: () {
                  setState(() {
                    userDataProvider.addUserData();
                    inspect(userDataProvider.userData);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CalculationPage(),
                    ));
                  });
                },
                size: context.deviceSize,
                buttonText: AppContants.btnContinue),
            spaceSmallH15(),
            ElevatedButton(
                onPressed: () {
                  userDataProvider.addUserData();
                },
                child: const Text("EKLE"))
          ],
        ),
      ),
    );
  }

  Container selectWeightAndHeightCon(BuildContext context, int controller,
      String s, double minimum, double maximum, Function(double)? func) {
    return Container(
      width: 170,
      height: 90,
      decoration: BoxDecoration(
          color: Colors.white60, borderRadius: BorderRadius.circular(10)),
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
                      style: bigtitleTextStyle(AppContants.primaryColor,
                          fsize: 25),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 130,
                child: Slider(
                  activeColor: AppContants.primaryColor,
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

  Container selectAgeContainer(
    BuildContext context,
  ) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white60,
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
                              ref.read(userProvider).ageController < 70
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

  Column genderPickContainers(BuildContext context) {
    return Column(
      children: [
        Text(AppContants.chooseGender, style: smallTitleTextStyle()),
        spaceSmallH15(),
        GenderWidget(
          border: ref.read(userProvider).isMale == true
              ? Border.all(width: 2, color: AppContants.primaryColor)
              : null,
          onTap: () {
            setState(() {
              ref.read(userProvider).isMale = true;
              if (ref.read(userProvider).isMale == true) {
                gender = AppContants.male;
              }
            });
          },
          genderTitle: AppContants.male,
          icon: const Icon(
            Icons.male_sharp,
            size: 45,
            color: Colors.blue,
          ),
        ),
        spaceSmallH15(),
        GenderWidget(
          border: ref.read(userProvider).isMale == false
              ? Border.all(width: 2, color: AppContants.primaryColor)
              : null,
          onTap: () {
            setState(() {
              ref.read(userProvider).isMale = false;
              if (ref.read(userProvider).isMale == false) {
                gender = AppContants.female;
              }
            });
          },
          genderTitle: AppContants.female,
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

class GenderWidget extends StatefulWidget {
  final Widget icon;
  final String genderTitle;
  final void Function()? onTap;

  final BoxBorder? border;
  const GenderWidget({
    super.key,
    required this.icon,
    required this.genderTitle,
    this.onTap,
    this.border,
  });

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
            color: Colors.white60,
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
