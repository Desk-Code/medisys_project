import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

Widget commonTextFormField({
  required IconData icon,
  required String nameOfField,
  required TextEditingController textEditingController,
  bool obscureText = false,
}) =>
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: textEditingController,
        validator: MultiValidator([
          RequiredValidator(errorText: 'This field is required'),
        ]),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          hintText: nameOfField,
          prefixIcon: Icon(icon),
        ),
        obscureText: obscureText,
      ),
    );
