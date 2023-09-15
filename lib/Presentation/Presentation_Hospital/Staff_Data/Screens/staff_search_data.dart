import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medisys/Common/widgets/text_search_field.dart';
import 'package:medisys/Data/firebase/staff/staff_api.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Staff_Data/Controller/staff_dash_controller.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Staff_Data/Screens/staff_add_data_screen.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Staff_Data/Screens/staff_profile_page.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Staff_Data/Widgets/common_staff_card.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Staff_Data/Widgets/staff_filtering.dart';
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
  @override
  void initState() {
    staffSection = widget.selectedStaff;
    futureStaffData = StaffApi.selectStaffData(staffSection);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstraintData.bgColor,
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
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                enableDrag: true,
                builder: (context) => staffFiltering(
                  context,
                  staffSection: staffSection,
                ),
              );
            },
            icon: const Icon(Icons.content_paste_search_rounded),
          ),
        ],
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
          textSearchFeild(
            controller: StaffDashController.txtSearchController,
          ),
          FutureBuilder(
            future: futureStaffData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => GestureDetector(
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
                    ),
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
          //             builder: (context) => const StaffProfilePage(),
          //           ),
          //         );
          //       },
          //       child: commonStaffCard(
          //         context,
          //         staffSection: staffSection,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
