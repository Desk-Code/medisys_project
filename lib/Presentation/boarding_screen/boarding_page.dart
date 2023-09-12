import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medisys/Presentation/boarding_screen/controller/boarding_screen.controller.dart';
import 'package:medisys/Presentation/login_dash/screen/login_dash_screen.dart';
import 'package:medisys/Util/constraint.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingPage extends StatefulWidget {
  const BoardingPage({super.key});

  @override
  State<BoardingPage> createState() => _BoardingPageState();
}

class _BoardingPageState extends State<BoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstraintData.bgAppBarColor,
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
      body: Stack(
        children: [
          PageView(
            controller: BoardingController.pageController,
            onPageChanged: (value) {
              BoardingController.onLastPage =
                  (value == (BoardingController.screens.length - 1))
                      ? true
                      : false;
              setState(() {});
            },
            children: BoardingController.screens,
          ),
          Container(
            alignment: const Alignment(0, 0.95),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    BoardingController.pageController.previousPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeIn);
                  },
                  child: const Text("Previous"),
                ),
                SmoothPageIndicator(
                  controller: BoardingController.pageController,
                  count: BoardingController.screens.length,
                ),
                (BoardingController.onLastPage)
                    ? ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginDashScreen(),
                              ));
                        },
                        child: const Text("Start"),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          BoardingController.pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: const Text("Next"),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
