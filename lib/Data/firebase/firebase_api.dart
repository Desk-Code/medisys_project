import 'package:firebase_database/firebase_database.dart';

class FirebaseApi {
  static final DatabaseReference db = FirebaseDatabase.instance.ref('User');

  static Future<void> setUserData({
    required String hospName,
    required String mobNum,
    required String email,
    required String address,
    required String upiId,
    required String pass,
  }) async {
    String key = db.push().key!;
    await db.child(key).set({
      'key': key,
      'hospName': hospName,
      'mobNum': mobNum,
      'email': email,
      'address': address,
      'upiId': upiId,
      'pass': pass
    });
  }
}
