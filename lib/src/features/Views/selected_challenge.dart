import 'dart:async';

import 'package:change30/src/core/constants/app_contants.dart';

import 'package:change30/src/core/extension/size_extension.dart';
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
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    /* CollectionReference users = FirebaseFirestore.instance.collection('users'); */

    var userProvider = ref.watch(authProvider);
    var exercisePro = ref.watch(excerciseProvider);

    final CollectionReference egzersiz =
        FirebaseFirestore.instance.collection('egzersizler');
    /*  final Stream<QuerySnapshot> usersStream =
        FirebaseFirestore.instance.collection('egzersiz').snapshots();
    
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users'); */

    String userId = userProvider.fstore.getUserUuid();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
              child: Text("${exercisePro.exerciseList[0].name} x 10 ",
                  style: bigtitleTextStyle(AppConstants.primaryColor))),
          Text("this user id is $userId"),
          SizedBox(height: 200, child: oneTimeRead(egzersiz)),
          /* spaceMediumH25(),
          streamingUser(context, usersStream),
          spaceMediumH25(),
          
          spaceMediumH25(),
          oneTimeRead2(users, userId),
          spaceMediumH25(), */
          Text(startTimer().toString()),
          ElevatedButton(
              onPressed: () {
                ref.refresh(authProvider).fauth.signOutuser();
              },
              child: const Text("Çıkış"))
        ],
      ),
    );
  }

  int startTimer() {
    int counter = 1;
    Timer.periodic(const Duration(seconds: 1000), (timer) {
      setState(() {
        counter++;
      });
    });
    return counter;
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
            return ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data["egzersiz1"]["$index"].toString(),
                      style: bigtitleTextStyle(AppConstants.primaryColor)),
                );
              },
            ); //Text("Full Name: ${data['pushup']} ${data['squat']}");
          }

          return const Text("loading");
        },
      ),
    );
  }

  SizedBox oneTimeRead2(
      CollectionReference<Object?> collection, String userId) {
    return SizedBox(
      child: FutureBuilder<DocumentSnapshot>(
        future: collection.doc(userId).get(),
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
            return Text("Full Name: ${data['age']} ${data['gender']}");
          }

          return const Text("loading");
        },
      ),
    );
  }

  SizedBox streamingUser(
      BuildContext context, Stream<QuerySnapshot<Object?>> usersStream) {
    return SizedBox(
      height: context.deviceHeight * 0.2,
      child: Builder(
        builder: (context) {
          return StreamBuilder<QuerySnapshot>(
            stream: usersStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }

              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return ListTile(
                    title: Text(data['age'].toString()),
                    subtitle: Text(data['full_name'] ?? "text"),
                  );
                }).toList(),
              );
            },
          );
        },
      ),
    );
  }
}
