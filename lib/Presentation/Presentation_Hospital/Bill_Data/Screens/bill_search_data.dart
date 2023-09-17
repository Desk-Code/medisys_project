import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:medisys/Common/widgets/common_value.dart';
import 'package:medisys/Data/firebase/patient/patient_api.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Bill_Data/Screens/bill_update_page.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Bill_Data/Widgets/common_bill_card.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Dashboard_screen/hospital_dashboard.dart';
import 'package:medisys/Util/constraint.dart';

class BillSearchData extends StatefulWidget {
  const BillSearchData({super.key});

  @override
  State<BillSearchData> createState() => _BillSearchDataState();
}

class _BillSearchDataState extends State<BillSearchData> {
  late Future<List<Map>> futurePatientData;
  late Future<List<Map>> futureSearchData;

  @override
  void initState() {
    futurePatientData = PatientApi.fetchPatientRemainingBill();
    super.initState();
  }

  @override
  void dispose() {
    CommonValue.search = '';
    super.dispose();
  }

  final TextEditingController _txtSearchController = TextEditingController();
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
                                builder: (context) => BillUpdatePage(
                                  selectedKey: snapshot.data![index]['key'],
                                  currentAmt: snapshot.data![index]
                                      ['payAmount'],
                                ),
                              ),
                            );
                          },
                          child: commonBillCard(
                            context,
                            name: snapshot.data![index]['name'],
                            mobileNumber: snapshot.data![index]['mobileNumber'],
                            amt: snapshot.data![index]['payAmount'],
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
                                builder: (context) => BillUpdatePage(
                                  selectedKey: snapshot.data![index]['key'],
                                  currentAmt: snapshot.data![index]
                                      ['payAmount'],
                                ),
                              ),
                            );
                          },
                          child: commonBillCard(
                            context,
                            name: snapshot.data![index]['name'],
                            mobileNumber: snapshot.data![index]['mobileNumber'],
                            amt: snapshot.data![index]['payAmount'],
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
