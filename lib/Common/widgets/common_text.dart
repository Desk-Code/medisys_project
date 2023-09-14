import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget commonText({
  required String data,
  required double size,
  Color color = Colors.black,
}) =>
    Padding(
      padding: const EdgeInsets.only(
        top: 5,
        bottom: 5,
      ),
      child: Text(
        data,
        style: GoogleFonts.lato(
          color: color,
          fontSize: size,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
