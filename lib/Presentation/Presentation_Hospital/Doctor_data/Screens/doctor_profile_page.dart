import 'package:flutter/material.dart';
import 'package:medisys/Common/widgets/common_text.dart';
import 'package:medisys/Extention/build_context_extention.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Doctor_data/Screens/doctor_update_page.dart';
import 'package:medisys/Util/constraint.dart';

class DoctorProfilePage extends StatefulWidget {
  const DoctorProfilePage({super.key});

  @override
  State<DoctorProfilePage> createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstraintData.bgColor,
        elevation: 0,
      ),
      backgroundColor: ConstraintData.bgColor,
      body: Column(
        children: [
          Container(
            height: context.screenHeight * 0.21,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/logo.png"),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: Container(
              width: context.screenWidth * 0.9,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonText(data: "Full Name", size: 17),
                      commonText(data: "Mobile No", size: 17),
                      commonText(data: "Email", size: 17),
                      commonText(data: "Gender", size: 17),
                      commonText(data: "Age", size: 17),
                      commonText(data: "Address", size: 17),
                      commonText(data: "Aadhar Number", size: 17),
                      commonText(data: "Specialist", size: 17),
                      commonText(data: "Qualification", size: 17),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonText(data: ":- Full Name", size: 17),
                      commonText(data: ":- Mobile No", size: 17),
                      commonText(data: ":- Email", size: 17),
                      commonText(data: ":- Gender", size: 17),
                      commonText(data: ":- Age", size: 17),
                      commonText(data: ":- Address", size: 17),
                      commonText(data: ":- Aadhar Number", size: 17),
                      commonText(data: ":- Specialist", size: 17),
                      commonText(data: ":- Qualification", size: 17),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                Size(
                  context.screenWidth * 0.9,
                  context.screenHeight * 0.06,
                ),
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DoctorUpdatePage(),
                  ));
            },
            child: const Text("Update"),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
