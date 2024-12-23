import 'package:gym_workout/utils/export_all.dart';

class ChangePasswordScreenController extends GetxController {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool oldPassObsecureBool = true;

  bool passObsecureBool = true;
  bool confirmPassObsecureBool = true;

  void oldPassOobscure() {
    oldPassObsecureBool = !oldPassObsecureBool;
    update();
  }

  void passObscure() {
    passObsecureBool = !passObsecureBool;
    update();
  }

  void confirmPasOobscure() {
    confirmPassObsecureBool = !confirmPassObsecureBool;
    update();
  }
}
