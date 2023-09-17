import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:medisys/Common/widgets/common_text.dart';
import 'package:medisys/Common/widgets/common_value.dart';
import 'package:medisys/Data/firebase/patient/patient_api.dart';
import 'package:medisys/Extention/build_context_extention.dart';

class PatientHomeScreen extends StatefulWidget {
  const PatientHomeScreen({super.key});

  @override
  State<PatientHomeScreen> createState() => _PatientHomeScreenState();
}

class _PatientHomeScreenState extends State<PatientHomeScreen> {
  late Future<List> futurePatientData;
  @override
  void initState() {
    futurePatientData = PatientApi.patientDetail(CommonValue.patientPhNum);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        FutureBuilder(
          future: futurePatientData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              CommonValue.patientKey = snapshot.data![0]['key'];
              (snapshot.data![0]['payAmount'] != null)
                  ? {
                      CommonValue.payablePatientAmount =
                          double.parse(snapshot.data![0]['payAmount']),
                      log(CommonValue.payablePatientAmount.toString()),
                    }
                  : CommonValue.payablePatientAmount = 0;

              (snapshot.data![0]['payAmount'] != null)
                  ? CommonValue.patientDisease = snapshot.data![0]['disease']
                  : CommonValue.patientDisease = ' - ';

              return Expanded(
                child: Container(
                  width: context.screenWidth * 0.9,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(),
                  ),
                  child: SingleChildScrollView(
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
                            commonText(data: "Disease", size: 17),
                            commonText(data: "Doctor Ref", size: 17),
                            commonText(data: "Hospital Ref", size: 17),
                            commonText(data: "Relative Name", size: 17),
                            commonText(data: "Relative Relation", size: 17),
                            commonText(data: "Room no", size: 17),
                            commonText(data: "Admit Date", size: 17),
                            commonText(data: "Payable Amount", size: 17),
                            commonText(data: "Ward No.", size: 17),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            commonText(
                                data: ":- ${snapshot.data![0]['name']}",
                                size: 17),
                            commonText(
                                data: ":- ${snapshot.data![0]['mobileNumber']}",
                                size: 17),
                            commonText(
                                data: ":- ${snapshot.data![0]['gender']}",
                                size: 17),
                            commonText(
                                data: ":- ${snapshot.data![0]['bloodGroup']}",
                                size: 17),
                            commonText(
                                data: ":- ${snapshot.data![0]['age']}",
                                size: 17),
                            commonText(
                                data: ":- ${CommonValue.patientDisease}",
                                size: 17),
                            commonText(
                                data: ":- D${snapshot.data![0]['doctorRef']}",
                                size: 17),
                            commonText(
                                data: ":- H${snapshot.data![0]['hospitalRef']}",
                                size: 17),
                            commonText(
                                data: ":- ${snapshot.data![0]['relativeName']}",
                                size: 17),
                            commonText(
                                data:
                                    ":- ${snapshot.data![0]['relationRelative']}",
                                size: 17),
                            commonText(
                                data: ":- ${snapshot.data![0]['roomNo']}",
                                size: 17),
                            commonText(
                                data: ":- ${snapshot.data![0]['admitDate']}",
                                size: 17),
                            commonText(
                                data: ":- ₹${CommonValue.payablePatientAmount}",
                                size: 17),
                            commonText(
                                data: ":- ${snapshot.data![0]['wardNo']}",
                                size: 17),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
        const SizedBox(
          height: 70,
        ),
      ],
    );
  }
}
