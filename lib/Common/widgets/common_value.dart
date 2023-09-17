import 'package:otp_text_field/otp_text_field.dart';

class CommonValue {
  static String phNumberValue = '';
  static String otpPinValue = '';

  static String doctorPhNum = '';
  static String patientPhNum = '';

  static double payablePatientAmount = 0;
  static String patientDisease = '';
  static String patientKey = '';

  //for the searching

  static String search = '';

  static final OtpFieldController _otpFeildController = OtpFieldController();
  static OtpFieldController get otpController => _otpFeildController;
}
