import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medisys/Data/firebase/firebase_api.dart';
import 'package:medisys/Extention/build_context_extention.dart';
import 'package:medisys/Presentation/Presentation_Hospital/hospital_Register/controller/hospital_registration.controller.dart';
import 'package:medisys/Common/widgets/text_form_field.dart';
import 'package:medisys/Util/constraint.dart';

class HospitalRegisterScreen extends StatefulWidget {
  const HospitalRegisterScreen({super.key});

  @override
  State<HospitalRegisterScreen> createState() => _HospitalRegisterScreenState();
}

class _HospitalRegisterScreenState extends State<HospitalRegisterScreen> {
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
        child: Form(
          key: RegController.globalKey,
          child: Column(
            children: [
              Container(
                height: context.screenHeight * 0.35,
                width: context.screenWidth * 0.9,
                margin:
                    EdgeInsets.symmetric(horizontal: context.screenWidth * 0.1),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/hospitalregister.jpeg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              commonTextFormField(
                icon: Icons.person,
                nameOfField: "Hospital Name",
                textEditingController: RegController.txtRegController[0],
              ),
              commonTextFormField(
                icon: Icons.phone_android,
                nameOfField: "Mobile No.",
                textEditingController: RegController.txtRegController[1],
              ),
              commonTextFormField(
                icon: Icons.email,
                nameOfField: "Email",
                textEditingController: RegController.txtRegController[2],
              ),
              commonTextFormField(
                icon: Icons.home,
                nameOfField: "Address..",
                textEditingController: RegController.txtRegController[3],
              ),
              commonTextFormField(
                icon: Icons.wallet,
                nameOfField: "Upi ID",
                textEditingController: RegController.txtRegController[4],
              ),
              commonTextFormField(
                icon: Icons.lock,
                nameOfField: "Password",
                textEditingController: RegController.txtRegController[5],
                obscureText: true,
              ),
              commonTextFormField(
                icon: Icons.lock,
                nameOfField: "Conform Password",
                textEditingController: RegController.txtRegController[6],
                obscureText: true,
              ),
              GestureDetector(
                onTap: () async {
                  await FirebaseApi.setUserData(
                    hospName: RegController.txtRegController[0].text,
                    mobNum: RegController.txtRegController[1].text,
                    email: RegController.txtRegController[2].text,
                    address: RegController.txtRegController[3].text,
                    upiId: RegController.txtRegController[4].text,
                    pass: RegController.txtRegController[5].text,
                  ).then((value) {
                    RegController.txtRegControllerClear;
                    Navigator.pop(context);
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 15,
                    top: 5,
                  ),
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
                    "Register",
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
    );
  }
}
