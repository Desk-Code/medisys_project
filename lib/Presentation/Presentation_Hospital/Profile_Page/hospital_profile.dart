import 'package:flutter/material.dart';
import 'package:medisys/Common/widgets/common_text.dart';
import 'package:medisys/Common/widgets/common_value.dart';
import 'package:medisys/Data/firebase/firebase_api.dart';
import 'package:medisys/Extention/build_context_extention.dart';

class HospProfilePage extends StatefulWidget {
  const HospProfilePage({super.key});

  @override
  State<HospProfilePage> createState() => _HospProfilePageState();
}

class _HospProfilePageState extends State<HospProfilePage> {
  late Future<bool> futureProfileData;
  @override
  void initState() {
    futureProfileData = FirebaseApi.selectData(CommonValue.inputedNumber);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: context.screenHeight * 0.21,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/logo.png"),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: Container(
              width: context.screenWidth * 0.9,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonText(data: "Hospital Name", size: 17),
                        commonText(data: "Mobile No", size: 17),
                        commonText(data: "Email", size: 17),
                        commonText(data: "Address", size: 17),
                        commonText(data: "Upi Id", size: 17),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonText(
                            data: ":- ${FirebaseApi.loginUser['hospName']}",
                            size: 17),
                        commonText(
                            data: ":- ${FirebaseApi.loginUser['mobNum']}",
                            size: 17),
                        commonText(
                            data: ":- ${FirebaseApi.loginUser['email']}",
                            size: 17),
                        commonText(
                            data: ":- ${FirebaseApi.loginUser['address']}",
                            size: 17),
                        commonText(
                            data: ":- ${FirebaseApi.loginUser['upiId']}",
                            size: 17),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }
}
