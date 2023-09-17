import 'package:flutter/material.dart';
import 'package:medisys/Common/widgets/common_text.dart';
import 'package:medisys/Extention/build_context_extention.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Doctor_data/Controller/doctor_update.controller.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Doctor_data/Screens/doctor_update_page.dart';
import 'package:medisys/Util/constraint.dart';

class DoctorProfilePage extends StatefulWidget {
  const DoctorProfilePage(
      {super.key,
      required this.fullName,
      required this.mobileNumber,
      required this.email,
      required this.gender,
      required this.age,
      required this.address,
      required this.aadharCard,
      required this.specialist,
      required this.qualification,
      required this.selectedKey});
  final String selectedKey;
  final String fullName;
  final String mobileNumber;
  final String email;
  final String gender;
  final String age;
  final String address;
  final String aadharCard;
  final String specialist;
  final String qualification;

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
                      commonText(data: ":- ${widget.fullName}", size: 17),
                      commonText(data: ":- ${widget.mobileNumber}", size: 17),
                      commonText(data: ":- ${widget.email}", size: 17),
                      commonText(data: ":- ${widget.gender}", size: 17),
                      commonText(data: ":- ${widget.age}", size: 17),
                      commonText(data: ":- ${widget.address}", size: 17),
                      commonText(data: ":- ${widget.aadharCard}", size: 17),
                      commonText(data: ":- ${widget.specialist}", size: 17),
                      commonText(data: ":- ${widget.qualification}", size: 17),
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
              DoctorUpdateController.txtDrUpdateController[0].text =
                  widget.fullName;
              DoctorUpdateController.txtDrUpdateController[1].text =
                  widget.mobileNumber;
              DoctorUpdateController.txtDrUpdateController[2].text =
                  widget.email;
              DoctorUpdateController.txtDrUpdateController[3].text =
                  widget.gender;
              DoctorUpdateController.txtDrUpdateController[4].text = widget.age;
              DoctorUpdateController.txtDrUpdateController[5].text =
                  widget.aadharCard;
              DoctorUpdateController.txtDrUpdateController[6].text =
                  widget.address;
              DoctorUpdateController.txtDrUpdateController[7].text =
                  widget.specialist;
              DoctorUpdateController.txtDrUpdateController[8].text =
                  widget.qualification;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DoctorUpdatePage(
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
