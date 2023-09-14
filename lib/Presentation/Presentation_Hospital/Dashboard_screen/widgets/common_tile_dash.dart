import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medisys/Extention/build_context_extention.dart';

Widget commonDash(
  BuildContext context, {
  required String data,
  required Function()? onTap,
}) =>
    Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: context.screenHeight * 0.19,
          width: context.screenWidth * 0.4,
          alignment: Alignment.center,
          child: Text(
            data,
            style: GoogleFonts.lato(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
