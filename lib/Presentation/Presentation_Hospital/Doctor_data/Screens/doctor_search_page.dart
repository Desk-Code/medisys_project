import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:medisys/Common/widgets/common_value.dart';
import 'package:medisys/Data/firebase/doctor/doctor_api.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Dashboard_screen/hospital_dashboard.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Doctor_data/Screens/doctor_add_page.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Doctor_data/Screens/doctor_profile_page.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Doctor_data/Widgets/common_doctor_card.dart';
import 'package:medisys/Util/constraint.dart';

class DoctorSearchPage extends StatefulWidget {
  const DoctorSearchPage({super.key});

  @override
  State<DoctorSearchPage> createState() => _DoctorSearchPageState();
}

class _DoctorSearchPageState extends State<DoctorSearchPage> {
  late Future<List<Map>> futureDoctorData;
  final TextEditingController _txtSearchController = TextEditingController();
  @override
  void initState() {
    futureDoctorData = DoctorApi.selectDoctorData();
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
              builder: (context) => const DoctorAddPage(),
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
            future: futureDoctorData,
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
                                builder: (context) => DoctorProfilePage(
                                  fullName: snapshot.data![index]['fullName'],
                                  aadharCard: snapshot.data![index]
                                      ['aadharNumber'],
                                  age: snapshot.data![index]['age'],
                                  address: snapshot.data![index]['address'],
                                  email: snapshot.data![index]['email'],
                                  gender: snapshot.data![index]['gender'],
                                  mobileNumber: snapshot.data![index]
                                      ['mobileNumber'],
                                  qualification: snapshot.data![index]
                                      ['qualification'],
                                  specialist: snapshot.data![index]
                                      ['specialist'],
                                  selectedKey: snapshot.data![index]['key'],
                                ),
                              ),
                            );
                          },
                          child: commonDoctorCard(
                            context,
                            key: snapshot.data![index]['key'],
                            mobNum: snapshot.data![index]['mobileNumber'],
                            name: snapshot.data![index]['fullName'],
                          ),
                        );
                      } else if (snapshot.data![index]['fullName']
                          .toString()
                          .toLowerCase()
                          .contains(CommonValue.search.toLowerCase())) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DoctorProfilePage(
                                  fullName: snapshot.data![index]['fullName'],
                                  aadharCard: snapshot.data![index]
                                      ['aadharNumber'],
                                  age: snapshot.data![index]['age'],
                                  address: snapshot.data![index]['address'],
                                  email: snapshot.data![index]['email'],
                                  gender: snapshot.data![index]['gender'],
                                  mobileNumber: snapshot.data![index]
                                      ['mobileNumber'],
                                  qualification: snapshot.data![index]
                                      ['qualification'],
                                  specialist: snapshot.data![index]
                                      ['specialist'],
                                  selectedKey: snapshot.data![index]['key'],
                                ),
                              ),
                            );
                          },
                          child: commonDoctorCard(
                            context,
                            key: snapshot.data![index]['key'],
                            mobNum: snapshot.data![index]['mobileNumber'],
                            name: snapshot.data![index]['fullName'],
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

          // Expanded(
          //   child: ListView.builder(
          //     itemCount: 15,
          //     itemBuilder: (context, index) => GestureDetector(
          //       onTap: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => const DoctorProfilePage(),
          //           ),
          //         );
          //       },
          //       child: commonDoctorCard(
          //         context,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
