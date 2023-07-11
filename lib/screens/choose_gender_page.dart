import 'package:change30/components/app_title_widget.dart';
import 'package:change30/screens/login_page.dart';
import 'package:flutter/material.dart';

class ChoosePage extends StatefulWidget {
  const ChoosePage({super.key});

  @override
  State<ChoosePage> createState() => _ChoosePageState();
}

bool tapped = false;

class _ChoosePageState extends State<ChoosePage> {
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
            genderPick(context),
            spaceSmall(),
            Text(
              "Select your age",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            spaceSmall(),
            Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    height: 60,
                    width: 60,
                    child: Card(
                        elevation: 3,
                        child: Icon(
                          Icons.date_range_outlined,
                          size: 45,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 75),
                    child: Row(
                      children: [
                        const Text("20"),
                        Column(
                          children: [
                            SizedBox(
                              height: 25,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.arrow_drop_up_sharp,
                                    size: 25,
                                  )),
                            ),
                            SizedBox(
                              height: 25,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.arrow_drop_down_sharp,
                                    size: 25,
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column genderPick(BuildContext context) {
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
          onTap: () {
            tapped = !tapped;
          },
          onTapped: !tapped,
          genderTitle: "Male",
          icon: const Icon(
            Icons.male_sharp,
            size: 45,
            color: Colors.blue,
          ),
        ),
        spaceSmall(),
        GenderWidget(
          onTap: () {
            setState(() {
              tapped = !tapped;
            });
          },
          onTapped: tapped,
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
  final bool onTapped;
  const GenderWidget({
    super.key,
    required this.icon,
    required this.genderTitle,
    this.onTap,
    required this.onTapped,
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
            border: widget.onTapped
                ? Border.all(width: 2, color: Colors.black)
                : null),
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
