import 'package:flutter/material.dart';
import 'package:medisys/Common/widgets/common_text.dart';
import 'package:medisys/Extention/build_context_extention.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Patient_Data/Controller/patient_add.controller.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Patient_Data/Screens/patient_update_page.dart';
import 'package:medisys/Util/constraint.dart';

class PatientProfilePage extends StatefulWidget {
  const PatientProfilePage(
      {super.key,
      required this.patientName,
      required this.mobileNumber,
      required this.gender,
      required this.bloodGroup,
      required this.age,
      required this.doctorName,
      required this.relativeName,
      required this.relativeRelation,
      required this.roomNo,
      required this.admitDate,
      required this.wardNo,
      required this.selectedKey});
  final String selectedKey;
  final String patientName;
  final String mobileNumber;
  final String gender;
  final String bloodGroup;
  final String age;
  final String doctorName;
  final String relativeName;
  final String relativeRelation;
  final String roomNo;
  final String admitDate;
  final String wardNo;

  @override
  State<PatientProfilePage> createState() => _PatientProfilePageState();
}

class _PatientProfilePageState extends State<PatientProfilePage> {
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
                      commonText(data: "Doctor Ref", size: 17),
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
                      commonText(data: ":- ${widget.mobileNumber}", size: 17),
                      commonText(data: ":- ${widget.gender}", size: 17),
                      commonText(data: ":- ${widget.bloodGroup}", size: 17),
                      commonText(data: ":- ${widget.age}", size: 17),
                      commonText(data: ":- ${widget.doctorName}", size: 17),
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
              PatientAddController.txtPatientAddController[0].text =
                  widget.patientName;
              PatientAddController.txtPatientAddController[1].text =
                  widget.mobileNumber;
              PatientAddController.txtPatientAddController[2].text =
                  widget.gender;
              PatientAddController.txtPatientAddController[3].text =
                  widget.bloodGroup;
              PatientAddController.txtPatientAddController[4].text = widget.age;
              PatientAddController.txtPatientAddController[5].text =
                  widget.relativeName;
              PatientAddController.txtPatientAddController[6].text =
                  widget.relativeRelation;
              PatientAddController.txtPatientAddController[7].text =
                  widget.roomNo;
              PatientAddController.txtPatientAddController[8].text =
                  widget.wardNo;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PatientUpdatePage(
                      selectedKey: widget.selectedKey,
                    ),
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
