import 'package:gym_workout/utils/export_all.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LocalStorageService localStorageService = LocalStorageService();
    final loginController = Get.put(LoginScreenController());

    return Scaffold(
      appBar: CustomAppBars.primaryAppBar(
          title: "Login",
          leading: GestureDetector(
              onTap: () {
                Get.to(() => const SegrecationScreen());
              },
              child: const Icon(Icons.arrow_back))),
      body: GetBuilder<LoginScreenController>(
        init: loginController,
        builder: (_) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldWidget(
                controller: loginController.emailController,
                labelText: "Email",
                prefixIcon: const Icon(Icons.email)),
            20.h.verticalSpace,
            TextFieldWidget(
              controller: loginController.passwordController,
              obscureText: loginController.isObsecure,
              labelText: "Password",
              suffixIcon: GestureDetector(
                onTap: () {
                  loginController.obscure();
                },
                child: Icon(loginController.isObsecure
                    ? Icons.visibility_off
                    : Icons.visibility),
              ),
              prefixIcon: const Icon(Icons.password_rounded),
            ),
            15.h.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      side: AlwaysActiveBorderSide(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                      checkColor: AppColor.whiteColor,
                      activeColor: AppColor.primaryColor,
                      value: loginController.isRememberMe,
                      onChanged: (value) {
                        loginController.rememberMe(value ?? false);
                      },
                    ),
                    AppTexts.themeText(title: "Remember Me"),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const ForgetPasswordScreen());
                  },
                  child: AppTexts.themeText(
                      title: "Forgot Password?",
                      decoration: TextDecoration.underline),
                ),
              ],
            ),
            15.h.verticalSpace,
            80.h.verticalSpace,
            CustomButtonWidget(
                title: "Login",
                onTap: () {
                  if (loginController.isRememberMe) {
                    localStorageService.saveData(
                        key: LocalStorageKeys.email,
                        value: loginController.emailController.text);
                    localStorageService.saveData(
                        key: LocalStorageKeys.password,
                        value: loginController.passwordController.text);
                    localStorageService.saveData(
                        key: LocalStorageKeys.isRememberMe,
                        value: loginController.isRememberMe);
                  } else {
                    localStorageService.deleteData(key: LocalStorageKeys.email);
                    localStorageService.deleteData(
                        key: LocalStorageKeys.password);
                    localStorageService.deleteData(
                        key: LocalStorageKeys.isRememberMe);
                  }

                  Get.offAll(() => const BottomNavbar(),
                      transition: Transition.noTransition,
                      duration: const Duration(seconds: 1));
                }),
            70.h.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTexts.blackText(title: "Don't have an account? "),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const SignupScreen());
                  },
                  child: AppTexts.themeText(title: "Sign Up"),
                ),
              ],
            ),
          ],
        ).paddingSymmetric(horizontal: 20),
      ),
    );
  }
}

class AlwaysActiveBorderSide extends WidgetStateBorderSide {
  @override
  BorderSide? resolve(states) => BorderSide(color: AppColor.greyColor);
}
