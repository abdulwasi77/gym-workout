import 'package:gym_workout/utils/export_all.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeScreenController homeController = Get.put(HomeScreenController());
    return Scaffold(
      drawer: const CustomDrawerWidget(),
      appBar: CustomAppBars.primaryAppBar(
        title: "Home",
        leading: GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: const Icon(Icons.menu),
        ),
        action: [
          Badge.count(
            count: 2,
            child: GestureDetector(
              onTap: () {
                Get.to(() => const NotificationsScreen(),
                    transition: Transition.upToDown,
                    duration: const Duration(seconds: 1));
              },
              child: const Icon(Icons.notifications),
            ),
          ).paddingOnly(right: 15.w),
        ],
      ),
      body: GetBuilder<HomeScreenController>(
        init: homeController,
        builder: (_) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  clipBehavior: Clip.none,
                  controller: homeController.pageController,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Theme(
                            data: Theme.of(context).copyWith(
                                colorScheme: ColorScheme.light(
                                    primary: AppColor.primaryColor)),
                            child: EasyDateTimeLinePicker(
                              focusedDate: homeController.selectedDate,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2030, 3, 18),
                              onDateChange: (date) {
                                homeController.selectDate(date);
                              },
                            ),
                          ),
                          20.h.verticalSpace,
                          AppTexts.blackText(
                            title:
                                "${DateFormat('MMMM d, EEEE').format(homeController.selectedDate ?? DateTime.now())} Plan",
                          ),
                          20.h.verticalSpace,
                          _workoutPlanCard(
                              title:
                                  "Workout Plan for ${DateFormat('EEEE').format(homeController.selectedDate ?? DateTime.now())}:"),
                          _dietPlanCard(homeController: homeController),
                          20.h.verticalSpace,
                          _buildProgressBar(progress: homeController.progress),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _workoutPlanCard({required String title, String? desc}) {
  return Card(
    elevation: 4,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ExpansionTile(
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            maintainState: true,
            dense: true, enabled: true,
            title: AppTexts.blackText(title: title),

            initiallyExpanded: false,
            children: <Widget>[
              SizedBox(height: 8.h),
              AppTexts.blackText(
                  title: desc ??
                      "1. Warm-up: 10 minutes\n"
                          "2. Strength Training: 3 sets of 12 reps\n"
                          "3. Cardio: 20 minutes\n"
                          "4. Stretching: 10 minutes"),
              SizedBox(height: 16.h),
              AppTexts.blackText(
                  title: "Notes:",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              AppTexts.blackText(
                  title: "Make sure to stay hydrated and focus on form."),
            ], // Collapse by default
          ),
        ],
      ),
    ),
  );
}

Widget _dietPlanCard({required HomeScreenController homeController}) {
  return Card(
    elevation: 4,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ExpansionTile(
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            maintainState: true,
            dense: true,
            enabled: true,
            title: AppTexts.blackText(
              title:
                  "Diet Plan for ${DateFormat('EEEE').format(homeController.selectedDate ?? DateTime.now())}:",
            ),
            initiallyExpanded: false,
            children: <Widget>[
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  horizontalMargin: 0,
                  columns: [
                    DataColumn(label: AppTexts.simpleText('Food Item')),
                    DataColumn(label: AppTexts.simpleText('Protein (g)')),
                    DataColumn(label: AppTexts.simpleText('Calories')),
                    DataColumn(label: AppTexts.simpleText('Total')),
                  ],
                  rows: [
                    for (var item in homeController.backendData)
                      DataRow(cells: [
                        DataCell(
                            AppTexts.simpleText(item["foodItem"].toString())),
                        DataCell(
                            AppTexts.simpleText(item["protein"].toString())),
                        DataCell(
                            AppTexts.simpleText(item["calories"].toString())),
                        DataCell(AppTexts.simpleText(item["total"].toString())),
                      ]),
                  ],

                  // homeController.backendData
                  //     .map((item) {
                  //   return DataRow(cells: [
                  //     DataCell(Text(
                  //         item["foodItem"].toString())),
                  //     DataCell(Text(
                  //         item["protein"].toString())),
                  //     DataCell(Text(
                  //         item["calories"].toString())),
                  //     DataCell(Text(
                  //         item["total"].toString())),
                  //   ]);
                  // }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _buildProgressBar({required double progress}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      AppTexts.blackText(
          title: "Progress", style: AppTextStyle.blackHeaderTextStyle),
      SizedBox(height: 8.h),
      LinearProgressIndicator(
        value: progress / 100,
        minHeight: 10,
        backgroundColor: AppColor.greyColor.withValues(alpha: .3),
        valueColor: AlwaysStoppedAnimation<Color>(AppColor.primaryColor),
      ),
      SizedBox(height: 8.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.boy_rounded, size: 42.sp),
          AppTexts.blackText(
            title: "${progress.toStringAsFixed(0)}% Complete",
          ),
          Icon(Icons.self_improvement, size: 42.sp),
        ],
      ),
    ],
  );
}
