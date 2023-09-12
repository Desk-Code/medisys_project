import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medisys/Extention/build_context_extention.dart';
import 'package:medisys/Util/constraint.dart';

Widget loginDash({
  required BuildContext context,
  required String nameOfLogin,
  required Function()? onTap,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        height: context.screenHeight * 0.1428,
        width: context.screenWidth * 0.8,
        margin: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ConstraintData.bgAppBarColor,
          border: Border.all(
            color: Colors.white,
            width: 4,
          ),
          boxShadow: [
            BoxShadow(
              spreadRadius: 20,
              color: Colors.grey.shade400,
              blurStyle: BlurStyle.inner,
            ),
            const BoxShadow(
              spreadRadius: 10,
              color: Colors.grey,
              blurStyle: BlurStyle.inner,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          nameOfLogin,
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
