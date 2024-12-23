import 'package:gym_workout/utils/export_all.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsController = Get.put(SettingsScreenController());
    return Scaffold(
      appBar: CustomAppBars.primaryAppBar(
        title: "Settings",
        leading: GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: const Icon(Icons.menu),
        ),
      ),
      body: GetBuilder<SettingsScreenController>(
        init: settingsController,
        builder: (_) => Column(
          children: [
            Container(
              height: 60.h,
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColor.primaryColor,
                border: Border.all(color: AppColor.whiteColor),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppTexts.primaryText(title: "Notifications"),
                  Transform.scale(
                    scale: 1.sp,
                    child: Switch.adaptive(
                        value: settingsController.notificationListener,
                        onChanged: (value) {
                          settingsController.notificationsSetter(value);
                        },
                        activeColor: AppColor.whiteColor),
                  ),
                ],
              ).paddingOnly(left: 15.w),
            ),
            20.h.verticalSpace,
            _duplicateCard("Chnage Password", Icons.password, () {
              Get.to(() => const ChangePasswordScreen());
            }),
            20.h.verticalSpace,
            _duplicateCard("Privacy Policy", Icons.privacy_tip_rounded, () {
              Get.to(() => const PrivacyPolicyScreen());
            }),
            20.h.verticalSpace,
            _duplicateCard("Terms & Conditions", Icons.privacy_tip_rounded, () {
              Get.to(() => const TermsAndConditionsScreen());
            }),
            20.h.verticalSpace,
            _duplicateCard("Delete Account", Icons.delete, () {
              AppDialogs.primaryDialog(
                  context: context,
                  headingTitle: "Logout",
                  description: "Are You Sure You Want To Logout");
            }),
          ],
        ).paddingSymmetric(horizontal: 20.w, vertical: 50.h),
      ),
    );
  }

  Widget _duplicateCard(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.h,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColor.primaryColor,
          border: Border.all(color: AppColor.whiteColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppTexts.primaryText(title: title),
            Icon(icon, color: AppColor.whiteColor),
          ],
        ).paddingSymmetric(horizontal: 15.w),
      ),
    );
  }
}
