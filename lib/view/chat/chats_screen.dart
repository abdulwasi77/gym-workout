import 'package:gym_workout/utils/export_all.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBars.primaryAppBar(
        isLeading: true,
        title: "Chats",
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return _chatCard(onTap: () {
            Get.to(() => const ChattingScreen());
          });
        },
      ).paddingOnly(bottom: 10.h),
    );
  }
}

Widget _chatCard({required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      // height: 100.h,
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        border: Border.all(color: AppColor.primaryColor),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40.r,
            backgroundImage: AssetImage(AppAssets.avatarImage),
          ),
          10.w.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTexts.primaryText(title: "John"),
                    Badge.count(count: 2),
                  ],
                ),
                5.h.verticalSpace,
                AppTexts.secondaryText(title: "Thu, Nov 21, 2024 | 2:03 AM"),
                5.h.verticalSpace,
                AppTexts.blackText(
                    title: "Hello",
                    style: AppTextStyle.whiteTextStyle.copyWith(
                        color: AppColor.blackColor.withValues(alpha: .5),
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp)),
              ],
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 10.w, vertical: 10.h),
    ).paddingOnly(top: 10.h, left: 20.w, right: 20.w),
  );
}
