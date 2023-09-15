import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medisys/Common/widgets/text_search_field.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Bill_Data/Screens/bill_update_page.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Bill_Data/Widgets/bill_filtering.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Bill_Data/Widgets/common_bill_card.dart';
import 'package:medisys/Util/constraint.dart';

class BillSearchData extends StatefulWidget {
  const BillSearchData({super.key});

  @override
  State<BillSearchData> createState() => _BillSearchDataState();
}

class _BillSearchDataState extends State<BillSearchData> {
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
                builder: (context) => billFiltering(context),
              );
            },
            icon: const Icon(Icons.content_paste_search_rounded),
          ),
        ],
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
                      builder: (context) => const BillUpdatePage(),
                    ),
                  );
                },
                child: commonBillCard(
                  context,
                  paymentIsDone: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
