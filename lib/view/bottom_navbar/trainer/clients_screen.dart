import 'package:gym_workout/utils/export_all.dart';

class ClientsScreen extends StatelessWidget {
  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final clientController = Get.put(ClientsScreenController());
    return Scaffold(
      appBar: CustomAppBars.primaryAppBar(
        title: "Clients",
        leading: GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Icon(Icons.menu, color: AppColor.whiteColor),
        ),
      ),
      body: GetBuilder<ClientsScreenController>(
        init: clientController,
        builder: (_) => _clientCard(
            name: "John",
            profileImageUrl: AppAssets.avatarImage,
            membershipType: "monthly",
            isActive: true),
      ),
    );
  }
}

Widget _clientCard(
    {required String name,
    required String profileImageUrl,
    required String membershipType,
    required bool isActive}) {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) => Card(
      color: AppColor.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10.sp),
        child: Row(
          children: [
            // Profile Image
            CircleAvatar(
              radius: 45.r,
              backgroundImage: AssetImage(profileImageUrl),
              backgroundColor: AppColor.greyColor,
            ),
            SizedBox(width: 15.sp),

            // Client Information
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTexts.blackText(title: name),
                5.h.verticalSpace,
                AppTexts.hintText(title: membershipType),

                5.h.verticalSpace,

                Row(
                  children: [
                    // Membership Status (Active/Inactive)
                    Icon(
                      isActive ? Icons.check_circle : Icons.cancel,
                      color: isActive ? AppColor.greenColor : AppColor.redColor,
                      size: 18.sp,
                    ),
                    SizedBox(width: 5.sp),
                    AppTexts.secondaryText(
                      title: isActive ? 'Active' : 'Inactive',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color:
                            isActive ? AppColor.greenColor : AppColor.redColor,
                      ),
                    )
                  ],
                ),
                10.h.verticalSpace,

                // Diet Plan Button
                _actionButton(
                  context,
                  title: "Assign Diet Plan",
                  icon: Icons.fastfood,
                  onTap: () {
                    // Navigate to the Diet Plan screen
                    Get.to(() => const DietPlanScreen());
                  },
                ),
                SizedBox(height: 5.sp),

                // Workout Plan Button
                _actionButton(
                  context,
                  title: "Assign Workout Plan",
                  icon: Icons.fitness_center,
                  onTap: () {
                    // Navigate to the Workout Plan screen
                    Get.to(() => const WorkoutPlanScreen());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  ).paddingSymmetric(vertical: 10.h, horizontal: 15.w);
}

Widget _actionButton(
  BuildContext context, {
  required String title,
  required IconData icon,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 45.h,
      width: Get.width * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColor.primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColor.whiteColor, size: 20.sp),
          SizedBox(width: 10.sp),
          AppTexts.secondaryText(title: title)
        ],
      ),
    ),
  );
}
