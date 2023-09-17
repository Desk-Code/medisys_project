import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medisys/Common/widgets/common_value.dart';
import 'package:medisys/Data/firebase/patient/patient_api.dart';
import 'package:medisys/Presentation/Presentation_Doctor/Doctor_DashBoard/Screens/doctor_patient_screen.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Patient_Data/Widget/common_patient_card.dart';

class DoctorDashboard extends StatefulWidget {
  const DoctorDashboard({super.key});

  @override
  State<DoctorDashboard> createState() => _DoctorDashboardState();
}

class _DoctorDashboardState extends State<DoctorDashboard> {
  late Future<List<Map>> futurePatientData;
  final TextEditingController _txtSearchController = TextEditingController();
  @override
  void initState() {
    futurePatientData = PatientApi.fetchPatientData(CommonValue.doctorPhNum);
    super.initState();
  }

  @override
  void dispose() {
    CommonValue.search = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: TextField(
            controller: _txtSearchController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              prefixIcon: const Icon(Icons.search),
            ),
            onChanged: (value) {
              CommonValue.search = value;
              setState(() {});
            },
          ),
        ),
        FutureBuilder(
          future: futurePatientData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    if (CommonValue.search.isEmpty) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DoctorPatientScreen(
                                    selectedKey: snapshot.data![index]['key'],
                                    patientName: snapshot.data![index]['name'],
                                    mobileNum: snapshot.data![index]
                                        ['mobileNumber'],
                                    gender: snapshot.data![index]['gender'],
                                    bloddGroup: snapshot.data![index]
                                        ['bloodGroup'],
                                    age: snapshot.data![index]['age'],
                                    relativeName: snapshot.data![index]
                                        ['relativeName'],
                                    relativeRelation: snapshot.data![index]
                                        ['relationRelative'],
                                    admitDate: snapshot.data![index]
                                        ['admitDate'],
                                    roomNo: snapshot.data![index]['roomNo'],
                                    wardNo: snapshot.data![index]['wardNo']),
                              ));
                        },
                        child: commonPatientCard(
                          context,
                          key: snapshot.data![index]['key'],
                          name: snapshot.data![index]['name'],
                          mobileNum: snapshot.data![index]['mobileNumber'],
                        ),
                      );
                    } else if (snapshot.data![index]['name']
                        .toString()
                        .toLowerCase()
                        .contains(CommonValue.search.toLowerCase())) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DoctorPatientScreen(
                                    selectedKey: snapshot.data![index]['key'],
                                    patientName: snapshot.data![index]['name'],
                                    mobileNum: snapshot.data![index]
                                        ['mobileNumber'],
                                    gender: snapshot.data![index]['gender'],
                                    bloddGroup: snapshot.data![index]
                                        ['bloodGroup'],
                                    age: snapshot.data![index]['age'],
                                    relativeName: snapshot.data![index]
                                        ['relativeName'],
                                    relativeRelation: snapshot.data![index]
                                        ['relationRelative'],
                                    admitDate: snapshot.data![index]
                                        ['admitDate'],
                                    roomNo: snapshot.data![index]['roomNo'],
                                    wardNo: snapshot.data![index]['wardNo']),
                              ));
                        },
                        child: commonPatientCard(
                          context,
                          key: snapshot.data![index]['key'],
                          name: snapshot.data![index]['name'],
                          mobileNum: snapshot.data![index]['mobileNumber'],
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              );
            } else {
              return Lottie.asset('assets/animation/no_data.json');
            }
          },
        ),
      ],
    );
  }
}
