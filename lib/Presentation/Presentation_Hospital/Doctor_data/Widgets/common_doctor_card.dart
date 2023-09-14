import 'package:flutter/material.dart';
import 'package:medisys/Extention/build_context_extention.dart';

Widget commonDoctorCard(
  BuildContext context,
) =>
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
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.person_pin_circle_outlined),
                    Text("Doctor key"),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Doctor Name    : Doctor Name"),
            const Text("Doctor Mobile  : Doctor Mobile"),
          ],
        ),
      ),
    );
