import 'package:flutter/material.dart';

class StaffDashController {
static GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  static List<String> staffField = [
    "Nursing",
    "Ward Boy",
    "Reception",
    "Cleanner Staff",
    "Medical",
    "Lab",
    "RMO",
    "OT Staff",
    "Assistant Dr.",
  ];

  static List<String> assetUrl = [
    "assets/images/nurshing.jpg",
    "assets/images/wardboy.jpg",
    "assets/images/reception.jpg",
    "assets/images/cleaning.jpg",
    "assets/images/medical.jpg",
    "assets/images/lab.jpg",
    "assets/images/rmo.jpg",
    "assets/images/otstaff.jpg",
    "assets/images/assistant.jpg",
  ];

  static final TextEditingController _txtSerController =
      TextEditingController();
  static TextEditingController get txtSearchController => _txtSerController;

  static final TextEditingController _txtFullNameController =
      TextEditingController();
  static final TextEditingController _txtMobNumController =
      TextEditingController();
  static final TextEditingController _txtGenderController =
      TextEditingController();
  static final TextEditingController _txtAgeController =
      TextEditingController();
  static final TextEditingController _txtAadharNumController =
      TextEditingController();
  static final TextEditingController _txtAddressController =
      TextEditingController();

  static List<TextEditingController> get txtStaffController => [
        _txtFullNameController,
        _txtMobNumController,
        _txtGenderController,
        _txtAgeController,
        _txtAadharNumController,
        _txtAddressController,
      ];

  static get txtStaffClearController => [
        _txtFullNameController.clear(),
        _txtMobNumController.clear(),
        _txtGenderController.clear(),
        _txtAgeController.clear(),
        _txtAadharNumController.clear(),
        _txtAddressController.clear(),
      ];
}
