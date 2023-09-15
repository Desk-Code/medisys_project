import 'package:flutter/material.dart';
import 'package:medisys/Extention/build_context_extention.dart';

Widget commonBillCard(
  BuildContext context, {
  bool paymentIsDone = false,
}) =>
    Card(
      margin: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.04,
        vertical: context.screenWidth * 0.02,
      ),
      elevation: 5,
      child: Container(
        height: context.screenHeight * 0.16,
        width: context.screenWidth * 0.9,
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.cyan[100],
                  radius: 25,
                  child: const Icon(
                    Icons.person,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.currency_rupee_sharp),
                    const Text("₹ 0"),
                    Text((paymentIsDone) ? "Completed" : "UnCompleted"),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            const Text("Patient Name    : Patient Name"),
            const Text("Patient Mobile  : Patient Mobile"),
          ],
        ),
      ),
    );
