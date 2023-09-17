import 'package:flutter/material.dart';
import 'package:medisys/Common/widgets/common_text.dart';
import 'package:medisys/Common/widgets/common_value.dart';
import 'package:medisys/Data/firebase/doctor/doctor_api.dart';
import 'package:medisys/Extention/build_context_extention.dart';

class DoctorHome extends StatefulWidget {
  const DoctorHome({super.key});

  @override
  State<DoctorHome> createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
  late Future<List> futureDoctorData;
  @override
  void initState() {
    futureDoctorData = DoctorApi.doctorDetail(CommonValue.doctorPhNum);
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
          future: futureDoctorData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Expanded(
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
                          commonText(data: "Doctor Name", size: 17),
                          commonText(data: "Mobile No", size: 17),
                          commonText(data: "Email", size: 17),
                          commonText(data: "Gender", size: 17),
                          commonText(data: "Age", size: 17),
                          commonText(data: "Aadhar Number", size: 17),
                          commonText(data: "Address", size: 17),
                          commonText(data: "Specialist", size: 17),
                          commonText(data: "Qualification", size: 17),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          commonText(
                              data: ":- ${snapshot.data![0]['fullName']}",
                              size: 17),
                          commonText(
                              data: ":- ${snapshot.data![0]['mobileNumber']}",
                              size: 17),
                          commonText(
                              data: ":- ${snapshot.data![0]['email']}",
                              size: 17),
                          commonText(
                              data: ":- ${snapshot.data![0]['gender']}",
                              size: 17),
                          commonText(
                              data: ":- ${snapshot.data![0]['age']}", size: 17),
                          commonText(
                              data: ":- ${snapshot.data![0]['aadharNumber']}",
                              size: 17),
                          commonText(
                              data: ":- ${snapshot.data![0]['address']}",
                              size: 17),
                          commonText(
                              data: ":- ${snapshot.data![0]['specialist']}",
                              size: 17),
                          commonText(
                              data: ":- ${snapshot.data![0]['qualification']}",
                              size: 17),
                        ],
                      ),
                    ],
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
