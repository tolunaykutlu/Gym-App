abstract class BaseFirestoreService {
  Future addDataToFirestore(
      Map<String, dynamic> data, String collectionName, String docName);
  Future updateDataToFirestore(
      Map<String, dynamic> data, String collectionName, String docName);

  Future getDataFromFirebase(String collectionName, String docName);
  Future addUserToLeaderboard(String username, int score);
  String getUserUuid();
}
