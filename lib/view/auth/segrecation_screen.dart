import 'package:gym_workout/utils/export_all.dart';

class SegrecationScreen extends StatelessWidget {
  const SegrecationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SegrecationController segrecationController =
        Get.put(SegrecationController());
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: GetBuilder<SegrecationController>(
        init: segrecationController,
        builder: (_) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _segricationButton(
                  onTap: () {
                    Get.find<SegrecationController>()
                        .segrecationFunc(AppConstants.trainer);
                    Get.to(() => const LoginScreen());
                  },
                  title: "Trainer",
                  icon: Icons.sports_gymnastics_outlined),
              20.h.verticalSpace,
              _segricationButton(
                  onTap: () {
                    Get.find<SegrecationController>()
                        .segrecationFunc(AppConstants.trainee);
                    Get.to(() => const LoginScreen());
                  },
                  title: "Trainee",
                  icon: Icons.supervised_user_circle_rounded),
            ],
          ).paddingOnly(left: 20.h, right: 20.w, top: 10.h),
        ),
      ),
    );
  }
}

Widget _segricationButton(
    {required String title,
    required IconData icon,
    required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: Get.height * .27,
      width: Get.width * .6,
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        border: Border.all(color: AppColor.primaryColor),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 100.sp),
          AppTexts.primaryText(
              title: title,
              style: AppTextStyle.whiteTextStyle
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 40.sp)),
        ],
      ),
    ),
  );
}
