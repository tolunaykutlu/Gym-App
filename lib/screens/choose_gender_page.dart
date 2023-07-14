import 'package:change30/core/components/app_title_widget.dart';
import 'package:change30/core/components/custom_button.dart';
import 'package:change30/core/constants/app_contants.dart';
import 'package:change30/core/extension/size_extension.dart';

import 'package:change30/screens/processing_page.dart';

import 'package:flutter/material.dart';

List<double> height = List.generate(200, (index) => (index + 150) * 1);

class ChoosePage extends StatefulWidget {
  const ChoosePage({super.key});

  @override
  State<ChoosePage> createState() => _ChoosePageState();
}

class _ChoosePageState extends State<ChoosePage> {
  int isMale = 1;
  String gender = "";
  int heightController = 179;
  int ageController = 18; // 1 isMale & 2 is not Male so its female
  int weigthController = 60;

  @override
  Widget build(BuildContext context) {
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
                    context, weigthController, "KG", 30, 170, (p0) {
                  setState(() {
                    weigthController = p0.toInt();
                  });
                }),
                selectWeightAndHeightCon(
                  context,
                  heightController,
                  "CM",
                  150,
                  230,
                  (p0) {
                    setState(() {
                      heightController = p0.toInt();
                    });
                  },
                ),
              ],
            ),
            spaceMediumH25(),
            CustomButton(
                onpress: () {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ProcessingAttributesPage(),
                    ));
                  });
                },
                size: context.deviceSize,
                buttonText: AppContants.btnContinue),
            spaceSmallH15(),
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
          /* const SizedBox(
            height: 60,
            width: 60,
            child: Card(
                elevation: 3,
                child: Icon(
                  Icons.scale_rounded,
                  color: Colors.blueAccent,
                  size: 45,
                )),
          ), */
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(controller.toString(),
                      style: bigtitleTextStyle(Colors.black, fsize: 30)),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      s,
                      style: bigtitleTextStyle(AppContants.primaryColor,
                          fsize: 30),
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
            padding: const EdgeInsets.only(left: 115),
            child: SizedBox(
              child: Row(
                children: [
                  Center(
                    child: Text(ageController.toString(),
                        style: bigtitleTextStyle(Colors.black, fsize: 30)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Expanded(
                          child: IconButton(
                              iconSize: 25,
                              onPressed: () {
                                setState(() {
                                  ageController++;
                                });
                              },
                              icon: const Icon(Icons.arrow_circle_up_sharp)),
                        ),
                        IconButton(
                            hoverColor: Colors.green,
                            iconSize: 25,
                            onPressed: () {
                              setState(() {
                                ageController--;
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
          border: isMale == 1
              ? Border.all(width: 2, color: AppContants.primaryColor)
              : null,
          onTap: () {
            setState(() {
              isMale = 1;
              if (isMale == 1) {
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
          border: isMale == 2
              ? Border.all(width: 2, color: AppContants.primaryColor)
              : null,
          onTap: () {
            setState(() {
              isMale = 2;
              if (isMale == 2) {
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
