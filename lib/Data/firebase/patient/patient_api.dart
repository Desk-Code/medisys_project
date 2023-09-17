import 'package:firebase_database/firebase_database.dart';
import 'package:medisys/Data/firebase/firebase_api.dart';

class PatientApi {
  static final DatabaseReference db = FirebaseDatabase.instance.ref('Patiient');
  static Future<void> setPatientData({
    required String name,
    required String mobileNumber,
    required String gender,
    required String bloodGroup,
    required String age,
    required String doctorName,
    required String relativeName,
    required String relationRelative,
    required String roomNo,
    required String wardNo,
  }) async {
    String key = db.push().key!;
    await db.child(key).set({
      'key': key,
      'hospitalRef': FirebaseApi.loginUser['mobNum'],
      'doctorRef': doctorName,
      'admitDate':
          "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
      'name': name,
      'mobileNumber': mobileNumber,
      'gender': gender,
      'bloodGroup': bloodGroup,
      'age': age,
      'relativeName': relativeName,
      'relationRelative': relationRelative,
      'roomNo': roomNo,
      'wardNo': wardNo,
    });
  }

  static Future<List<Map>> selectPatientData() async {
    Map data =
        await db.once().then((value) => value.snapshot.value as Map? ?? {});
    List<Map> userData = [];
    data.forEach((key, value) {
      userData.add(value);
    });
    List<Map> patientData = [];
    for (var ele in userData) {
      if (ele['hospitalRef'] == FirebaseApi.loginUser['mobNum']) {
        patientData.add(ele);
      }
    }
    return patientData;
  }

  static Future<void> patientupdateData({
    required String key,
    required String name,
    required String mobileNumber,
    required String gender,
    required String bloodGroup,
    required String age,
    required String relativeName,
    required String relationRelative,
    required String roomNo,
    required String wardNo,
  }) async {
    await db.child(key).update(
      {
        'key': key,
        'name': name,
        'mobileNumber': mobileNumber,
        'gender': gender,
        'bloodGroup': bloodGroup,
        'age': age,
        'relativeName': relativeName,
        'relationRelative': relationRelative,
        'roomNo': roomNo,
        'wardNo': wardNo,
      },
    );
  }

  static Future<List<Map>> fetchPatientData(String doctorRef) async {
    Map data =
        await db.once().then((value) => value.snapshot.value as Map? ?? {});
    List<Map> userData = [];
    data.forEach((key, value) {
      userData.add(value);
    });
    List<Map> patientData = [];
    for (var ele in userData) {
      if (ele['doctorRef'] == doctorRef) {
        patientData.add(ele);
      }
    }
    return patientData;
  }

  static Future<List<Map>> fetchPatientRemainingBill() async {
    Map data =
        await db.once().then((value) => value.snapshot.value as Map? ?? {});
    List<Map> userData = [];
    data.forEach((key, value) {
      userData.add(value);
    });
    List<Map> patientData = [];
    for (var ele in userData) {
      if (ele['hospitalRef'] == FirebaseApi.loginUser['mobNum']) {
        if (ele['payAmount'] != null) {
          double amt = double.parse(ele['payAmount']);
          if (amt > 0) {
            patientData.add(ele);
          }
        }
      }
    }
    return patientData;
  }

  static Future<void> updateBillAndDisease({
    required String key,
    required String disease,
    required String payAmount,
  }) async {
    await db.child(key).update(
      {
        'key': key,
        'disease': disease,
        'payAmount': payAmount,
      },
    );
  }

  static Future<void> billPayment({
    required String key,
    required String payAmount,
  }) async {
    await db.child(key).update(
      {
        'key': key,
        'payAmount': payAmount,
      },
    );
  }

  static Future<List> patientDetail(String patientPhNum) async {
    Map data =
        await db.once().then((value) => value.snapshot.value as Map? ?? {});
    List<Map> userData = [];
    data.forEach((key, value) {
      userData.add(value);
    });
    List patientData = [];
    for (var ele in userData) {
      if (ele['mobileNumber'] == patientPhNum) {
        patientData.add(ele);
        break;
      }
    }
    return patientData;
  }
}
