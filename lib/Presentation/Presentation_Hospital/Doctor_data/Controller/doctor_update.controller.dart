import 'package:flutter/material.dart';

class DoctorUpdateController {
  static GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  static final TextEditingController _txtFullNameController =
      TextEditingController();
  static final TextEditingController _txtMobNumController =
      TextEditingController();
  static final TextEditingController _txtEmailController =
      TextEditingController();
  static final TextEditingController _txtGenderController =
      TextEditingController();
  static final TextEditingController _txtAgeController =
      TextEditingController();
  static final TextEditingController _txtAadharNumController =
      TextEditingController();
  static final TextEditingController _txtAddController =
      TextEditingController();
  static final TextEditingController _txtSpecialistController =
      TextEditingController();
  static final TextEditingController _txtQualificationController =
      TextEditingController();

  static List<TextEditingController> get txtDrUpdateController => [
        _txtFullNameController,
        _txtMobNumController,
        _txtEmailController,
        _txtGenderController,
        _txtAgeController,
        _txtAadharNumController,
        _txtAddController,
        _txtSpecialistController,
        _txtQualificationController,
      ];

  static get txtDrUpdateClearController => [
        _txtFullNameController.clear(),
        _txtMobNumController.clear(),
        _txtEmailController.clear(),
        _txtGenderController.clear(),
        _txtAgeController.clear(),
        _txtAadharNumController.clear(),
        _txtAddController.clear(),
        _txtSpecialistController.clear(),
        _txtQualificationController.clear(),
      ];
}
