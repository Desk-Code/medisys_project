import 'package:flutter/material.dart';
import 'package:medisys/Util/constraint.dart';

Widget staffFiltering(
  BuildContext context, {
  required String staffSection,
}) =>
    AnimatedContainer(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      duration: const Duration(
        seconds: 10,
      ),
      decoration: const BoxDecoration(
          color: ConstraintData.bgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      curve: Curves.fastOutSlowIn,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Sort Staff($staffSection) by"),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Name",
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Mobile Number",
            ),
          ),
        ],
      ),
    );
