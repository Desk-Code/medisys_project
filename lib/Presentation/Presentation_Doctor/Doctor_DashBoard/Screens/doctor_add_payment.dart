import 'package:flutter/material.dart';
import 'package:medisys/Common/widgets/text_form_field.dart';
import 'package:medisys/Data/firebase/patient/patient_api.dart';
import 'package:medisys/Extention/build_context_extention.dart';
import 'package:medisys/Util/constraint.dart';

class DoctorAddPayment extends StatefulWidget {
  const DoctorAddPayment({super.key, required this.selectedKey});
  final String selectedKey;

  @override
  State<DoctorAddPayment> createState() => _DoctorAddPaymentState();
}

class _DoctorAddPaymentState extends State<DoctorAddPayment> {
  final TextEditingController _txtDiseaseController = TextEditingController();
  final TextEditingController _txtPaymentController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ConstraintData.bgColor,
      ),
      backgroundColor: ConstraintData.bgColor,
      body: SingleChildScrollView(
        child: Form(
          key: globalKey,
          child: Column(
            children: [
              commonTextFormField(
                icon: Icons.medication_liquid_outlined,
                nameOfField: "Disease",
                textEditingController: _txtDiseaseController,
              ),
              commonTextFormField(
                icon: Icons.payment,
                nameOfField: "Pay Amount",
                textEditingController: _txtPaymentController,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                    Size(
                      context.screenWidth * 0.9,
                      context.screenHeight * 0.06,
                    ),
                  ),
                ),
                onPressed: () async {
                  if (globalKey.currentState!.validate()) {
                    await PatientApi.updateBillAndDisease(
                            key: widget.selectedKey,
                            disease: _txtDiseaseController.text,
                            payAmount: _txtPaymentController.text)
                        .then((value) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    });
                  }
                },
                child: const Text("Update"),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
