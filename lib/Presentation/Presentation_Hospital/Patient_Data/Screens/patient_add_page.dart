import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medisys/Common/widgets/text_form_field.dart';
import 'package:medisys/Extention/build_context_extention.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Patient_Data/Controller/patient_add.controller.dart';
import 'package:medisys/Util/constraint.dart';

class PatientAddPage extends StatefulWidget {
  const PatientAddPage({super.key});

  @override
  State<PatientAddPage> createState() => _PatientAddPageState();
}

class _PatientAddPageState extends State<PatientAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                icon: Icons.date_range,
                nameOfField: "Admit Date",
                textEditingController:
                    PatientAddController.txtPatientAddController[8],
              ),
              commonTextFormField(
                icon: Icons.bed,
                nameOfField: "Ward No.",
                textEditingController:
                    PatientAddController.txtPatientAddController[9],
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
                  PatientAddController.txtPatientAddClearController();
                  Navigator.pop(context);
                  setState(() {});
                },
                child: const Text("Submit"),
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
