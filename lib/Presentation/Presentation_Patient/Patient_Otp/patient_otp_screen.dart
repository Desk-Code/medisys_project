import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medisys/Common/widgets/otp_screen.dart';
import 'package:medisys/Data/firebase/firebase_api_auth.dart';
import 'package:medisys/Presentation/Presentation_Patient/Patient_DashBoard/patient_dashboard_page.dart';
import 'package:medisys/Util/constraint.dart';

class PatientOtpScreen extends StatefulWidget {
  const PatientOtpScreen({super.key});

  @override
  State<PatientOtpScreen> createState() => _PatientOtpScreenState();
}

class _PatientOtpScreenState extends State<PatientOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ConstraintData.bgColor,
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
            FirebaseApiAuth.otpVerification(
              context,
              toNaviagte: (context) => const PatientDashPage(),
            );
          },
        ));
  }
}
