import 'package:flutter/material.dart';

class ConstraintData {
  // application Name
  static String appName = "MediSys";

  //Private Polices

  static String rule1_1 = "Welcome to MediSys";
  static String rule1_2 =
      "Ready to use Application? Swipe left to s learn the basics of Application.";

  static String rule2 =
      "Info : This is info box here you know how to work login section.\n2 : This is Patient side login activity.\n3 : This is Doctor side login activity.\n4 : This is Hospital side login activity.";

  static String rule3 = "This App is Powered by Desk-code";

  static String rule4 =
      "Desk-Code has worried about admin and user privacy. So forget privacy related and use smooth and excellent app.";

  //color

  //app bar background color
  static final Color bgAppBarColor = Colors.cyan.shade50;

  //scaffold backgroundColor
  static const Color bgColor = Colors.white;

  // app background color
  static Color bgAppColor = Colors.grey.shade300;

  // Login info

  static const String loginInfo =
      "Login according to your field \n\n* PATIENT LOGIN Query \n\nLogin first and Patient can only see own data. \n\n* Hospital LOGIN Query \n\nRegister First If you have not part of MediSys for that goto hospital login button and register. Now you are part of MediSys. You are Admin And Handle all Data. \n\n* Doctor LOGIN Query \n\n Doctor can only see own data and update own data Doctor details will be only add by hospital admin staff. \n\nHere Hospital Admin is main to handle all of details. Hospital can add doctor details, patient details etc...";

  // login Side

  // otp
  static const String sideName = "Patient, Hospital & Doctor";
  static const String otpVerification = "OTP Verification";
  static const String otpSend = "Please Enter the OTP send to you";
  static const String otpVeriInfo =
      "We will send you an one time password \n on this given mobile number";
  static const String otpNotRecieve = "Didn't receive the otp?";
  static const String otpResend = "RESEND OTP";

  // 1. Patient Side

  static const String patientLogin = "Patient Login";

  // 2. Doctor Side

  static const String doctorLogin = "Doctor Login";

  // 3. Hospital Side

  static const String hospitalLogin = "Hospital Login";
}
