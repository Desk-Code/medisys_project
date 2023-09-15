import 'package:flutter/material.dart';
import 'package:medisys/Extention/build_context_extention.dart';

Widget commonStaffCard(
  BuildContext context, {
  required String staffSection,
  required String staffSectionkey,
  required String staffName,
  required String staffMobile,
}) =>
    Card(
      margin: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.04,
        vertical: context.screenWidth * 0.02,
      ),
      elevation: 5,
      child: Container(
        height: context.screenHeight * 0.15,
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
                    const Icon(Icons.person_pin_circle_outlined),
                    Text(staffSectionkey),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text("$staffSection Name    : $staffName"),
            Text("$staffSection Mobile  : $staffMobile"),
          ],
        ),
      ),
    );
