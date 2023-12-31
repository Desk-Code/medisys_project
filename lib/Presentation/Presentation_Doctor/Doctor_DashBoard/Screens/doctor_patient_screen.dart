import 'package:flutter/material.dart';
import 'package:medisys/Common/widgets/common_text.dart';
import 'package:medisys/Extention/build_context_extention.dart';
import 'package:medisys/Presentation/Presentation_Doctor/Doctor_DashBoard/Screens/doctor_add_payment.dart';
import 'package:medisys/Util/constraint.dart';

class DoctorPatientScreen extends StatefulWidget {
  const DoctorPatientScreen(
      {super.key,
      required this.patientName,
      required this.mobileNum,
      required this.gender,
      required this.bloddGroup,
      required this.age,
      required this.relativeName,
      required this.relativeRelation,
      required this.admitDate,
      required this.roomNo,
      required this.wardNo,
      required this.selectedKey});
  final String selectedKey;
  final String patientName;
  final String mobileNum;
  final String gender;
  final String bloddGroup;
  final String age;
  final String relativeName;
  final String relativeRelation;
  final String admitDate;
  final String roomNo;
  final String wardNo;

  @override
  State<DoctorPatientScreen> createState() => _DoctorPatientScreenState();
}

class _DoctorPatientScreenState extends State<DoctorPatientScreen> {
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
                      commonText(data: "Patient Name", size: 17),
                      commonText(data: "Mobile No", size: 17),
                      commonText(data: "Gender", size: 17),
                      commonText(data: "Blood Group", size: 17),
                      commonText(data: "Age", size: 17),
                      commonText(data: "Relative Name", size: 17),
                      commonText(data: "Relative Relation", size: 17),
                      commonText(data: "Admit Date", size: 17),
                      commonText(data: "Room no", size: 17),
                      commonText(data: "Ward No.", size: 17),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonText(data: ":- ${widget.patientName}", size: 17),
                      commonText(data: ":- ${widget.mobileNum}", size: 17),
                      commonText(data: ":- ${widget.gender}", size: 17),
                      commonText(data: ":- ${widget.bloddGroup}", size: 17),
                      commonText(data: ":- ${widget.age}", size: 17),
                      commonText(data: ":- ${widget.relativeName}", size: 17),
                      commonText(
                          data: ":- ${widget.relativeRelation}", size: 17),
                      commonText(data: ":- ${widget.admitDate}", size: 17),
                      commonText(data: ":- ${widget.roomNo}", size: 17),
                      commonText(data: ":- ${widget.wardNo}", size: 17),
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
                    builder: (context) => DoctorAddPayment(
                      selectedKey: widget.selectedKey,
                    ),
                  ));
            },
            child: const Text("Add Disease and Payment"),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
