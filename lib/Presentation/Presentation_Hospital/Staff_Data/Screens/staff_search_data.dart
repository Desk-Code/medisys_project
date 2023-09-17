import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:medisys/Common/widgets/common_value.dart';
import 'package:medisys/Data/firebase/staff/staff_api.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Dashboard_screen/hospital_dashboard.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Staff_Data/Controller/staff_dash_controller.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Staff_Data/Screens/staff_add_data_screen.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Staff_Data/Screens/staff_profile_page.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Staff_Data/Widgets/common_staff_card.dart';
import 'package:medisys/Util/constraint.dart';

class StaffSearchPage extends StatefulWidget {
  const StaffSearchPage({super.key, required this.selectedStaff});
  final String selectedStaff;

  @override
  State<StaffSearchPage> createState() => _StaffSearchPageState();
}

class _StaffSearchPageState extends State<StaffSearchPage> {
  late Future<List<Map>> futureStaffData;
  late String staffSection;
  int? searchTileCount;
  @override
  void initState() {
    staffSection = widget.selectedStaff;
    futureStaffData = StaffApi.selectStaffData(staffSection);
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
        backgroundColor: ConstraintData.bgAppBarColor,
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
              builder: (context) =>
                  StaffAddDataScreen(staffSection: staffSection),
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
              controller: StaffDashController.txtSearchController,
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
            future: futureStaffData,
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
                                builder: (context) => StaffProfilePage(
                                  selectedKey: snapshot.data![index]['key'],
                                  fullName: snapshot.data![index]['fullName'],
                                  mobileNumber: snapshot.data![index]
                                      ['mobileNumber'],
                                  gender: snapshot.data![index]['gender'],
                                  aadharNumber: snapshot.data![index]
                                      ['aadharNumber'],
                                  address: snapshot.data![index]['address'],
                                  age: snapshot.data![index]['age'],
                                  staffSection: snapshot.data![index]
                                      ['staffSection'],
                                ),
                              ),
                            );
                          },
                          child: commonStaffCard(
                            context,
                            staffSection: staffSection,
                            staffSectionkey: snapshot.data![index]['key'],
                            staffName: snapshot.data![index]['fullName'],
                            staffMobile: snapshot.data![index]['mobileNumber'],
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
                                builder: (context) => StaffProfilePage(
                                  selectedKey: snapshot.data![index]['key'],
                                  fullName: snapshot.data![index]['fullName'],
                                  mobileNumber: snapshot.data![index]
                                      ['mobileNumber'],
                                  gender: snapshot.data![index]['gender'],
                                  aadharNumber: snapshot.data![index]
                                      ['aadharNumber'],
                                  address: snapshot.data![index]['address'],
                                  age: snapshot.data![index]['age'],
                                  staffSection: snapshot.data![index]
                                      ['staffSection'],
                                ),
                              ),
                            );
                          },
                          child: commonStaffCard(
                            context,
                            staffSection: staffSection,
                            staffSectionkey: snapshot.data![index]['key'],
                            staffName: snapshot.data![index]['fullName'],
                            staffMobile: snapshot.data![index]['mobileNumber'],
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
      ),
    );
  }
}
