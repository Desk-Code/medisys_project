import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medisys/Common/widgets/text_form_field.dart';
import 'package:medisys/Data/firebase/staff/staff_api.dart';
import 'package:medisys/Extention/build_context_extention.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Staff_Data/Controller/staff_dash_controller.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Staff_Data/Screens/staff_search_data.dart';
import 'package:medisys/Util/constraint.dart';

class StaffAddDataScreen extends StatefulWidget {
  const StaffAddDataScreen({super.key, required this.staffSection});
  final String staffSection;

  @override
  State<StaffAddDataScreen> createState() => _StaffAddDataScreenState();
}

class _StaffAddDataScreenState extends State<StaffAddDataScreen> {
  @override
  void initState() {
    StaffDashController.txtStaffClearController;
    super.initState();
  }

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
          key: StaffDashController.globalKey,
          child: Column(
            children: [
              commonTextFormField(
                icon: Icons.person,
                nameOfField: "Full Name",
                textEditingController:
                    StaffDashController.txtStaffController[0],
              ),
              commonTextFormField(
                icon: Icons.phone_android_outlined,
                nameOfField: "Mobile Number",
                textEditingController:
                    StaffDashController.txtStaffController[1],
              ),
              commonTextFormField(
                icon: Icons.group,
                nameOfField: "Gender",
                textEditingController:
                    StaffDashController.txtStaffController[2],
              ),
              commonTextFormField(
                icon: Icons.app_registration,
                nameOfField: "Age",
                textEditingController:
                    StaffDashController.txtStaffController[3],
              ),
              commonTextFormField(
                icon: Icons.info,
                nameOfField: "Aadhar Number",
                textEditingController:
                    StaffDashController.txtStaffController[4],
              ),
              commonTextFormField(
                icon: Icons.home,
                nameOfField: "Address",
                textEditingController:
                    StaffDashController.txtStaffController[5],
              ),
              const SizedBox(
                height: 10,
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
                  if (StaffDashController.globalKey.currentState!.validate()) {
                    await StaffApi.setStaffData(
                      fullName: StaffDashController.txtStaffController[0].text,
                      mobileNumber:
                          StaffDashController.txtStaffController[1].text,
                      gender: StaffDashController.txtStaffController[2].text,
                      age: StaffDashController.txtStaffController[3].text,
                      staffSection: widget.staffSection,
                      aadharNumber:
                          StaffDashController.txtStaffController[4].text,
                      address: StaffDashController.txtStaffController[5].text,
                    ).then(
                      (value) => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StaffSearchPage(
                            selectedStaff: widget.staffSection,
                          ),
                        ),
                      ),
                    );
                    StaffDashController.txtStaffClearController;
                  }
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
