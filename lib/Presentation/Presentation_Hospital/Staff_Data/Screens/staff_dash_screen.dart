import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Staff_Data/Controller/staff_dash_controller.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Staff_Data/Screens/staff_search_data.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Staff_Data/Widgets/common_staff_dash.dart';
import 'package:medisys/Util/constraint.dart';

class StaffDashScreen extends StatefulWidget {
  const StaffDashScreen({super.key});

  @override
  State<StaffDashScreen> createState() => _StaffDashScreenState();
}

class _StaffDashScreenState extends State<StaffDashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstraintData.bgColor,
      appBar: AppBar(
        backgroundColor: ConstraintData.bgAppBarColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
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
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Wrap(
            spacing: 7,
            children: List.generate(
              StaffDashController.staffField.length,
              (index) => commonStaffDash(
                context,
                data: StaffDashController.staffField[index],
                assetUrl: StaffDashController.assetUrl[index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          StaffSearchPage(selectedStaff: index),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
