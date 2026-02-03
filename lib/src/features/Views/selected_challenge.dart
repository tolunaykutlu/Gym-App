import 'package:change30/src/core/constants/app_contants.dart';
import 'package:change30/src/core/components/widgets/timer_text_widget.dart';
import 'package:change30/src/features/Controllers/exercise_controller.dart';
import 'package:change30/src/features/riverpods/auth_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedChallenge extends ConsumerStatefulWidget {
  const SelectedChallenge({super.key});

  @override
  ConsumerState<SelectedChallenge> createState() => _SelectedChallengeState();
}

class _SelectedChallengeState extends ConsumerState<SelectedChallenge> {
  final CollectionReference egzersizler =
      FirebaseFirestore.instance.collection('egzersizler');

  @override
  Widget build(BuildContext context) {
    final userProvider = ref.watch(authProvider);
    final exerciseProvider = ref.watch(excerciseProvider);
    final userId = userProvider.fstore.getUserUuid();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () => infoDialog(context),
            icon: const Icon(Icons.info_outline),
          )
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Text(
              "${exerciseProvider.exerciseList.first.name} x 10",
              style: bigtitleTextStyle(AppConstants.primaryColor),
            ),
            Text("User ID: $userId",
                style: smallTitleTextStyle(fsize: 14)),
            const SizedBox(height: 16),
            SizedBox(height: 200, child: oneTimeRead(egzersizler)),
            spaceSmallH15(),
            const TimerText(),
            spaceMediumH25(),
          ],
        ),
      ),
    );
  }

  Future<void> infoDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          "- TAP FOR PAUSE\n- DOUBLE TAP FOR RESET TIME",
          style: smallTitleTextStyle(),
        ),
      ),
    );
  }

  Widget oneTimeRead(CollectionReference<Object?> collection) {
    return FutureBuilder<DocumentSnapshot>(
      future: collection.doc('egzersiz').get(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          final data = snapshot.data!.data() as Map<String, dynamic>;
          return ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  data["egzersiz1"]["$index"].toString(),
                  style: bigtitleTextStyle(AppConstants.primaryColor),
                ),
              );
            },
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
