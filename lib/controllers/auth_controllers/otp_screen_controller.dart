import 'package:gym_workout/utils/export_all.dart';

class OtpScreenController extends GetxController {
  final TextEditingController otpValue = TextEditingController();
  bool isSignup = false;

  void fromSignup(bool value) {
    isSignup = value;
    update();
  }
}
