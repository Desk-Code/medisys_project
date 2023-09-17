import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medisys/Common/widgets/common_text.dart';
import 'package:medisys/Common/widgets/common_toast.dart';
import 'package:medisys/Data/firebase/patient/patient_api.dart';
import 'package:medisys/Extention/build_context_extention.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Bill_Data/Screens/bill_search_data.dart';
import 'package:medisys/Util/constraint.dart';

class BillUpdatePage extends StatefulWidget {
  const BillUpdatePage(
      {super.key, required this.selectedKey, required this.currentAmt});
  final String selectedKey;
  final String currentAmt;

  @override
  State<BillUpdatePage> createState() => _BillUpdatePageState();
}

class _BillUpdatePageState extends State<BillUpdatePage> {
  final TextEditingController _textEditingController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  void initState() {
    _textEditingController.text = widget.currentAmt;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstraintData.bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ConstraintData.bgColor,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _globalKey,
          child: Column(
            children: [
              Container(
                height: context.screenHeight * 0.35,
                width: context.screenWidth * 0.8,
                margin: EdgeInsets.only(
                  right: context.screenWidth * 0.1,
                  left: context.screenWidth * 0.1,
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/intro_doctor.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              commonText(
                data: "Update a payment with easy way",
                size: 19,
              ),
              commonText(
                data: "Patient Payment Update...",
                size: 16,
              ),
              Card(
                margin: const EdgeInsets.only(top: 10),
                elevation: 5,
                shadowColor: Colors.grey,
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 5,
                    right: 5,
                  ),
                  height: context.screenHeight * 0.20,
                  width: context.screenWidth * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: ConstraintData.bgColor,
                  ),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: _textEditingController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.currency_rupee),
                            hintText: "Enter Amount",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (_globalKey.currentState!.validate()) {
                              double amt =
                                  double.parse(_textEditingController.text);
                              await PatientApi.billPayment(
                                key: widget.selectedKey,
                                payAmount: amt.toString(),
                              ).then((value) => {
                                    _textEditingController.clear(),
                                    FlutterToast()
                                        .showMessage("Update Completed"),
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const BillSearchData(),
                                        )),
                                  });
                            }
                          },
                          child: Container(
                            height: context.screenHeight * 0.06,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Update Payment",
                              style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
