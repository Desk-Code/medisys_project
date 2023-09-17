import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medisys/Presentation/Presentation_Patient/Patient_DashBoard/Screens/patient_home_screen.dart';
import 'package:medisys/Presentation/Presentation_Patient/Patient_DashBoard/Screens/patient_payment_screen.dart';
import 'package:medisys/Presentation/login_dash/screen/login_dash_screen.dart';
import 'package:medisys/Util/constraint.dart';

class PatientDashPage extends StatefulWidget {
  const PatientDashPage({super.key});

  @override
  State<PatientDashPage> createState() => _PatientDashPageState();
}

class _PatientDashPageState extends State<PatientDashPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<Widget> screenList = [
    const PatientHomeScreen(),
    const PatientPaymentScreen(),
    Container(),
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
        onTap: (index) => (index != 2)
            ? setState(() => _selectedIndex = index)
            : showDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: const Text('Please Confirm'),
                  content: const Text("Do you want to logout ?"),
                  actions: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("No"),
                    ),
                    MaterialButton(
                      onPressed: () async {
                        await _auth
                            .signOut()
                            .then((value) => Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginDashScreen(),
                                ),
                                (route) => false));
                      },
                      child: const Text("Yes"),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
