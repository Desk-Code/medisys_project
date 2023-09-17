import 'package:flutter/material.dart';
import 'package:medisys/Common/widgets/common_value.dart';

Widget textSearchFeild({required TextEditingController controller}) => Padding(
      padding: const EdgeInsets.all(11.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          prefixIcon: const Icon(Icons.search),
        ),
        onChanged: (value) {   
          CommonValue.search = value;
        },
      ),
    );
