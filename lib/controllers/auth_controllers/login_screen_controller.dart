import 'dart:developer';
import 'package:gym_workout/utils/export_all.dart';

class LoginScreenController extends GetxController {
  final LocalStorageService localStorageService = LocalStorageService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isObsecure = true;
  bool isRememberMe = false;

  void obscure() {
    isObsecure = !isObsecure;
    update();
  }

  void rememberMe(bool value) {
    isRememberMe = value;
    update();
  }

  void getvalues() {
    emailController.text =
        localStorageService.getData(key: LocalStorageKeys.email) ?? "";
    passwordController.text =
        localStorageService.getData(key: LocalStorageKeys.password) ?? "";
    isRememberMe =
        localStorageService.getData(key: LocalStorageKeys.isRememberMe) ??
            false;
    log("isRememberMe=================>$isRememberMe");
    log("email=================>${emailController.text}");
    log("password=================>${passwordController.text}");
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getvalues();
  }
}
