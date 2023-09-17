import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medisys/Common/widgets/text_form_field.dart';
import 'package:medisys/Data/firebase/doctor/doctor_api.dart';
import 'package:medisys/Data/firebase/patient/patient_api.dart';
import 'package:medisys/Extention/build_context_extention.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Patient_Data/Controller/patient_add.controller.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Patient_Data/Screens/patient_search_page.dart';
import 'package:medisys/Util/constraint.dart';

class PatientAddPage extends StatefulWidget {
  const PatientAddPage({super.key});

  @override
  State<PatientAddPage> createState() => _PatientAddPageState();
}

class _PatientAddPageState extends State<PatientAddPage> {
  late Future<List> futureDoctorData;
  String? selectedValue;
  String? doctorRef;
  @override
  void initState() {
    futureDoctorData = DoctorApi.selectDoctorName();
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
              FutureBuilder(
                future: futureDoctorData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      width: context.screenWidth * 0.94,
                      height: context.screenHeight * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(),
                      ),
                      child: DropdownButton(
                        hint: const Text("Please Select Doctor Name"),
                        value: selectedValue,
                        items: List.generate(
                            snapshot.data!.length,
                            (index) => DropdownMenuItem(
                                  onTap: () {
                                    doctorRef =
                                        snapshot.data![index]['mobileNumber'];
                                    log("$doctorRef");
                                  },
                                  value: snapshot.data![index]['fullName'],
                                  child: Text(
                                    snapshot.data![index]['fullName'],
                                  ),
                                )),
                        onChanged: (value) {
                          selectedValue = value!.toString();
                          setState(() {});
                        },
                      ),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
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
                    await PatientApi.setPatientData(
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
                            doctorName: doctorRef!,
                            relativeName: PatientAddController
                                .txtPatientAddController[5].text,
                            relationRelative: PatientAddController
                                .txtPatientAddController[6].text,
                            roomNo: PatientAddController
                                .txtPatientAddController[7].text,
                            wardNo: PatientAddController
                                .txtPatientAddController[8].text)
                        .then((value) =>
                            PatientAddController.txtPatientAddClearController)
                        .then((value) => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PatientSearchPage(),
                            )));
                  }
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
