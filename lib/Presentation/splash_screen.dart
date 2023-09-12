import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:medisys/Util/constraint.dart';
import 'package:medisys/Extention/build_context_extention.dart';
import 'package:medisys/Presentation/boarding_screen/boarding_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with TickerProviderStateMixin {
  late final FlutterGifController _gifInfoDoctorController;
  late final FlutterGifController _gifHeartBeatController;
  @override
  void initState() {
    _gifInfoDoctorController = FlutterGifController(vsync: this);
    _gifHeartBeatController = FlutterGifController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _gifInfoDoctorController.dispose();
    _gifHeartBeatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstraintData.bgColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GifImage(
              controller: _gifInfoDoctorController,
              alignment: Alignment.center,
              image: const AssetImage("assets/animation/intro_doctor.gif"),
              onFetchCompleted: () {
                _gifInfoDoctorController
                    .animateTo(52, duration: const Duration(seconds: 5))
                    .then((value) => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BoardingPage(),
                        )));
              },
            ),
            SizedBox(
              height: context.screenHeight * 0.3117,
              width: context.screenWidth,
              child: GifImage(
                controller: _gifHeartBeatController,
                image: const AssetImage("assets/animation/heartbeat.gif"),
                alignment: Alignment.center,
                onFetchCompleted: () {
                  _gifHeartBeatController.animateTo(70,
                      duration: const Duration(seconds: 5));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
