import 'package:flutter/material.dart';
import 'package:medisys/Common/widgets/common_text.dart';
import 'package:medisys/Extention/build_context_extention.dart';

Widget commonStaffDash(
  BuildContext context, {
  required String data,
  required String assetUrl,
  required Function()? onTap,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: context.screenHeight * 0.19,
            width: context.screenWidth * 0.45,
            child: Card(
              elevation: 9,
              child: Image(
                image: AssetImage(assetUrl),
                fit: BoxFit.fill,
              ),
            ),
          ),
          commonText(
            data: data,
            size: 20,
          ),
        ],
      ),
    );
