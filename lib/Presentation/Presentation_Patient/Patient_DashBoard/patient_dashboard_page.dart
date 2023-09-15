import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:medisys/Presentation/Presentation_Patient/Patient_DashBoard/Screens/patient_home_screen.dart';
import 'package:medisys/Presentation/Presentation_Patient/Patient_DashBoard/Screens/patient_logout.dart';
import 'package:medisys/Presentation/Presentation_Patient/Patient_DashBoard/Screens/patient_payment_screen.dart';
import 'package:medisys/Util/constraint.dart';

class PatientDashPage extends StatefulWidget {
  const PatientDashPage({super.key});

  @override
  State<PatientDashPage> createState() => _PatientDashPageState();
}

class _PatientDashPageState extends State<PatientDashPage> {
  List<Widget> screenList = [
    const PatientHomeScreen(),
    const PatientPaymentScreen(),
    const PatientLogOut(),
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(ConstraintData.appName),
        centerTitle: true,
      ),
      extendBody: true,
      body: screenList[_selectedIndex],
      bottomNavigationBar: AnimatedBottomNavigationBar(
        iconSize: 26,
        splashColor: Colors.cyan.shade700,
        activeColor: Colors.cyan,
        backgroundColor: ConstraintData.bgAppBarColor,
        gapLocation: GapLocation.none,
        icons: const [
          Icons.home,
          Icons.currency_rupee_sharp,
          Icons.logout,
        ],
        activeIndex: _selectedIndex,
        leftCornerRadius: 20,
        rightCornerRadius: 20,
        onTap: (index) => setState(() => _selectedIndex = index),
        //other params
      ),
    );
  }
}
