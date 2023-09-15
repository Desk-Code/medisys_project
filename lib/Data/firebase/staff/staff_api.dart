import 'package:firebase_database/firebase_database.dart';

class StaffApi {
  static final DatabaseReference db = FirebaseDatabase.instance.ref('Staff');

  static Future<void> setStaffData({
    required String fullName,
    required String mobileNumber,
    required String gender,
    required String age,
    required String staffSection,
    required String aadharNumber,
    required String address,
  }) async {
    String key = db.push().key!;
    await db.child(key).set({
      'key': key,
      'fullName': fullName,
      'mobileNumber': mobileNumber,
      'gender': gender,
      'age': age,
      'staffSection': staffSection,
      'aadharNumber': aadharNumber,
      'address': address,
    });
  }

  static Future<List<Map>> selectStaffData(String staffSection) async {
    Map data =
        await db.once().then((value) => value.snapshot.value as Map? ?? {});
    List<Map> userData = [];
    data.forEach((key, value) {
      userData.add(value);
    });
    List<Map> staffData = [];
    for (var ele in userData) {
      if (ele['staffSection'] == staffSection) {
        staffData.add(ele);
      }
    }
    return staffData;
  }

  static Future<void> staffupdateData({
    required String key,
    required String fullName,
    required String mobileNumber,
    required String gender,
    required String age,
    required String aadharNumber,
    required String address,
  }) async {
    await db.child(key).update(
      {
        'key': key,
        'fullName': fullName,
        'mobileNumber': mobileNumber,
        'gender': gender,
        'age': age,
        'aadharNumber': aadharNumber,
        'address': address,
      },
    );
  }
  static Future<void> staffDeleteData({required String key}) async {
    await db.child(key).remove();
  }
}
