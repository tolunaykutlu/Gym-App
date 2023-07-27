import 'package:change30/src/core/components/app_title_widget.dart';
import 'package:change30/src/core/constants/app_contants.dart';
import 'package:change30/src/core/extension/size_extension.dart';
import 'package:change30/src/features/Controllers/exercise_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LevelSelectionPage extends ConsumerWidget {
  const LevelSelectionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var exProvider = ref.watch(excerciseProvider);

    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              spaceSmallH15(),
              const AppTitleWidget(
                title1: "LEV",
                title2: "ELS",
                padding: 0,
              ),
              spaceSmallH15(),
              Text(
                "Choose A level",
                style: smallTitleTextStyle(),
              ),
              spaceMediumH25(),
              SizedBox(
                height: context.deviceHeight > 375
                    ? context.deviceHeight * 0.6
                    : context.deviceHeight * 0.8,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: exProvider.difficultyList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: context.deviceHeight *
                          0.18, //gridview elemanının sizeına ulaşmayı sağlıyor
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return LevelSelectionWidget(
                      exProvider: exProvider,
                      index: index,
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}

class LevelSelectionWidget extends StatefulWidget {
  const LevelSelectionWidget({
    super.key,
    required this.exProvider,
    required this.index,
  });

  final ExerciseController exProvider;
  final int index;

  @override
  State<LevelSelectionWidget> createState() => _LevelSelectionWidgetState();
}

class _LevelSelectionWidgetState extends State<LevelSelectionWidget> {
  bool isClicked = false;

  /*  Future goNewPageDelayed() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {
      Navigator.pushNamed(context, '/selectedChallenge');
    });
  } */

  goNextPage() {
    Navigator.pushNamed(context, '/selectedChallenge');
  }

  /* goTo(String path) {
    Navigator.pushNamed(context, path);
  } */

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        setState(() {
          goNextPage();
        });

        //Navigator.pushNamed(context, '/selectedChallenge');
      },
      child: Container(
        decoration: BoxDecoration(
            color: isClicked ? AppConstants.secondaryColor : Colors.white70,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 2)),
        child: Center(
          child: Text(
            widget.exProvider.difficultyList[widget.index],
            style: smallTitleTextStyle(
                fsize: 18, color: AppConstants.primaryColor),
          ),
        ),
      ),
    );
  }
}
