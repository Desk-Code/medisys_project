import 'package:flutter/material.dart';
import 'package:medisys/Presentation/boarding_screen/screens/boarding_first_page.dart';
import 'package:medisys/Presentation/boarding_screen/screens/boarding_fourth_page.dart';
import 'package:medisys/Presentation/boarding_screen/screens/boarding_second_page.dart';
import 'package:medisys/Presentation/boarding_screen/screens/boarding_third_page.dart';

class BoardingController {
  static bool onLastPage = false;

  static List<Widget> screens = [
    const BoardingFirstPage(),
    const BoardingSecondPage(),
    const BoardingThirdPage(),
    const BoardingFourthPage(),
  ];

  static final PageController _pageController = PageController();
  static PageController get pageController => _pageController;
}
