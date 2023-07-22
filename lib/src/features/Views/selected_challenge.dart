import 'package:change30/src/features/Controllers/get_exercises.dart';
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
        children: [Text("${exercisePro.exerciseList[0].name} x 10 ")],
      ),
    );
  }
}
