import 'package:gym_workout/utils/export_all.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final resetPasswordController = Get.put(ResetPasswordScreenController());
    return Scaffold(
      appBar:
          CustomAppBars.primaryAppBar(title: "Reset Password", isLeading: true),
      body: GetBuilder<ResetPasswordScreenController>(
        init: resetPasswordController,
        builder: (_) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldWidget(
              controller: resetPasswordController.passwordController,
              obscureText: resetPasswordController.passObsecureBool,
              labelText: "Password",
              suffixIcon: GestureDetector(
                onTap: () {
                  resetPasswordController.passObscure();
                },
                child: Icon(resetPasswordController.passObsecureBool
                    ? Icons.visibility_off
                    : Icons.visibility),
              ),
              prefixIcon: const Icon(Icons.password_rounded),
            ),
            20.h.verticalSpace,
            TextFieldWidget(
              controller: resetPasswordController.confirmPasswordController,
              obscureText: resetPasswordController.confirmPassObsecureBool,
              labelText: "Confirm Password",
              suffixIcon: GestureDetector(
                onTap: () {
                  resetPasswordController.confirmPasOobscure();
                },
                child: Icon(resetPasswordController.confirmPassObsecureBool
                    ? Icons.visibility_off
                    : Icons.visibility),
              ),
              prefixIcon: const Icon(Icons.password_rounded),
            ),
            80.h.verticalSpace,
            CustomButtonWidget(
                title: "Continue",
                onTap: () {
                  Get.offAll(() => const LoginScreen());
                }),
          ],
        ).paddingSymmetric(horizontal: 20),
      ),
    );
  }
}
