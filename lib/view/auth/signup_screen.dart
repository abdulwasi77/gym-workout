import 'package:gym_workout/utils/export_all.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signupController = Get.put(SignupScreenController());
    final otpController = Get.put(OtpScreenController());
    return Scaffold(
      appBar: CustomAppBars.primaryAppBar(title: "Signup", isLeading: true),
      body: GetBuilder<SignupScreenController>(
        init: signupController,
        builder: (_) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldWidget(
                controller: signupController.emailController,
                labelText: "Email",
                prefixIcon: const Icon(Icons.email)),
            20.h.verticalSpace,
            TextFieldWidget(
              controller: signupController.passwordController,
              obscureText: signupController.passObsecureBool,
              labelText: "Password",
              suffixIcon: GestureDetector(
                onTap: () {
                  signupController.passObscure();
                },
                child: Icon(signupController.passObsecureBool
                    ? Icons.visibility_off
                    : Icons.visibility),
              ),
              prefixIcon: const Icon(Icons.password_rounded),
            ),
            20.h.verticalSpace,
            TextFieldWidget(
              controller: signupController.confirmPasswordController,
              obscureText: signupController.confirmPassObsecureBool,
              labelText: "Confirm Password",
              suffixIcon: GestureDetector(
                onTap: () {
                  signupController.confirmPasOobscure();
                },
                child: Icon(signupController.confirmPassObsecureBool
                    ? Icons.visibility_off
                    : Icons.visibility),
              ),
              prefixIcon: const Icon(Icons.password_rounded),
            ),
            80.h.verticalSpace,
            CustomButtonWidget(
                title: "Signup",
                onTap: () {
                  Get.to(() => const OtpScreen());
                  otpController.fromSignup(true);
                }),
            70.h.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTexts.blackText(title: "Already have an account? "),
                GestureDetector(
                  onTap: () {
                    // Add your navigation logic here (to a registration page)
                    Get.off(() => const LoginScreen());
                  },
                  child: AppTexts.themeText(title: "Login"),
                ),
              ],
            ),
          ],
        ).paddingSymmetric(horizontal: 20),
      ),
    );
  }
}
