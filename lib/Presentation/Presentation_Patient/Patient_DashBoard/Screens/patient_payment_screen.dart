import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medisys/Common/widgets/common_text.dart';
import 'package:medisys/Common/widgets/common_toast.dart';
import 'package:medisys/Common/widgets/common_value.dart';
import 'package:medisys/Data/firebase/patient/patient_api.dart';
import 'package:medisys/Extention/build_context_extention.dart';
import 'package:medisys/Util/constraint.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PatientPaymentScreen extends StatefulWidget {
  const PatientPaymentScreen({super.key});

  @override
  State<PatientPaymentScreen> createState() => _PatientPaymentScreenState();
}

class _PatientPaymentScreenState extends State<PatientPaymentScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final Razorpay _razorPay = Razorpay();

  var options = {
    'key': 'rzp_test_yNCgfS03jZXBVM',
    'amount': 100,
    'name': 'Acme Corp.',
    'description': 'Demo',
    'prefill': {
      'contact': '9313403837',
      'email': 'test@razorpay.com',
    },
  };
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              data: "Make Payment With Easy Way",
              size: 19,
            ),
            commonText(
              data: "your Payment On Way...",
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
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: "Enter Amout to you have Pay"),
                        ]),
                        keyboardType: TextInputType.number,
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
                        onTap: () {
                          if (_globalKey.currentState!.validate()) {
                            _razorPay.open(options);
                            _razorPay.on(
                                Razorpay.EVENT_PAYMENT_SUCCESS, paymentSuccess);
                            _razorPay.on(
                                Razorpay.EVENT_PAYMENT_ERROR, paymentFailure);
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
                            "Make Payment",
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
    );
  }

  void paymentSuccess(PaymentSuccessResponse paymentSuccessResponse) async {
    CommonValue.payablePatientAmount -=
        double.parse(_textEditingController.text);
    await PatientApi.billPayment(
      key: CommonValue.patientKey,
      payAmount: CommonValue.payablePatientAmount.toString(),
    );
    _textEditingController.clear();
    FlutterToast().showMessage("${paymentSuccessResponse.paymentId}");
  }

  void paymentFailure(PaymentFailureResponse paymentFailureResponse) {
    FlutterToast().showMessage("${paymentFailureResponse.message}");
  }
}
