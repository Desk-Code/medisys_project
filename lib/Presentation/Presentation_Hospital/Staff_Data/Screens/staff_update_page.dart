import 'package:flutter/material.dart';
import 'package:medisys/Common/widgets/text_form_field.dart';
import 'package:medisys/Data/firebase/staff/staff_api.dart';
import 'package:medisys/Extention/build_context_extention.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Staff_Data/Controller/staff_dash_controller.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Staff_Data/Screens/staff_search_data.dart';
import 'package:medisys/Util/constraint.dart';

class StaffUpdatePage extends StatefulWidget {
  const StaffUpdatePage(
      {super.key, required this.selectedKey, required this.selectedStaff});
  final String selectedKey;
  final String selectedStaff;

  @override
  State<StaffUpdatePage> createState() => _StaffUpdatePageState();
}

class _StaffUpdatePageState extends State<StaffUpdatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              StaffDashController.txtStaffClearController;
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        elevation: 0,
        backgroundColor: ConstraintData.bgColor,
      ),
      backgroundColor: ConstraintData.bgColor,
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
                    await StaffApi.staffupdateData(
                            key: widget.selectedKey,
                            fullName:
                                StaffDashController.txtStaffController[0].text,
                            mobileNumber:
                                StaffDashController.txtStaffController[1].text,
                            gender:
                                StaffDashController.txtStaffController[2].text,
                            age: StaffDashController.txtStaffController[3].text,
                            aadharNumber:
                                StaffDashController.txtStaffController[4].text,
                            address:
                                StaffDashController.txtStaffController[5].text)
                        .then((value) =>
                            StaffDashController.txtStaffClearController)
                        .then((value) => Navigator.pop(context))
                        .then(
                          (value) => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StaffSearchPage(
                                selectedStaff: widget.selectedStaff,
                              ),
                            ),
                          ),
                        );
                    setState(() {});
                    StaffDashController.txtStaffClearController;
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
