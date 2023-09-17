import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:medisys/Common/widgets/common_value.dart';
import 'package:medisys/Data/firebase/patient/patient_api.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Dashboard_screen/hospital_dashboard.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Patient_Data/Screens/patient_add_page.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Patient_Data/Screens/patient_profile_page.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Patient_Data/Widget/common_patient_card.dart';
import 'package:medisys/Util/constraint.dart';

class PatientSearchPage extends StatefulWidget {
  const PatientSearchPage({super.key});

  @override
  State<PatientSearchPage> createState() => _PatientSearchPageState();
}

class _PatientSearchPageState extends State<PatientSearchPage> {
  late Future<List<Map>> futurePatientData;
  final TextEditingController _txtSearchController = TextEditingController();
  @override
  void initState() {
    futurePatientData = PatientApi.selectPatientData();
    super.initState();
  }

  @override
  void dispose() {
    CommonValue.search = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstraintData.bgColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HospitalDashBoard(),
                ),
                (route) => false);
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PatientAddPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
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
                                  builder: (context) => PatientProfilePage(
                                      selectedKey: snapshot.data![index]['key'],
                                      patientName: snapshot.data![index]
                                          ['name'],
                                      mobileNumber: snapshot.data![index]
                                          ['mobileNumber'],
                                      gender: snapshot.data![index]['gender'],
                                      bloodGroup: snapshot.data![index]
                                          ['bloodGroup'],
                                      age: snapshot.data![index]['age'],
                                      doctorName: snapshot.data![index]
                                          ['doctorRef'],
                                      relativeName: snapshot.data![index]
                                          ['relativeName'],
                                      relativeRelation: snapshot.data![index]
                                          ['relationRelative'],
                                      roomNo: snapshot.data![index]['roomNo'],
                                      admitDate: snapshot.data![index]
                                          ['admitDate'],
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
                                  builder: (context) => PatientProfilePage(
                                      selectedKey: snapshot.data![index]['key'],
                                      patientName: snapshot.data![index]
                                          ['name'],
                                      mobileNumber: snapshot.data![index]
                                          ['mobileNumber'],
                                      gender: snapshot.data![index]['gender'],
                                      bloodGroup: snapshot.data![index]
                                          ['bloodGroup'],
                                      age: snapshot.data![index]['age'],
                                      doctorName: snapshot.data![index]
                                          ['doctorRef'],
                                      relativeName: snapshot.data![index]
                                          ['relativeName'],
                                      relativeRelation: snapshot.data![index]
                                          ['relationRelative'],
                                      roomNo: snapshot.data![index]['roomNo'],
                                      admitDate: snapshot.data![index]
                                          ['admitDate'],
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
                        return SingleChildScrollView(
                            padding: const EdgeInsets.only(top: 70),
                            child:
                                Lottie.asset('assets/animation/no_data.json'));
                      }
                    },
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
