import 'package:gym_workout/utils/export_all.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavbarController bottomNavbarController =
        Get.put(BottomNavbarController());
    final SegrecationController segrecationController =
        Get.put(SegrecationController());

    return SizedBox(
      width: Get.width * .75,
      child: Drawer(
          backgroundColor: AppColor.transparentColor,
          child: _buildDrawer(
              context: context,
              bottomNavbarController: bottomNavbarController,
              segrecationController: segrecationController)),
    );
  }
}

Widget _buildDrawer(
    {SegrecationController? segrecationController,
    BottomNavbarController? bottomNavbarController,
    required BuildContext context}) {
  return Container(
    decoration: BoxDecoration(
      color: AppColor.primaryColor,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(30.r),
        bottomRight: Radius.circular(30.r),
      ),
    ),
    child: SafeArea(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    if (segrecationController?.getUserTypeFromStorage() ==
                        AppConstants.trainer) {
                      Get.to(() => const TrainerProfileScreen());
                    } else {
                      Get.to(() => const ProfileScreen());
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    width: 100.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.blackColor.withValues(alpha: 0.25),
                          blurRadius: 15,
                          offset: const Offset(0, 4),
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage(AppAssets.avatarImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                20.h.verticalSpace,
                AppTexts.primaryText(title: "John Doe"),
                5.h.verticalSpace,
                AppTexts.secondaryText(title: "john.doe@example.com"),
                5.h.verticalSpace,
                AppTexts.secondaryText(title: "Karachi, Sindh, Pakistan"),
              ],
            ).paddingSymmetric(horizontal: 20.w),
            20.h.verticalSpace,
            _dividerWidget(),
            20.h.verticalSpace,
            segrecationController?.getUserTypeFromStorage() ==
                    AppConstants.trainee
                ? Column(
                    children: [
                      _animatedCard("Home", Icons.home, onTap: () {
                        bottomNavbarController?.changeIndex(0);
                        Get.back();
                      }),
                      15.h.verticalSpace,
                      _animatedCard(
                          "Trainers", Icons.settings_accessibility_rounded,
                          onTap: () {
                        bottomNavbarController?.changeIndex(1);
                        Get.back();
                      }),
                      15.h.verticalSpace,
                      _animatedCard("Trainees", Icons.switch_account_outlined,
                          onTap: () {
                        bottomNavbarController?.changeIndex(2);
                        Get.back();
                      }),
                      15.h.verticalSpace,
                      _animatedCard("Requests", Icons.request_page, onTap: () {
                        Get.to(() => const RequestScreen());
                      }),
                      15.h.verticalSpace,
                      _animatedCard(
                          "Favourite Trainers", Icons.favorite_rounded,
                          onTap: () {
                        Get.to(() => const FavouriteTrainersScreen());
                      }),
                      15.h.verticalSpace,
                      _animatedCard("Messages", Icons.chat, onTap: () {
                        Get.to(() => const ChatsScreen());
                      }),
                      15.h.verticalSpace,
                      _animatedCard("Settings", Icons.settings, onTap: () {
                        bottomNavbarController?.changeIndex(3);
                        Get.back();
                      }),
                    ],
                  )
                : Column(
                    children: [
                      _animatedCard("Home", Icons.home, onTap: () {
                        bottomNavbarController?.changeIndex(0);
                        Get.back();
                      }),
                      15.h.verticalSpace,
                      _animatedCard("Clients", Icons.account_circle_sharp,
                          onTap: () {
                        bottomNavbarController?.changeIndex(1);
                        Get.back();
                      }),
                      15.h.verticalSpace,
                      _animatedCard("Messages", Icons.chat, onTap: () {
                        Get.to(() => const ChatsScreen());
                      }),
                      15.h.verticalSpace,
                      _animatedCard("Settings", Icons.settings, onTap: () {
                        bottomNavbarController?.changeIndex(2);
                        Get.back();
                      }),
                    ],
                  ),
            30.h.verticalSpace,
            _logoutCard("Logout", Icons.logout,
                iconColor: AppColor.whiteColor,
                color: AppColor.redColor, onTap: () {
              AppDialogs.primaryDialog(
                  context: context,
                  headingTitle: "Logout",
                  description: "Are You Sure You Want To Logout?");
            }),
          ],
        ).paddingOnly(bottom: 50.h),
      ),
    ),
  );
}

Widget _animatedCard(
  String title,
  IconData icon, {
  required VoidCallback onTap,
  Color? iconColor,
}) {
  return Column(
    children: [
      GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, color: iconColor ?? AppColor.whiteColor, size: 32.sp),
            15.w.horizontalSpace,
            AppTexts.primaryText(title: title),
          ],
        )
            .paddingSymmetric(horizontal: 20.w)
            .paddingOnly(right: Get.width * .15),
      ),
      _dividerWidget(),
    ],
  );
}

Widget _logoutCard(
  String title,
  IconData icon, {
  Color? color,
  required VoidCallback onTap,
  Color? iconColor,
}) {
  return GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: 65.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(25.r),
            bottomRight: Radius.circular(25.r)),
        color: color ?? AppColor.whiteColor.withValues(alpha: 0.9),
        boxShadow: [
          BoxShadow(
            color: AppColor.blackColor.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor ?? AppColor.primaryColor, size: 32.sp),
          20.w.horizontalSpace,
          AppTexts.primaryText(title: title),
        ],
      ).paddingSymmetric(horizontal: 20.w),
    ).paddingOnly(right: Get.width * .15),
  );
}

Widget _dividerWidget() {
  return Divider(
    color: AppColor.whiteColor.withValues(alpha: .5),
    thickness: .4,
  );
}
