import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medisys/Common/widgets/common_value.dart';
import 'package:medisys/Common/widgets/login_phone_widget.dart';
import 'package:medisys/Extention/build_context_extention.dart';
import 'package:medisys/Presentation/Presentation_Patient/Patient_Otp/patient_otp_screen.dart';
import 'package:medisys/Util/constraint.dart';

class PatientLoginScreen extends StatefulWidget {
  const PatientLoginScreen({super.key});

  @override
  State<PatientLoginScreen> createState() => _PatientLoginScreenState();
}

class _PatientLoginScreenState extends State<PatientLoginScreen> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: context.screenHeight * 0.35,
              width: context.screenWidth,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/patientlogin.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(
              ConstraintData.otpVerification,
              style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ConstraintData.otpVeriInfo,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            loginPhoneWidget(
              context: context,
              onTap: () {
                log(CommonValue.phNumberValue);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PatientOtpScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
