import 'package:gym_workout/utils/export_all.dart';

class TrainerDetailScreen extends StatelessWidget {
  final Map<String, String> trainer;

  const TrainerDetailScreen({super.key, required this.trainer});

  @override
  Widget build(BuildContext context) {
    final trainerDetailController = Get.put(TrainerDetailController());
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        appBar: CustomAppBars.primaryAppBar(
            title: trainer["name"] ?? "", isLeading: true),
        body: GetBuilder<TrainerDetailController>(
          init: trainerDetailController,
          builder: (_) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      trainer["image"] ?? "",
                      fit: BoxFit.cover,
                      height: 250,
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left side: Trainer name and charges
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTexts.primaryText(
                              title: trainer["name"] ?? "",
                              style: AppTextStyle.whiteTextStyle.copyWith(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              )),
                          const SizedBox(width: 10),
                          10.h.verticalSpace,
                          AppTexts.secondaryText(
                              title: "Charges: \$100/hr",
                              style: AppTextStyle.whiteTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color:
                                    AppColor.whiteColor.withValues(alpha: 0.8),
                              ))
                        ],
                      ),
                      IconButton(
                        icon: Icon(
                          trainerDetailController.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: trainerDetailController.isFavorite
                              ? AppColor.redColor
                              : AppColor.whiteColor,
                          size: 28,
                        ),
                        onPressed: () {
                          trainerDetailController.favourite();
                        },
                        padding: const EdgeInsets.all(0),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TabBar(
                    tabAlignment: TabAlignment.start,
                    padding: EdgeInsets.zero,
                    indicatorPadding: EdgeInsets.zero,
                    labelPadding: EdgeInsets.symmetric(horizontal: 10.w),
                    isScrollable: true,
                    indicator: BoxDecoration(color: AppColor.transparentColor),
                    dividerColor: AppColor.transparentColor,
                    tabs: [
                      _customTabWidget(title: "Details"),
                      _customTabWidget(title: "Clients"),
                      _customTabWidget(title: "Reviews"),
                      _customTabWidget(title: "Diet Plans"),
                      _customTabWidget(title: "Training Plans"),
                    ],
                    labelColor: AppColor.primaryColor,
                    unselectedLabelColor: AppColor.blackColor,
                    indicatorColor: AppColor.primaryColor,
                  ),
                  SizedBox(
                    height: Get.height * .6,
                    child: TabBarView(children: [
                      _details(trainer),
                      _clientCard(
                          name: "John",
                          profileImageUrl: AppAssets.avatarImage,
                          membershipType: "monthly",
                          isActive: true),
                      _ratingCard(trainerDetailController),
                      _dietPlanCard(
                        meal: 'Evening Snack',
                        calories: '350 kcal',
                        protein: '30g',
                        carbs: '10g',
                        fats: '25g',
                        foods: ['Cottage Cheese', 'Chia Seeds'],
                      ),
                      _trainingPlanCard(
                        day: 'Friday - Pull Day (Back, Biceps)',
                        exercises: [
                          'Lat Pulldown: 4 sets of 8-12 reps',
                          'Barbell Row: 4 sets of 8-10 reps',
                          'Barbell Bicep Curls: 3 sets of 10-12 reps',
                          'Hammer Curls: 3 sets of 12 reps',
                        ],
                        rest: 'Rest 60-90 seconds between sets',
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _customTabWidget({required String title}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    decoration: BoxDecoration(
      color: AppColor.whiteColor,
      borderRadius: BorderRadius.circular(15.r),
      boxShadow: [
        BoxShadow(
          color: AppColor.blackColor.withValues(alpha: 0.1),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Tab(
      child: Center(child: AppTexts.simpleText(title)),
    ),
  );
}

Widget _details(Map<String, dynamic> trainer) {
  return Column(
    children: [
      .12.sh.verticalSpace,
      AppTexts.primaryText(
        title: "Specialty: ${trainer["specialty"] ?? ""}",
      ),
      const SizedBox(height: 20),
      AppTexts.secondaryText(
        title:
            "Trainer Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      ),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomButtonWidget(
            width: Get.width * .4,
            onTap: () {},
            title: "Book a Session",
            backgroundColor: AppColor.whiteColor,
            textStyle: AppTextStyle.primaryTextStyle,
          ),
          CustomButtonWidget(
            width: Get.width * .4,
            onTap: () {
              Get.to(() => const ChattingScreen());
            },
            title: "Chat",
            backgroundColor: AppColor.blackColor.withValues(alpha: .54),
            textStyle: AppTextStyle.primaryTextStyle,
          ),
        ],
      ),
      50.h.verticalSpace,
    ],
  );
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
                    AppTexts.themeText(
                      title: isActive ? 'Active' : 'Inactive',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color:
                            isActive ? AppColor.greenColor : AppColor.redColor,
                      ),
                    )
                  ],
                ),
              ],
            ),

            // Spacer to push content to the left
            // const Spacer(),

            // // Edit Button (optional)
            // IconButton(
            //   icon:
            //       Icon(Icons.edit, color: AppColor.primaryColor, size: 20.sp),
            //   onPressed: () {
            //     // Add your editing functionality here
            //   },
            // ),
          ],
        ),
      ),
    ),
  ).paddingOnly(top: 10.h);
}

