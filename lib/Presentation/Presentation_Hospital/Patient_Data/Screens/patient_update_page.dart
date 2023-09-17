import 'package:flutter/material.dart';
import 'package:medisys/Common/widgets/text_form_field.dart';
import 'package:medisys/Data/firebase/patient/patient_api.dart';
import 'package:medisys/Extention/build_context_extention.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Patient_Data/Controller/patient_add.controller.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Patient_Data/Screens/patient_search_page.dart';
import 'package:medisys/Util/constraint.dart';

class PatientUpdatePage extends StatefulWidget {
  const PatientUpdatePage({super.key, required this.selectedKey});
  final String selectedKey;

  @override
  State<PatientUpdatePage> createState() => _PatientUpdatePageState();
}

class _PatientUpdatePageState extends State<PatientUpdatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ConstraintData.bgColor,
      ),
      backgroundColor: ConstraintData.bgColor,
      body: SingleChildScrollView(
        child: Form(
          key: PatientAddController.globalKey,
          child: Column(
            children: [
              commonTextFormField(
                icon: Icons.person,
                nameOfField: "Patient Name",
                textEditingController:
                    PatientAddController.txtPatientAddController[0],
              ),
              commonTextFormField(
                icon: Icons.phone_android_outlined,
                nameOfField: "Mobile Number",
                textEditingController:
                    PatientAddController.txtPatientAddController[1],
              ),
              commonTextFormField(
                icon: Icons.group,
                nameOfField: "Gender",
                textEditingController:
                    PatientAddController.txtPatientAddController[2],
              ),
              commonTextFormField(
                icon: Icons.bloodtype,
                nameOfField: "Blood group",
                textEditingController:
                    PatientAddController.txtPatientAddController[3],
              ),
              commonTextFormField(
                icon: Icons.app_registration,
                nameOfField: "Age",
                textEditingController:
                    PatientAddController.txtPatientAddController[4],
              ),
              commonTextFormField(
                icon: Icons.person,
                nameOfField: "Relative Name",
                textEditingController:
                    PatientAddController.txtPatientAddController[5],
              ),
              commonTextFormField(
                icon: Icons.info_outline,
                nameOfField: "Relative Relation",
                textEditingController:
                    PatientAddController.txtPatientAddController[6],
              ),
              commonTextFormField(
                icon: Icons.room,
                nameOfField: "Room No",
                textEditingController:
                    PatientAddController.txtPatientAddController[7],
              ),
              commonTextFormField(
                icon: Icons.bed,
                nameOfField: "Ward No.",
                textEditingController:
                    PatientAddController.txtPatientAddController[8],
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
                onPressed: () async {
                  if (PatientAddController.globalKey.currentState!.validate()) {
                    await PatientApi.patientupdateData(
                            key: widget.selectedKey,
                            name: PatientAddController
                                .txtPatientAddController[0].text,
                            mobileNumber: PatientAddController
                                .txtPatientAddController[1].text,
                            gender: PatientAddController
                                .txtPatientAddController[2].text,
                            bloodGroup: PatientAddController
                                .txtPatientAddController[3].text,
                            age: PatientAddController
                                .txtPatientAddController[4].text,
                            relativeName: PatientAddController
                                .txtPatientAddController[5].text,
                            relationRelative: PatientAddController
                                .txtPatientAddController[6].text,
                            roomNo: PatientAddController
                                .txtPatientAddController[7].text,
                            wardNo: PatientAddController
                                .txtPatientAddController[8].text)
                        .then((value) {
                      PatientAddController.txtPatientAddClearController;
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PatientSearchPage(),
                          ));
                    });
                  }
                },
                child: const Text("Update"),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
