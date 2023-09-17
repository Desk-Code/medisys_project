import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:medisys/Data/firebase/firebase_api.dart';

class DoctorApi {
  static final DatabaseReference db = FirebaseDatabase.instance.ref('Doctor');
  static Future<void> setDoctorData({
    required String fullName,
    required String mobileNumber,
    required String email,
    required String gender,
    required String age,
    required String aadharNumber,
    required String address,
    required String specialist,
    required String qualification,
  }) async {
    String key = db.push().key!;
    await db.child(key).set({
      'key': key,
      'hospitalRef': FirebaseApi.loginUser['mobNum'],
      'fullName': fullName,
      'mobileNumber': mobileNumber,
      'email': email,
      'gender': gender,
      'age': age,
      'aadharNumber': aadharNumber,
      'address': address,
      'specialist': specialist,
      'qualification': qualification,
    });
  }

  static Future<List<Map>> selectDoctorData() async {
    Map data =
        await db.once().then((value) => value.snapshot.value as Map? ?? {});
    List<Map> userData = [];
    data.forEach((key, value) {
      userData.add(value);
    });
    List<Map> doctorData = [];
    for (var ele in userData) {
      if (ele['hospitalRef'] == FirebaseApi.loginUser['mobNum']) {
        doctorData.add(ele);
      }
    }
    return doctorData;
  }

  static Future<void> staffupdateData({
    required String key,
    required String fullName,
    required String mobileNumber,
    required String email,
    required String gender,
    required String age,
    required String aadharNumber,
    required String address,
    required String specialist,
    required String qualification,
  }) async {
    await db.child(key).update(
      {
        'key': key,
        'fullName': fullName,
        'mobileNumber': mobileNumber,
        'email': email,
        'gender': gender,
        'age': age,
        'aadharNumber': aadharNumber,
        'address': address,
        'specialist': specialist,
        'qualification': qualification,
      },
    );
  }

  static Future<List> selectDoctorName() async {
    Map data =
        await db.once().then((value) => value.snapshot.value as Map? ?? {});
    List<Map> userData = [];
    data.forEach((key, value) {
      userData.add(value);
    });
    List doctorData = [];
    for (var ele in userData) {
      doctorData.add(ele);
    }
    log("$doctorData");
    return doctorData;
  }

  static Future<List> doctorDetail(String doctorPhNum) async {
    Map data =
        await db.once().then((value) => value.snapshot.value as Map? ?? {});
    List<Map> userData = [];
    data.forEach((key, value) {
      userData.add(value);
    });
    List doctorData = [];
    for (var ele in userData) {
      if (ele['mobileNumber'] == doctorPhNum) {
        doctorData.add(ele);
      }
    }
    return doctorData;
  }

  // static Future<void> staffDeleteData({required String key}) async {
  //   await db.child(key).remove();
  // }
}
