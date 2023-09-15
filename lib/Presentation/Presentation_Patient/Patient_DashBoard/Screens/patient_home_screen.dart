import 'package:flutter/material.dart';
import 'package:medisys/Common/widgets/common_text.dart';
import 'package:medisys/Extention/build_context_extention.dart';

class PatientHomeScreen extends StatefulWidget {
  const PatientHomeScreen({super.key});

  @override
  State<PatientHomeScreen> createState() => _PatientHomeScreenState();
}

class _PatientHomeScreenState extends State<PatientHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                    commonText(data: "Patient Name", size: 17),
                    commonText(data: "Mobile No", size: 17),
                    commonText(data: "Gender", size: 17),
                    commonText(data: "Blood Group", size: 17),
                    commonText(data: "Age", size: 17),
                    commonText(data: "Relative Name", size: 17),
                    commonText(data: "Relative Relation", size: 17),
                    commonText(data: "Room no", size: 17),
                    commonText(data: "Admit Date", size: 17),
                    commonText(data: "Payment Amount", size: 17),
                    commonText(data: "Ward No.", size: 17),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonText(data: ":- Patient Name", size: 17),
                    commonText(data: ":- Mobile No", size: 17),
                    commonText(data: ":- Gender", size: 17),
                    commonText(data: ":- Blood Group", size: 17),
                    commonText(data: ":- Age", size: 17),
                    commonText(data: ":- Relative Name", size: 17),
                    commonText(data: ":- Relative Relation", size: 17),
                    commonText(data: ":- Room no", size: 17),
                    commonText(data: ":- Admit Date", size: 17),
                    commonText(data: ":- Payment Amount", size: 17),
                    commonText(data: ":- Ward No.", size: 17),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 70,
        ),
      ],
    );
  }
}
