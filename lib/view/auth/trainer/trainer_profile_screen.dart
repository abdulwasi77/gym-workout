import 'package:gym_workout/utils/export_all.dart';

class TrainerProfileScreen extends StatelessWidget {
  const TrainerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final trainerProfileController = Get.put(TrainerProfileScreenController());
    return Scaffold(
      appBar: CustomAppBars.primaryAppBar(
          title: "Profile",
          isLeading: true,
          action: [
            GestureDetector(
              onTap: () {
                Get.to(() => const TrainerEditProfileScreen());
              },
              child: Icon(Icons.edit_note_outlined, size: 37.sp)
                  .paddingOnly(right: 15.w),
            )
          ]),
      body: GetBuilder<TrainerProfileScreenController>(
        init: trainerProfileController,
        builder: (_) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 130.w,
                height: 130.h,
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColor.primaryColor),
                  image: DecorationImage(
                      image: AssetImage(AppAssets.avatarImage),
                      fit: BoxFit.cover),
                ),
              ),
              20.h.verticalSpace,
              _duplicateCard("John", icon: Icons.person),
              10.h.verticalSpace,
              _duplicateCard("+967651465778", icon: Icons.phone),
              10.h.verticalSpace,
              _duplicateCard("Male", icon: Icons.male),
              10.h.verticalSpace,
              _duplicateCard("Abc Address block 9", icon: Icons.location_on),
              10.h.verticalSpace,
              _duplicateCard("2024/11/2", icon: Icons.date_range),
              10.h.verticalSpace,
              _duplicateCard("Cardio", icon: Icons.accessibility_new),
              10.h.verticalSpace,
              _duplicateCard("10 years", icon: Icons.timeline_outlined),
              10.h.verticalSpace,
              _duplicateCard("Certificate", icon: Icons.edit_document),
              10.h.verticalSpace,
              SizedBox(
                width: Get.width,
                height: Get.height * .1,
                child: CustomScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  slivers: [
                    SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        childCount:
                            trainerProfileController.availableDays.length,
                        (BuildContext context, int index) {
                          return _duplicateDaysCard(trainerProfileController
                              .availableDays[index]
                              .toString());
                        },
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisExtent: 40.h,
                      ),
                    ),
                  ],
                ),
              ),
              _duplicateCard("Lorem Ipsum does not knowingly collect",
                  icon: Icons.description),
            ],
          ).paddingSymmetric(horizontal: 20.w, vertical: 10.h),
        ),
      ),
    );
  }
}

Widget _duplicateCard(String title, {IconData? icon}) {
  return Container(
    // height: height ?? 60.h,
    width: Get.width,
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.r),
      color: AppColor.primaryColor,
      border: Border.all(color: AppColor.whiteColor),
    ),
    child: Row(
      children: [
        Icon(icon, color: AppColor.whiteColor),
        20.w.horizontalSpace,
        SizedBox(
            width: Get.width * .6,
            child: AppTexts.secondaryText(
              title: title,
              style: AppTextStyle.appBarTextStyle,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            )),
      ],
    ),
  );
}

Widget _duplicateDaysCard(String title, {double? height}) {
  return Container(
    height: height ?? 60.h,
    width: Get.width,
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.r),
      color: AppColor.primaryColor,
      border: Border.all(color: AppColor.whiteColor),
    ),
    child: Center(
        child: AppTexts.secondaryText(
            title: title, style: AppTextStyle.appBarTextStyle)),
  );
}
