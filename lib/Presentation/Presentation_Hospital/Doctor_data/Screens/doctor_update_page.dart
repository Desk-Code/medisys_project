import 'package:flutter/material.dart';
import 'package:medisys/Common/widgets/text_form_field.dart';
import 'package:medisys/Extention/build_context_extention.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Doctor_data/Controller/doctor_update.controller.dart';
import 'package:medisys/Util/constraint.dart';

class DoctorUpdatePage extends StatefulWidget {
  const DoctorUpdatePage({super.key});

  @override
  State<DoctorUpdatePage> createState() => _DoctorUpdatePageState();
}

class _DoctorUpdatePageState extends State<DoctorUpdatePage> {
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
          key: DoctorUpdateController.globalKey,
          child: Column(
            children: [
              commonTextFormField(
                icon: Icons.person,
                nameOfField: "Full Name",
                textEditingController:
                    DoctorUpdateController.txtDrUpdateController[0],
              ),
              commonTextFormField(
                icon: Icons.phone_android_outlined,
                nameOfField: "Mobile Number",
                textEditingController:
                    DoctorUpdateController.txtDrUpdateController[1],
              ),
              commonTextFormField(
                icon: Icons.email,
                nameOfField: "Email",
                textEditingController:
                    DoctorUpdateController.txtDrUpdateController[2],
              ),
              commonTextFormField(
                icon: Icons.group,
                nameOfField: "Email",
                textEditingController:
                    DoctorUpdateController.txtDrUpdateController[3],
              ),
              commonTextFormField(
                icon: Icons.app_registration,
                nameOfField: "Age",
                textEditingController:
                    DoctorUpdateController.txtDrUpdateController[4],
              ),
              commonTextFormField(
                icon: Icons.person,
                nameOfField: "Aadhar Number",
                textEditingController:
                    DoctorUpdateController.txtDrUpdateController[5],
              ),
              commonTextFormField(
                icon: Icons.home,
                nameOfField: "Address",
                textEditingController:
                    DoctorUpdateController.txtDrUpdateController[6],
              ),
              commonTextFormField(
                icon: Icons.precision_manufacturing_outlined,
                nameOfField: "Specialist",
                textEditingController:
                    DoctorUpdateController.txtDrUpdateController[7],
              ),
              commonTextFormField(
                icon: Icons.person_pin_sharp,
                nameOfField: "Qualification",
                textEditingController:
                    DoctorUpdateController.txtDrUpdateController[8],
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
                  DoctorUpdateController.txtDrUpdateClearController();
                  Navigator.pop(context);
                  setState(() {});
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
