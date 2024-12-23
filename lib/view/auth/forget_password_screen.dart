import 'package:gym_workout/utils/export_all.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final forgetPasswordController = Get.put(ForgetPasswordScreenController());
    final otpController = Get.put(OtpScreenController());
    return Scaffold(
      appBar: CustomAppBars.primaryAppBar(
          title: "Forget Password", isLeading: true),
      body: GetBuilder<ForgetPasswordScreenController>(
        init: forgetPasswordController,
        builder: (_) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldWidget(
                controller: forgetPasswordController.emailController,
                labelText: "Email",
                prefixIcon: const Icon(Icons.email)),
            80.h.verticalSpace,
            CustomButtonWidget(
                title: "Verify",
                onTap: () {
                  Get.to(() => const OtpScreen());
                  otpController.fromSignup(false);
                }),
            70.h.verticalSpace,
          ],
        ).paddingSymmetric(horizontal: 20),
      ),
    );
  }
}
