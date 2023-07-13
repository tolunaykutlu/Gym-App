import 'package:change30/core/components/app_title_widget.dart';
import 'package:change30/core/components/custom_button.dart';
import 'package:change30/core/extension/size_extension.dart';
import 'package:change30/screens/login_page.dart';
import 'package:change30/screens/processing_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChoosePage extends StatefulWidget {
  const ChoosePage({super.key});

  @override
  State<ChoosePage> createState() => _ChoosePageState();
}

class _ChoosePageState extends State<ChoosePage> {
  int isMale = 1;
  String gender = "";

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
            spaceMedium(),
            genderPickContainers(context),
            spaceSmall(),
            Text(
              "Select your age",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            spaceSmall(),
            selectAgeContainer(context),
            spaceMedium(),
            Text(
              "Select your weight",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            spaceSmall(),
            selectWeightContainer(context),
            spaceMedium(),
            CustomButton(
                onpress: () {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ProcessingAttributesPage(),
                    ));
                  });
                },
                size: context.deviceSize,
                buttonText: "Continue"),
            spaceSmall(),
            SizedBox(
              height: 80,
              width: context.deviceWidth / 3,
              child: CupertinoPicker.builder(
                selectionOverlay: Text("CM"),
                scrollController: FixedExtentScrollController(initialItem: 10),
                magnification: 1.1,
                backgroundColor: Colors.white54,
                useMagnifier: true,
                childCount: 100,
                itemBuilder: (context, index) {
                  return Text((index + 120).toString());
                },
                itemExtent: 70,
                onSelectedItemChanged: (value) {},
              ),
            )
          ],
        ),
      ),
    );
  }

  Container selectWeightContainer(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
          color: Colors.white60, borderRadius: BorderRadius.circular(10)),
      child: Row(
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
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(weigthController.toString(),
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                Slider(
                  activeColor: Colors.amber.shade700,
                  min: 30,
                  max: 170,
                  value: weigthController.toDouble(),
                  onChanged: (value) {
                    setState(() {
                      weigthController = value.toInt();
                    });
                  },
                )
              ],
            ),
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
                    child: Text(
                      ageController.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                    ),
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
        Text(
          "Choose your Gender",
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        spaceSmall(),
        GenderWidget(
          border:
              isMale == 1 ? Border.all(width: 2, color: Colors.black) : null,
          onTap: () {
            setState(() {
              isMale = 1;
              if (isMale == 1) {
                gender = "Male";
              }
            });
          },
          genderTitle: "Male",
          icon: const Icon(
            Icons.male_sharp,
            size: 45,
            color: Colors.blue,
          ),
        ),
        spaceSmall(),
        GenderWidget(
          border:
              isMale == 2 ? Border.all(width: 2, color: Colors.black) : null,
          onTap: () {
            setState(() {
              isMale = 2;
              if (isMale == 2) {
                gender = "Female";
              }
            });
          },
          genderTitle: "Female",
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
              child: Text(widget.genderTitle),
            )
          ],
        ),
      ),
    );
  }
}
