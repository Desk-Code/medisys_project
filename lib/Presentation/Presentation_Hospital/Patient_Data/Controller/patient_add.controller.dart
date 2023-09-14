import 'package:flutter/material.dart';

class PatientAddController {
  static GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  static final TextEditingController _txtNameController =
      TextEditingController();
  static final TextEditingController _txtMobNumController =
      TextEditingController();
  static final TextEditingController _txtGenderController =
      TextEditingController();
  static final TextEditingController _txtBloodController =
      TextEditingController();
  static final TextEditingController _txtAgeController =
      TextEditingController();
  static final TextEditingController _txtRelNameController =
      TextEditingController();
  static final TextEditingController _txtRelativeRelationController =
      TextEditingController();
  static final TextEditingController _txtRoomNoController =
      TextEditingController();
  static final TextEditingController _txtAdmitDateController =
      TextEditingController();
  static final TextEditingController _txtWordNumberController =
      TextEditingController();

  static List<TextEditingController> get txtPatientAddController => [
        _txtNameController,
        _txtMobNumController,
        _txtGenderController,
        _txtBloodController,
        _txtAgeController,
        _txtRelNameController,
        _txtRelativeRelationController,
        _txtRoomNoController,
        _txtAdmitDateController,
        _txtWordNumberController,
      ];

  static get txtPatientAddClearController => [
        _txtNameController.clear(),
        _txtMobNumController.clear(),
        _txtGenderController.clear(),
        _txtBloodController.clear(),
        _txtAgeController.clear(),
        _txtRelNameController.clear(),
        _txtRelativeRelationController.clear(),
        _txtRoomNoController.clear(),
        _txtAdmitDateController.clear(),
        _txtWordNumberController.clear(),
      ];
}
