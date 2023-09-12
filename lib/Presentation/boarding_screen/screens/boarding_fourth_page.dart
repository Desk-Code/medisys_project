import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medisys/Extention/build_context_extention.dart';
import 'package:medisys/Util/constraint.dart';

class BoardingFourthPage extends StatefulWidget {
  const BoardingFourthPage({super.key});

  @override
  State<BoardingFourthPage> createState() => _BoardingFourthPageState();
}

class _BoardingFourthPageState extends State<BoardingFourthPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: context.screenHeight * 4 / 10,
          width: context.screenWidth * 8 / 10,
          margin: EdgeInsets.only(
              top: context.screenHeight * 0.3 / 10,
              left: context.screenWidth * 1 / 10,
              right: context.screenWidth * 1 / 10,
              bottom: context.screenHeight * 0.5 / 10),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/logo.png"),
              fit: BoxFit.fill,
            ),
          ),
          alignment: Alignment.center,
        ),
        Container(
          height: context.screenHeight * 1.5 / 10,
          width: context.screenWidth * 8 / 10,
          alignment: Alignment.center,
          child: Text(
            ConstraintData.rule4,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        Container(
          height: context.screenHeight * 1.8 / 10,
          width: context.screenWidth * 4 / 10,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/namste.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
