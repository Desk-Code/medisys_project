import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medisys/Common/widgets/text_form_field.dart';
import 'package:medisys/Extention/build_context_extention.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Doctor_data/Controller/doctor_add.controller.dart';
import 'package:medisys/Util/constraint.dart';

class DoctorAddPage extends StatefulWidget {
  const DoctorAddPage({super.key});

  @override
  State<DoctorAddPage> createState() => _DoctorAddPageState();
}

class _DoctorAddPageState extends State<DoctorAddPage> {
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
          key: DoctorAddController.globalKey,
          child: Column(
            children: [
              commonTextFormField(
                icon: Icons.person,
                nameOfField: "Full Name",
                textEditingController:
                    DoctorAddController.txtDrAddController[0],
              ),
              commonTextFormField(
                icon: Icons.phone_android_outlined,
                nameOfField: "Mobile Number",
                textEditingController:
                    DoctorAddController.txtDrAddController[1],
              ),
              commonTextFormField(
                icon: Icons.email,
                nameOfField: "Email",
                textEditingController:
                    DoctorAddController.txtDrAddController[2],
              ),
              commonTextFormField(
                icon: Icons.group,
                nameOfField: "Email",
                textEditingController:
                    DoctorAddController.txtDrAddController[3],
              ),
              commonTextFormField(
                icon: Icons.app_registration,
                nameOfField: "Age",
                textEditingController:
                    DoctorAddController.txtDrAddController[4],
              ),
              commonTextFormField(
                icon: Icons.person,
                nameOfField: "Aadhar Number",
                textEditingController:
                    DoctorAddController.txtDrAddController[5],
              ),
              commonTextFormField(
                icon: Icons.home,
                nameOfField: "Address",
                textEditingController:
                    DoctorAddController.txtDrAddController[6],
              ),
              commonTextFormField(
                icon: Icons.precision_manufacturing_outlined,
                nameOfField: "Specialist",
                textEditingController:
                    DoctorAddController.txtDrAddController[7],
              ),
              commonTextFormField(
                icon: Icons.person_pin_sharp,
                nameOfField: "Qualification",
                textEditingController:
                    DoctorAddController.txtDrAddController[8],
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
                  DoctorAddController.txtDrAddClearController();
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
