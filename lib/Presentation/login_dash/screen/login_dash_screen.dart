import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medisys/Presentation/Presentation_Doctor/Doctor_Login/doctor_login_screen.dart';
import 'package:medisys/Presentation/Presentation_Patient/Patient_Login/patient_login_screen.dart';
import 'package:medisys/Presentation/login_dash/widgets/login_dashes.dart';
import 'package:medisys/Presentation/login_dash/widgets/login_info.dart';
import 'package:medisys/Util/constraint.dart';

class LoginDashScreen extends StatefulWidget {
  const LoginDashScreen({super.key});

  @override
  State<LoginDashScreen> createState() => _LoginDashScreenState();
}

class _LoginDashScreenState extends State<LoginDashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstraintData.bgAppColor,
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
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                enableDrag: true,
                isScrollControlled: true,
                builder: (context) => loginInfo(context),
              );
            },
            icon: const Icon(
              Icons.info_outlined,
              size: 33,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          loginDash(
            context: context,
            nameOfLogin: ConstraintData.patientLogin,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PatientLoginScreen(),
                ),
              );
            },
          ),
          loginDash(
            context: context,
            nameOfLogin: ConstraintData.doctorLogin,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DoctorLoginScreen(),
                ),
              );
            },
          ),
          loginDash(
            context: context,
            nameOfLogin: ConstraintData.hospitalLogin,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
