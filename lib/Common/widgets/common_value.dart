import 'package:otp_text_field/otp_text_field.dart';

class CommonValue {
  static String phNumberValue = '';
  static String otpPinValue = '';

  static final OtpFieldController _otpFeildController = OtpFieldController();
  static OtpFieldController get otpController => _otpFeildController;
}
