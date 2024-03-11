import 'package:change30/src/core/extension/size_extension.dart';
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

  /* final CollectionReference egzersiz =
        FirebaseFirestore.instance.collection('egzersizler');
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users'); */

  String userName = "";

  @override
  void initState() {
    /*  getUsersWantedData(); */
    /* getUserId(); */

    super.initState();
  }

  /* String getUserId() {
    //userId çekme methodu
    var uid = ref.read(authProvider).fstore.getUserUuid();
    return uid;
  } */

  /* getUsersWantedData() {
    var data = ref.read(authProvider).getData("users", getUserId());
    data.then((value) {
      //Setstate ile username içine firebaseden datasını çektiğimiz kullanıcının adını verdik
      setState(() {
        userName = value["name"];
      });
    });
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              //Text("this user id is $userId"),
              //oneTimeRead(egzersiz),
              userName == "" ? const Text("yok kuıllanıcı") : Text(userName),

              spaceSmallH15(),
              const TimerText(),
              spaceMediumH25(),
              CustomButton(
                size: context.deviceSize / 2,
                buttonText: "getir",
                onpress: () async {
                  int score = ref.read(counterProvider).totalScore;
                  await ref
                      .read(authProvider)
                      .fstore
                      .addUserToLeaderboard(userName, score);
                  /* int score = ref.read(counterProvider).totalScore;
                  /* await ref
                      .read(authProvider)
                      .fstore
                      .addUserToLeaderboard("$userName + yeni", score); */ */

                  /* ref
                      .read(authProvider)
                      .fauth
                      .signOutuser();  */
                },
              )
            ],
          ),
        ),
      ),
    );
  }
  /* SizedBox oneTimeRead(CollectionReference<Object?> collection) {
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
            return ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Center(
                    child: Text(data["egzersiz1"]["$index"].toString(),
                        style: bigtitleTextStyle(AppConstants.primaryColor)),
                  ),
                );
              },
            );
          }

          return const Text("loading");
        },
      ),
    );
  } */
}
