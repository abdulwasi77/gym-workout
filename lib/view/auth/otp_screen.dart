import 'package:gym_workout/utils/export_all.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final segrecationController = Get.put(SegrecationController());

    final otpController = Get.put(OtpScreenController());
    return Scaffold(
      appBar: CustomAppBars.primaryAppBar(title: "Otp", isLeading: true),
      body: GetBuilder<OtpScreenController>(
        init: otpController,
        builder: (_) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Pinput(
                controller: otpController.otpValue,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                defaultPinTheme: _defaultPinTheme,
                focusedPinTheme: _focusedPinTheme,
                submittedPinTheme: _submittedPinTheme,
                validator: (s) {
                  return s == '2222' ? null : 'Pin is incorrect';
                },
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) {
                  if (kDebugMode) {
                    print("otpValue=====>${otpController.otpValue.text}");
                  }
                }),
            80.h.verticalSpace,
            CustomButtonWidget(
                title: "Confirm",
                onTap: () {
                  if (segrecationController.getUserTypeFromStorage() ==
                      AppConstants.trainee) {
                    if (otpController.isSignup) {
                      Get.to(() => const CreateProfileScreen());
                    } else {
                      Get.to(() => const ResetPasswordScreen());
                    }
                  } else {
                    if (otpController.isSignup) {
                      Get.to(() => const TrainerCreateProfileScreen());
                    } else {
                      Get.to(() => const ResetPasswordScreen());
                    }
                  }
                }),
            70.h.verticalSpace,
          ],
        ).paddingSymmetric(horizontal: 20),
      ),
    );
  }
}

final _defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: TextStyle(
      fontSize: 20, color: AppColor.primaryColor, fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(color: AppColor.primaryColor),
    borderRadius: BorderRadius.circular(20),
  ),
);

final _focusedPinTheme = _defaultPinTheme.copyDecorationWith(
  border: Border.all(color: AppColor.primaryColor),
  borderRadius: BorderRadius.circular(8),
);

final _submittedPinTheme = _defaultPinTheme.copyWith(
  decoration: _defaultPinTheme.decoration?.copyWith(
    color: AppColor.whiteColor,
  ),
);
