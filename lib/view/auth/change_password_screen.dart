import 'package:gym_workout/utils/export_all.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final changePasswordController = Get.put(ChangePasswordScreenController());
    return Scaffold(
      appBar: CustomAppBars.primaryAppBar(
          title: "Change Password", isLeading: true),
      body: GetBuilder<ChangePasswordScreenController>(
        init: changePasswordController,
        builder: (_) => Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldWidget(
              controller: changePasswordController.oldPasswordController,
              obscureText: changePasswordController.oldPassObsecureBool,
              labelText: "Old Password",
              suffixIcon: GestureDetector(
                onTap: () {
                  changePasswordController.oldPassOobscure();
                },
                child: Icon(changePasswordController.oldPassObsecureBool
                    ? Icons.visibility_off
                    : Icons.visibility),
              ),
              prefixIcon: const Icon(Icons.password_rounded),
            ),
            20.h.verticalSpace,
            TextFieldWidget(
              controller: changePasswordController.passwordController,
              obscureText: changePasswordController.passObsecureBool,
              labelText: "New Password",
              suffixIcon: GestureDetector(
                onTap: () {
                  changePasswordController.passObscure();
                },
                child: Icon(changePasswordController.passObsecureBool
                    ? Icons.visibility_off
                    : Icons.visibility),
              ),
              prefixIcon: const Icon(Icons.password_rounded),
            ),
            20.h.verticalSpace,
            TextFieldWidget(
              controller: changePasswordController.confirmPasswordController,
              obscureText: changePasswordController.confirmPassObsecureBool,
              labelText: "Confirm New Password",
              suffixIcon: GestureDetector(
                onTap: () {
                  changePasswordController.confirmPasOobscure();
                },
                child: Icon(changePasswordController.confirmPassObsecureBool
                    ? Icons.visibility_off
                    : Icons.visibility),
              ),
              prefixIcon: const Icon(Icons.password_rounded),
            ),
            80.h.verticalSpace,
            CustomButtonWidget(
                title: "Confirm",
                onTap: () {
                  Get.back();
                }),
          ],
        ).paddingSymmetric(horizontal: 20, vertical: 70.h),
      ),
    );
  }
}
