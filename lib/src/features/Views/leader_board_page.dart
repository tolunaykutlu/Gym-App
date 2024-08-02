import 'package:change30/src/core/components/widgets/app_title_widget.dart';
import 'package:change30/src/core/constants/app_contants.dart';
import 'package:change30/src/core/extension/size_extension.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LeaderBoardScreen extends ConsumerWidget {
  const LeaderBoardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //var userProvider = ref.watch(authProvider);
    //String userId = userProvider.fstore.getUserUuid();
/* final Stream<QuerySnapshot> usersStream =
        FirebaseFirestore.instance.collection('egzersiz').snapshots();
    final CollectionReference collection =
        FirebaseFirestore.instance.collection('users'); */

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const AppTitleWidget(
          padding: 2,
          title1: "LEADER",
          title2: "BOARD",
        ),
        centerTitle: true,
      ),
      body: SizedBox(height: context.deviceHeight * 0.7, child: leaderBoard2()),
    );
  }

  SizedBox leaderBoard2() {
    return SizedBox(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("leaderboard")
            .orderBy('score', descending: false)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // Loading indicator
          }

          final data = snapshot.data!.docs;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              String username = data[index]['username'];
              var score = data[index]['score'];

              String toplamScore() {
                // bu fonksyion sn cinsinden gelen skoru dakika ve saniye olarak çeviriyor
                int dakika = score ~/
                    60; // ~/ bu operatör bölünen sayılardan kalan tam sayıyı verir.
                int kalanSaniye = score % 60;
                String time = "$dakika dk $kalanSaniye sn";
                return time;
              }

              return Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppConstants.secondaryColor)),
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${index + 1}",
                        style: const TextStyle(fontSize: 25),
                      ),
                    ),
                    title: Text(username),
                    subtitle: Text('Score: ${toplamScore()}'),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
