import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Doctor_data/Screens/doctor_add_page.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Doctor_data/Screens/doctor_profile_page.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Doctor_data/Widgets/common_doctor_card.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Doctor_data/Widgets/doctor_filtering.dart';
import 'package:medisys/Common/widgets/text_search_field.dart';
import 'package:medisys/Util/constraint.dart';

class DoctorSearchPage extends StatefulWidget {
  const DoctorSearchPage({super.key});

  @override
  State<DoctorSearchPage> createState() => _DoctorSearchPageState();
}

class _DoctorSearchPageState extends State<DoctorSearchPage> {
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
                builder: (context) => docorFiltering(context),
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
              builder: (context) => const DoctorAddPage(),
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
                      builder: (context) => const DoctorProfilePage(),
                    ),
                  );
                },
                child: commonDoctorCard(
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
