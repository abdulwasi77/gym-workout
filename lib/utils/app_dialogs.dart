import 'package:gym_workout/utils/export_all.dart';

class AppDialogs {
  static primaryDialog({
    required BuildContext context,
    required String headingTitle,
    required String description,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: AppColor.primaryColor,
            ),
            width: Get.width * .8,
            height: Get.height * .33,
            child: Column(
              children: [
                GradientText(
                  headingTitle,
                  gradient: LinearGradient(
                    colors: [
                      AppColor.greyColor,
                      AppColor.whiteColor,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  style: AppTextStyle.whiteTextStyle
                      .copyWith(fontSize: 35.sp, fontWeight: FontWeight.bold),
                ),
                30.h.verticalSpace,
                SizedBox(
                  width: Get.width * .5,
                  child: Text(
                    description,
                    // "Are You Sure You Want To Logout",
                    style: AppTextStyle.whiteTextStyle.copyWith(
                      fontSize: 20.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                50.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButtonWidget(
                        width: Get.width * .3,
                        title: "No",
                        textStyle: TextStyle(color: AppColor.blackColor),
                        onTap: () {
                          Get.back();
                        },
                        backgroundColor: AppColor.whiteColor),
                    CustomButtonWidget(
                        width: Get.width * .3,
                        title: "Yes",
                        onTap: () {
                          Get.offAll(() => const SegrecationScreen());
                        },
                        backgroundColor: AppColor.redColor)
                  ],
                ),
              ],
            ).paddingSymmetric(horizontal: 20.w, vertical: 20.h),
          ),
        );
      },
    );
  }
}
