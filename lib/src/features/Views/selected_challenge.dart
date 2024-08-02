import 'package:change30/src/core/extension/size_extension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/components/widgets/custom_button.dart';
import '../../core/components/widgets/timer_text_widget.dart';
import '../../core/constants/app_contants.dart';
import '../riverpods/auth_riverpod.dart';
import '../riverpods/timer_riverpod.dart';

class SelectedChallenge extends ConsumerStatefulWidget {
  const SelectedChallenge({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelectedChallengeState();
}

class _SelectedChallengeState extends ConsumerState<SelectedChallenge> {
  /* CollectionReference users = FirebaseFirestore.instance.collection('users'); */
/* final CollectionReference users =
      FirebaseFirestore.instance.collection('users'); */
  final CollectionReference egzersiz =
      FirebaseFirestore.instance.collection('egzersizler');

  String userName = "";

  @override
  void initState() {
    getUsersWantedData();
    getUserId();

    super.initState();
  }

  String getUserId() {
    //userId çekme methodu
    String uid = "";
    if (FirebaseAuth.instance.currentUser != null) {
      uid = ref.read(authProvider).fstore.getUserUuid();
      return uid;
    } else {
      return "";
    }
  }

  getUsersWantedData() {
    if (FirebaseAuth.instance.currentUser != null) {
      var data = ref.read(authProvider).getData("users", getUserId());
      data.then((value) {
        userName = value["name"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        title: Text(
          "Welcome  ${userName.toUpperCase()}",
          style: AppConstants.bigtitleTextStyle(Colors.black, fsize: 20),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/LeaderBoardScreen');
              },
              icon: const Icon(Icons.leaderboard_rounded))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Column(
            children: [
              oneTimeRead(egzersiz),
              AppConstants.spaceSmallH15(),
              const TimerText(),
              AppConstants.spaceMediumH25(),
              CustomButton(
                size: context.deviceSize / 2,
                buttonText: "Send Score",
                onpress: () async {
                  sendYourResult();

                  //TODO: her seviye için 30 günlük antreman programı yazılcak her gün için farklı challenge ve gün sonunda leaderboard silinir
                  //ve seviyeye göre leaderboard yapılcak
                  /* int score = ref.read(counterProvider).totalScore;
                  /* await ref
                      .read(authProvider)
                      .fstore
                      .addUserToLeaderboard("$userName + yeni", score); */ */
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void sendYourResult() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("You want to send your score to Leaderboard ?"),
            actions: [
              CustomButton(
                size: context.deviceSize,
                buttonText: "Yes",
                onpress: () async {
                  int score = ref.read(counterProvider).totalScore;
                  await ref
                      .read(authProvider)
                      .fstore
                      .addUserToLeaderboard(userName, score);
                },
              ),
              AppConstants.spaceSmallH15(),
              CustomButton(
                onpress: () => ref.read(authProvider).fauth.signOutuser(),
                size: context.deviceSize,
                buttonText: "No",
              )
            ],
          );
        });
  }

  SizedBox oneTimeRead(CollectionReference<Object?> collection) {
    return SizedBox(
      child: FutureBuilder<DocumentSnapshot>(
        future: collection.doc('egzersiz').get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return const Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;

            return SizedBox(
              height: context.deviceHeight / 3,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data["egzersiz1"].length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppConstants.secondaryColor)),
                    child: ListTile(
                      title: Center(
                        child: Text(data["egzersiz1"]["$index"].toString(),
                            style: AppConstants.bigtitleTextStyle(
                                AppConstants.primaryColor)),
                      ),
                    ),
                  );
                },
              ),
            );
          }

          return const Text("loading");
        },
      ),
    );
  }
}
