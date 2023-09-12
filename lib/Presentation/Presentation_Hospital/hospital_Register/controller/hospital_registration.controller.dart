import 'package:flutter/material.dart';

class RegController {
  static GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  static final TextEditingController _txtNameController =
      TextEditingController();
  static final TextEditingController _txtMobNController =
      TextEditingController();
  static final TextEditingController _txtEmailController =
      TextEditingController();
  static final TextEditingController _txtAddController =
      TextEditingController();
  static final TextEditingController _txtUpiController =
      TextEditingController();
  static final TextEditingController _txtPassController =
      TextEditingController();
  static final TextEditingController _txtCPassController =
      TextEditingController();

  static List<TextEditingController> get txtRegController => [
        _txtNameController,
        _txtMobNController,
        _txtEmailController,
        _txtAddController,
        _txtUpiController,
        _txtPassController,
        _txtCPassController,
      ];
}
