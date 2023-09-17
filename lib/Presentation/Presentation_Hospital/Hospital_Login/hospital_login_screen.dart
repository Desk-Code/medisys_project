import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:medisys/Common/widgets/common_toast.dart';
import 'package:medisys/Common/widgets/common_value.dart';
import 'package:medisys/Data/firebase/firebase_api.dart';
import 'package:medisys/Data/firebase/firebase_api_auth.dart';
import 'package:medisys/Extention/build_context_extention.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Hospital_otp/hospital_otp_screen.dart';
import 'package:medisys/Presentation/Presentation_Hospital/hospital_Register/hospital_register_screen.dart';
import 'package:medisys/Util/constraint.dart';

class HospitalLoginScreen extends StatefulWidget {
  const HospitalLoginScreen({super.key});

  @override
  State<HospitalLoginScreen> createState() => _HospitalLoginScreenState();
}

class _HospitalLoginScreenState extends State<HospitalLoginScreen> {
  @override
  void initState() {
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
      ),
      body: SingleChildScrollView(
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
            Card(
              margin: const EdgeInsets.only(top: 10),
              elevation: 5,
              shadowColor: Colors.grey,
              child: Container(
                margin: const EdgeInsets.only(
                  top: 5,
                  right: 5,
                ),
                height: context.screenHeight * 0.28,
                width: context.screenWidth * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: ConstraintData.bgColor,
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IntlPhoneField(
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                        initialCountryCode: 'IN',
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          CommonValue.phNumberValue = value.completeNumber;
                          CommonValue.inputedNumber = value.number;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () async {
                          bool phNumberIsRegistrated =
                              await FirebaseApi.selectData(
                                  CommonValue.inputedNumber);
                          if (phNumberIsRegistrated) {
                            // ignore: use_build_context_synchronously
                            await FirebaseApiAuth.sendOtp(
                              context,
                              phNumber: CommonValue.phNumberValue,
                              toNavigate: (context) =>
                                  const HospitalOtpScreen(),
                            );
                          } else {
                            FlutterToast()
                                .showMessage("Your Data is Not Found !!!");
                          }
                          // log(FirebaseApiAuth.firebaseVerificationId);
                          // await FirebaseApiAuth.sendOtp(
                          //   context,
                          //   phNumber: CommonValue.phNumberValue,
                          //   toNavigate: (context) => const HospitalOtpScreen(),
                          // );
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
                            "GET OTP",
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
            Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ConstraintData.notHaveAccount,
                  style: GoogleFonts.lato(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HospitalRegisterScreen(),
                        ));
                  },
                  child: Text(
                    ConstraintData.register,
                    style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
