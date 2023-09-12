import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medisys/Common/widgets/common_value.dart';
import 'package:medisys/Common/widgets/otp_screen.dart';
import 'package:medisys/Presentation/splash_screen/splash_screen.dart';
import 'package:medisys/Util/constraint.dart';

class HospitalOtpScreen extends StatefulWidget {
  const HospitalOtpScreen({super.key, required this.verificationId});

  final String verificationId;

  @override
  State<HospitalOtpScreen> createState() => _HospitalOtpScreenState();
}

class _HospitalOtpScreenState extends State<HospitalOtpScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstraintData.bgAppBarColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: Text(
          ConstraintData.appName,
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: otpScreen(
        context,
        onTap: () {
          AuthCredential credential = PhoneAuthProvider.credential(
            verificationId: widget.verificationId,
            smsCode: CommonValue.otpPinValue,
          );
          _auth.signInWithCredential(credential).then(
                (value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SplashScreenPage(),
                  ),
                ),
              );
        },
      ),
    );
  }
}
