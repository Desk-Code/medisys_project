import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medisys/Common/widgets/text_search_field.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Patient_Data/Screens/patient_add_page.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Patient_Data/Screens/patient_profile_page.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Patient_Data/Widget/common_patient_card.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Patient_Data/Widget/patient_filtering.dart';
import 'package:medisys/Util/constraint.dart';

class PatientSearchPage extends StatefulWidget {
  const PatientSearchPage({super.key});

  @override
  State<PatientSearchPage> createState() => _PatientSearchPageState();
}

class _PatientSearchPageState extends State<PatientSearchPage> {
  final TextEditingController _txtSearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstraintData.bgColor,
      appBar: AppBar(
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
                builder: (context) => patientFiltering(context),
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
              builder: (context) => const PatientAddPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          textSearchFeild(
            controller: _txtSearchController,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PatientProfilePage(),
                    ),
                  );
                },
                child: commonPatientCard(
                  context,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
