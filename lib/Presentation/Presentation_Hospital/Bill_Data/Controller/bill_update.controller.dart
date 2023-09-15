import 'package:flutter/material.dart';

class BillUpdateController {
  static GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  static final TextEditingController _txtNameController =
      TextEditingController();
  static final TextEditingController _txtAmtController =
      TextEditingController();
  static TextEditingController get txtNameCon => _txtNameController;
  static TextEditingController get txtAmountCon => _txtAmtController;
}
