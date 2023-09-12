import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medisys/Extention/build_context_extention.dart';
import 'package:medisys/Util/constraint.dart';

class BoardingThirdPage extends StatefulWidget {
  const BoardingThirdPage({super.key});

  @override
  State<BoardingThirdPage> createState() => _BoardingThirdPageState();
}

class _BoardingThirdPageState extends State<BoardingThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: context.screenHeight * 5 / 10,
          width: context.screenWidth * 9 / 10,
          margin: EdgeInsets.only(
            left: context.screenWidth * 0.5 / 10,
            right: context.screenWidth * 0.5 / 10,
            bottom: context.screenHeight * 0.2 / 10,
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/intro_doctor.jpg"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Text(
          ConstraintData.rule3,
          style: GoogleFonts.lato(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