Widget _ratingCard(TrainerDetailController trainerDetailController) {
  return Column(
    children: [
      .04.sh.verticalSpace,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppTexts.simpleText("Ratings & Reviews (44)"),
          Row(
            children: [
              AppTexts.secondaryText(
                  title: "${trainerDetailController.rating}"),
              4.w.horizontalSpace,
              RatingBar.readOnly(
                size: 22.r,
                isHalfAllowed: true,
                halfFilledIcon: Icons.star_half_rounded,
                halfFilledColor: AppColor.blackColor,
                filledColor: AppColor.blackColor,
                emptyColor: AppColor.whiteColor,
                filledIcon: Icons.star,
                emptyIcon: Icons.star_border,
                initialRating: trainerDetailController.rating,
                maxRating: 5,
              ),
            ],
          )
        ],
      ),
      10.h.verticalSpace,
      SizedBox(
        height: Get.height * .5,
        child: ListView.builder(
          // physics: const NeverScrollableScrollPhysics(),
          itemCount: 20,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColor.whiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTexts.themeText(title: "This trainer is best$index"),
                  5.h.verticalSpace,
                  Row(
                    children: [
                      RatingBar.readOnly(
                        size: 22.r,
                        isHalfAllowed: true,
                        halfFilledIcon: Icons.star_half_rounded,
                        halfFilledColor: AppColor.blackColor,
                        filledColor: AppColor.blackColor,
                        emptyColor: AppColor.whiteColor,
                        filledIcon: Icons.star,
                        emptyIcon: Icons.star_border,
                        initialRating: trainerDetailController.rating,
                        maxRating: 5,
                      ),
                      10.w.horizontalSpace,
                      AppTexts.themeText(title: "John Wick$index"),
                    ],
                  ),
                ],
              ).paddingSymmetric(horizontal: 15.w, vertical: 10.h),
            ).paddingOnly(bottom: 10.h);
          },
        ),
      ),
    ],
  );
}

Widget _dietPlanCard(
    {required String meal, calories, protein, carbs, fats, foods}) {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) {
      return Card(
        color: AppColor.whiteColor,
        elevation: 5,
        child: ListTile(
          title: AppTexts.blackText(
              title: meal,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTexts.simpleText('Calories: $calories'),
              AppTexts.simpleText('Protein: $protein'),
              AppTexts.simpleText('Carbs: $carbs'),
              AppTexts.simpleText('Fats: $fats'),
              10.h.verticalSpace,
              AppTexts.simpleText('Suggested Foods:'),
              for (var food in foods) AppTexts.simpleText('• $food'),
            ],
          ),
        ),
      );
    },
  ).paddingOnly(top: 10.h);
}

Widget _trainingPlanCard(
    {required String day, required var exercises, required String rest}) {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) {
      return Card(
        color: AppColor.whiteColor,
        elevation: 5,
        child: ListTile(
          title: AppTexts.blackText(
              title: day,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTexts.simpleText('Exercises:'),
              for (var exercise in exercises)
                AppTexts.simpleText('• $exercise'),
              const SizedBox(height: 10),
              AppTexts.simpleText('Rest: $rest'),
            ],
          ),
        ),
      );
    },
  ).paddingOnly(top: 10.h);
}
