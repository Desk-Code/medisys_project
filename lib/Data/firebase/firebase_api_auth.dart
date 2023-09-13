import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medisys/Common/widgets/common_toast.dart';
import 'package:medisys/Common/widgets/common_value.dart';

class FirebaseApiAuth {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static String firebaseVerificationId = '';

  static Future<void> sendOtp(
    BuildContext context, {
    required String phNumber,
    required Widget Function(BuildContext) toNavigate,
  }) async {
    _auth.verifyPhoneNumber(
      // timeout: const Duration(seconds: 30),
      phoneNumber: phNumber,
      verificationCompleted: (phoneAuthCredential) {
        FlutterToast().showMessage('Verification completed');
      },
      verificationFailed: (error) {
        FlutterToast().showMessage(error.toString());
      },
      codeSent: (verificationId, forceResendingToken) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: toNavigate,
          ),
        );
        firebaseVerificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  static Future<void> otpVerification(
    BuildContext context, {
    required Widget Function(BuildContext) toNaviagte,
  }) async {
    AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: firebaseVerificationId,
      smsCode: CommonValue.otpPinValue,
    );
    _auth.signInWithCredential(credential).then(
          // (value) => Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: toNaviagte,
          //   ),
          // ),
          (value) => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: toNaviagte),
            (route) => false,
          ),
        );
  }
}
