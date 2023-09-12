import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medisys/Util/constraint.dart';

class BoardingFirstPage extends StatefulWidget {
  const BoardingFirstPage({super.key});

  @override
  State<BoardingFirstPage> createState() => _BoardingFirstPageState();
}

class _BoardingFirstPageState extends State<BoardingFirstPage>
    with TickerProviderStateMixin {
  late final FlutterGifController _gifInfoDoctorController;
  @override
  void initState() {
    _gifInfoDoctorController = FlutterGifController(
        vsync: this, reverseDuration: const Duration(milliseconds: 3000));
    super.initState();
  }

  @override
  void dispose() {
    _gifInfoDoctorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GifImage(
          controller: _gifInfoDoctorController,
          alignment: Alignment.center,
          image: const AssetImage("assets/animation/intro_doctor.gif"),
          repeat: ImageRepeat.repeat,
          onFetchCompleted: () {
            _gifInfoDoctorController.repeat(
              min: 0,
              max: 25,
              period: const Duration(milliseconds: 3000),
              reverse: true,
            );
          },
        ),
        Text(
          ConstraintData.rule1_1,
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          ConstraintData.rule1_2,
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
