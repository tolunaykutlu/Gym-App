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
        title: const Text("SIRALAMA"),
        centerTitle: true,
      ),
      body: SizedBox(height: context.deviceHeight * 0.7, child: leaderBoard2()),
    );
  }

  SizedBox leaderBoard2() {
    //TODO:sıralam sayfası dizayn edilcek timerdaki skoru firebase yazılcak
    return SizedBox(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("leaderboard")
            .orderBy('score', descending: true)
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
              final username = data[index]['username'];
              final score = data[index]['score'];

              return ListTile(
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${index + 1}"),
                ),
                title: Text(username),
                subtitle: Text('Score: $score'),
              );
            },
          );
        },
      ),
    );
  }
}
