import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medisys/Common/widgets/common_value.dart';
import 'package:medisys/Extention/build_context_extention.dart';
import 'package:medisys/Util/constraint.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

Widget otpScreen(
  BuildContext context, {
  required Function()? onTap,
}) =>
    SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: context.screenHeight * 0.35,
            width: context.screenWidth * 0.9,
            margin: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.1),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/otp.jpg"),
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
            ConstraintData.otpSend,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          OTPTextField(
            margin: const EdgeInsets.symmetric(vertical: 15),
            controller: CommonValue.otpController,
            length: 6,
            width: context.screenWidth * 0.95,
            textFieldAlignment: MainAxisAlignment.spaceEvenly,
            fieldWidth: 45,
            fieldStyle: FieldStyle.box,
            outlineBorderRadius: 15,
            style: const TextStyle(fontSize: 17),
            onChanged: (value) {},
            onCompleted: (pin) {
              CommonValue.otpPinValue = pin;
            },
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                ConstraintData.otpNotRecieve,
                style: GoogleFonts.lato(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                ConstraintData.otpResend,
                style: GoogleFonts.lato(
                  color: Colors.redAccent,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(7),
                minimumSize: MaterialStateProperty.all(
                  Size(
                    context.screenWidth * 0.8,
                    context.screenHeight * 0.058,
                  ),
                ),
              ),
              onPressed: onTap,
              child: const Text("Verify")),
        ],
      ),
    );
