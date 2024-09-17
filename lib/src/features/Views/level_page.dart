import 'package:change30/src/core/components/widgets/app_title_widget.dart';
import 'package:change30/src/core/constants/app_contants.dart';

import 'package:change30/src/core/extension/size_extension.dart';
import 'package:change30/src/features/Controllers/exercise_controller.dart';

import 'package:change30/src/features/riverpods/auth_riverpod.dart';

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
                      ref: ref,
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
    required this.ref,
  });

  final ExerciseController exProvider;
  final int index;
  final WidgetRef ref;

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

  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return InkWell(
      onTap: () async {
        setState(() {
          //widget.ref.read(authProvider).fauth.signOutuser();
          // widget.ref.read(authProvider).addUser("tolu", "male", "22");

          Navigator.pushNamed(context, '/selectedChallenge');
        });
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
=======
    return Consumer(
      builder: (context, ref, child) {
        return InkWell(
          onTap: () async {
            setState(() {
              //ref.read(authProvider).fauth.signOutuser();
              Navigator.pushNamed(
                context,
                '/selectedChallenge',
              );
            });
          },
          child: Container(
            decoration: BoxDecoration(
                color: isClicked ? AppConstants.secondaryColor : Colors.white70,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 2)),
            child: Center(
              child: Text(
                widget.exProvider.difficultyList[widget.index],
                style: AppConstants.smallTitleTextStyle(
                    fsize: 18, color: AppConstants.primaryColor),
              ),
            ),
>>>>>>> Stashed changes
          ),
        );
      },
    );
  }
}
