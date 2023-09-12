import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medisys/Common/widgets/common_value.dart';
import 'package:medisys/Common/widgets/otp_screen.dart';
import 'package:medisys/Util/constraint.dart';

class DoctorOtpScreen extends StatefulWidget {
  const DoctorOtpScreen({super.key});

  @override
  State<DoctorOtpScreen> createState() => _DoctorOtpScreenState();
}

class _DoctorOtpScreenState extends State<DoctorOtpScreen> {
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
            log(CommonValue.otpPinValue);
          },
        ));
  }
}
