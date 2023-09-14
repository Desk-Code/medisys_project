import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medisys/Extention/build_context_extention.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Dashboard_screen/widgets/common_tile_dash.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Dashboard_screen/widgets/drawer_screen.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Doctor_data/Screens/doctor_search_page.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Patient_Data/Screens/patient_search_page.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Staff_Data/Screens/staff_dash_screen.dart';
import 'package:medisys/Util/constraint.dart';

class HospitalDashBoard extends StatefulWidget {
  const HospitalDashBoard({super.key});

  @override
  State<HospitalDashBoard> createState() => _HospitalDashBoardState();
}

class _HospitalDashBoardState extends State<HospitalDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstraintData.bgColor,
      appBar: AppBar(
        backgroundColor: ConstraintData.bgAppBarColor,
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(
              Icons.menu_open,
              size: 28,
            ),
          );
        }),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.dashboard),
          ),
        ],
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
      drawer: dashDrawer(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: context.screenHeight * 0.1,
            ),
            Text(
              "Welcome..",
              style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                commonDash(
                  context,
                  data: "Staff",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StaffDashScreen(),
                        ));
                  },
                ),
                commonDash(
                  context,
                  data: "Patient",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PatientSearchPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                commonDash(
                  context,
                  data: "Doctor",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DoctorSearchPage(),
                      ),
                    );
                  },
                ),
                commonDash(
                  context,
                  data: "Bill",
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
