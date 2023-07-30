import 'package:change30/src/core/constants/app_contants.dart';
import 'package:change30/src/features/Controllers/exercise_controller.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedChallenge extends ConsumerStatefulWidget {
  const SelectedChallenge({super.key});

  @override
  ConsumerState<SelectedChallenge> createState() => _SelectedChallengeState();
}

class _SelectedChallengeState extends ConsumerState<SelectedChallenge> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var exercisePro = ref.watch(excerciseProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
              child: Text("${exercisePro.exerciseList[0].name} x 10 ",
                  style: bigtitleTextStyle(AppConstants.primaryColor)))
          //TODO: seçilen zorluğa göre antreman programı verilecek
        ],
      ),
    );
  }
}
