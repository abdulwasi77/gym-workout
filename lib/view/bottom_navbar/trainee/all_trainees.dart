import 'package:gym_workout/utils/export_all.dart';

class AllTraineesScreen extends StatelessWidget {
  const AllTraineesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final allTraineesController = Get.put(AllTraineesController());
    return Scaffold(
      appBar: CustomAppBars.primaryAppBar(
        title: "Trainees",
        leading: GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Icon(Icons.menu, color: AppColor.whiteColor),
        ),
      ),
      body: GetBuilder<AllTraineesController>(
        init: allTraineesController,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Profile Image
            Row(
              children: [
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
                          color: isActive
                              ? AppColor.greenColor
                              : AppColor.redColor,
                          size: 18.sp,
                        ),
                        SizedBox(width: 5.sp),
                        AppTexts.secondaryText(
                          title: isActive ? 'Active' : 'Inactive',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: isActive
                                ? AppColor.greenColor
                                : AppColor.redColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30.r,
                  backgroundImage: const CachedNetworkImageProvider(
                      "https://cdn.pixabay.com/photo/2024/05/12/20/22/ai-generated-8757611_1280.jpg"),
                ),
                AppTexts.blackText(title: "Jack"),
              ],
            ),
          ],
        ),
      ),
    ),
  ).paddingSymmetric(vertical: 10.h, horizontal: 15.w);
}
