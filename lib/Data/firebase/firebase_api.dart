import 'package:firebase_database/firebase_database.dart';

class FirebaseApi {
  static final DatabaseReference db = FirebaseDatabase.instance.ref('User');
  static Map loginUser = {};

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

  static Future<bool> selectData(String phNumber) async {
    Map data =
        await db.once().then((value) => value.snapshot.value as Map? ?? {});

    // for the fetching all data from the list
    List<Map> userData = [];
    data.forEach(
      (key, value) {
        userData.add(value);
      },
    );

    // for the fetching ph number value
    for (var element in userData) {
      if (element['mobNum'] == phNumber) {
        loginUser = element;
        return true;
      }
    }
    return false;
  }

  static Future<Map> selectProfileData(String phNumber) async {
    Map data =
        await db.once().then((value) => value.snapshot.value as Map? ?? {});

    // for the fetching all data from the list
    List<Map> userData = [];
    data.forEach(
      (key, value) {
        userData.add(value);
      },
    );

    // for the fetching ph number value
    Map profileData = {};
    for (var element in userData) {
      if (element['mobNum'] == phNumber) {
        profileData = element;
      }
    }
    return profileData;
  }
}
