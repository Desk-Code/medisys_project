import 'package:otp_text_field/otp_text_field.dart';

class PatientOtpController {
  static final OtpFieldController _otpController = OtpFieldController();
  static OtpFieldController get otpPatientController => _otpController;

  static String? patientOtpPin;
}
