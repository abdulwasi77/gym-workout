import 'package:gym_workout/utils/export_all.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileScreenController());
    return DefaultTabController(
      length: 2, // Define two tabs
      child: Scaffold(
        appBar: CustomAppBars.primaryAppBar(
          title: "Profile",
          isLeading: true,
          action: [
            GestureDetector(
              onTap: () {
                Get.to(() => const EditProfileScreen());
              },
              child: Icon(Icons.edit_note_outlined, size: 37.sp)
                  .paddingOnly(right: 15.w),
            ),
          ],
        ),
        body: Column(
          children: [
            // Add the TabBar for the tabs
            _buildTabBar(),
            _buildTabBarView(profileController),
          ],
        ),
      ),
    );
  }

  // TabBarView with Profile and Goals sections
  Widget _buildTabBarView(ProfileScreenController profileController) {
    return Expanded(
      child: TabBarView(
        children: [
          // About Me Tab Content
          GetBuilder<ProfileScreenController>(
            init: profileController,
            builder: (_) => _aboutMeWidget(),
          ),
          // My Goals Tab Content
          GetBuilder<ProfileScreenController>(
            init: profileController,
            builder: (_) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _myGoalWidget(
                      title: "Weight Loss",
                      progress: 0.65,
                      description: "Lose 5 kg in the next 3 months.",
                    ),
                    20.h.verticalSpace,
                    _myGoalWidget(
                      title: "Strength Training",
                      progress: 0.40,
                      description: "Increase max squat to 150kg.",
                    ),
                    20.h.verticalSpace,
                    _myGoalWidget(
                      title: "Cardio",
                      progress: 0.75,
                      description: "Run 5 km in under 25 minutes.",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // TabBar with custom styling
  Widget _buildTabBar() {
    return TabBar(
      dividerColor: AppColor.transparentColor,
      labelColor: AppColor.primaryColor,
      unselectedLabelColor: AppColor.blackColor.withValues(alpha: 0.7),
      indicatorColor: AppColor.yellowColor,
      indicatorWeight: 4.0,
      labelStyle: AppTextStyle.whiteTextStyle.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: AppTextStyle.whiteTextStyle.copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
      ),
      tabs: const [
        Tab(text: "About Me"),
        Tab(text: "My Goals"),
      ],
    );
  }

  // About Me Section
  Widget _aboutMeWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Profile Image with Shadow
          _profileImage(),
          10.h.verticalSpace, // Reduced vertical space for a cleaner look
          // User info cards (dynamic and professional)
          _duplicateCard("John", icon: Icons.person),
          10.h.verticalSpace,
          _duplicateCard("+967651465778", icon: Icons.phone),
          10.h.verticalSpace,
          _duplicateCard("Male", icon: Icons.male),
          10.h.verticalSpace,
          _duplicateCard("Abc Address block 2", icon: Icons.home),
          10.h.verticalSpace,
          _duplicateCard("2024/11/2", icon: Icons.date_range_outlined),
          10.h.verticalSpace,
          _duplicateCard("Athlete", icon: Icons.self_improvement),
          10.h.verticalSpace,
          _duplicateCard(
            icon: Icons.leaderboard,
            "My Trainer",
            isTrainer: true,
            onTap: () {
              Get.to(() => TrainerDetailScreen(trainer: {
                    "name": "John",
                    "image": AppAssets.avatarImage,
                    "specialty": "Cardio"
                  }));
            },
          ),
        ],
      ).paddingSymmetric(horizontal: 20.w, vertical: 20.h),
    );
  }

  // Profile Image with better shadow
  Widget _profileImage() {
    return Container(
      width: 130.w,
      height: 130.h,
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColor.blackColor.withValues(alpha: 0.3),
            offset: const Offset(0, 6),
            blurRadius: 12,
          ),
        ],
        image: DecorationImage(
            image: AssetImage(AppAssets.avatarImage), fit: BoxFit.cover),
      ),
    );
  }

  // Goal Widget for displaying goals
  Widget _myGoalWidget({
    required String title,
    required double progress,
    required String description,
  }) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: Get.width,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: AppColor.blackColor.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTexts.primaryText(title: title),
            // Text(
            //   title,
            //   style: AppTextStyle.whiteTextStyle.copyWith(
            //     fontSize: 20.sp,
            //     fontWeight: FontWeight.w600,
            //   ),
            // ),
            10.h.verticalSpace,
            AppTexts.secondaryText(title: description),

            10.h.verticalSpace,
            // Start Date and End Date Section with updated styling
            SizedBox(
              width: Get.width * 0.9, // Limit the width for better presentation
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _dateContainer("Start Date", "December 22"),
                  SizedBox(
                    height: 40.h,
                    child: const VerticalDivider(
                      color: Colors.white54,
                      thickness: 1,
                    ),
                  ),
                  _dateContainer("End Date", "January 23"),
                ],
              ),
            ),
            20.h.verticalSpace,
            _progressBar(progress),
            10.h.verticalSpace,
            AppTexts.secondaryText(
              title: "${(progress * 100).toStringAsFixed(0)}% Completed",
            ),
          ],
        ),
      ),
    );
  }

  // Date Container for Start Date and End Date with clean design
  Widget _dateContainer(String label, String date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTexts.secondaryText(title: label),
        5.h.verticalSpace,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColor.whiteColor.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: AppTexts.primaryText(title: date),
        ),
      ],
    );
  }

  // Progress Bar Widget with Custom Colors
  Widget _progressBar(double progress) {
    return LinearProgressIndicator(
      value: progress,
      backgroundColor: AppColor.whiteColor.withValues(alpha: 0.2),
      valueColor: AlwaysStoppedAnimation(AppColor.yellowColor),
    );
  }

  // Duplicate Card Widget for user info sections
  Widget _duplicateCard(String title,
      {bool isTrainer = false, VoidCallback? onTap, IconData? icon}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.h,
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColor.whiteColor.withValues(alpha: 0.5)),
          boxShadow: [
            BoxShadow(
              color: AppColor.blackColor.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: AppColor.whiteColor),
                20.w.horizontalSpace,
                AppTexts.secondaryText(
                    title: title,
                    style:
                        TextStyle(fontSize: 16.sp, color: AppColor.whiteColor)),
              ],
            ),
            isTrainer
                ? Icon(
                    Icons.arrow_forward,
                    color: AppColor.whiteColor,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
