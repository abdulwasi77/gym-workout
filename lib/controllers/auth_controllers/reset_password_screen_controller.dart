import 'package:gym_workout/utils/export_all.dart';

class ResetPasswordScreenController extends GetxController {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool passObsecureBool = true;
  bool confirmPassObsecureBool = true;

  void passObscure() {
    passObsecureBool = !passObsecureBool;
    update();
  }

  void confirmPasOobscure() {
    confirmPassObsecureBool = !confirmPassObsecureBool;
    update();
  }
}
