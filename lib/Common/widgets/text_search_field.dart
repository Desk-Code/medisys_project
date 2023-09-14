import 'package:flutter/material.dart';

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
      ),
    );
