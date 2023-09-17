import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../features/riverpods/auth_riverpod.dart';

class GetUserDataFromFirebase {
  //singleton
  GetUserDataFromFirebase._privateConst();
  static final GetUserDataFromFirebase instance =
      GetUserDataFromFirebase._privateConst();

  String getData(
    WidgetRef ref,
    String wantedData,
  ) {
    //data geliyor ama ekranda gözükmüyor TODO: bak buraya
    String userData = "";
    String userUid = ref.read(authProvider).fstore.getUserUuid();
    var data = ref.read(authProvider).getData("users", userUid);
    data.then((value) {
      //Setstate ile username içine firebaseden datasını çektiğimiz kullanıcının adını verdik

      userData = value[wantedData];
    });
    return userData;
  }
}
