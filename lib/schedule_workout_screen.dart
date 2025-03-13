import 'package:gym_workout/components/cached_netwok_image_widget.dart';
import 'package:gym_workout/leg_exercise.dart';
import 'package:gym_workout/utils/export_all.dart';

class ScheduleWorkoutScreen extends StatelessWidget {
  const ScheduleWorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> exerciseList = [
      {"title": "Machine Leg Press", "sets": "4 sets x 10-12x"},
      {"title": "Machine Lying Leg Curl", "sets": "3 sets x 10-12x"},
      {"title": "Machine Seated Leg Extension", "sets": "3 sets x 10-12x"},
      {
        "title": "Hyperextension Roman Chair Back Extension",
        "sets": "3 sets x 10-12x"
      },
      {"title": "Machine Seated Calf Raise", "sets": "3 sets x 10-12x"},
    ];
    return Scaffold(
      appBar: CustomAppBars.primaryAppBar(title: "Today", isLeading: true),
      bottomNavigationBar: CustomButtonWidget(title: "Start Now", onTap: () {})
          .paddingSymmetric(horizontal: Get.width * .2, vertical: 20.h),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20.h,
          children: [
            Row(
              spacing: 20.w,
              children: [
                _circularIndicatorWidget(AppColor.lightBlueColor),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTexts.blackText(title: "Legs (Day 1)"),
                    AppTexts.hintText(title: "Scheduled"),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 8.w,
                  children: [
                    Icon(
                      Icons.keyboard_double_arrow_down_rounded,
                      color: AppColor.greyColor,
                    ),
                    AppTexts.hintText(title: "Regular"),
                  ],
                ),
                AppTexts.themeText(title: "Mark As Complete"),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTexts.hintText(title: "Instructions"),
                AppTexts.hintText(
                    title:
                        "Leg exercises are essential for building strength, enhancing stability, and improving overall mobility. Key movements like squats, lunges, and deadlifts target major muscle groups, including the quadriceps, hamstrings, glutes, and calves."),
              ],
            ),
            ...List.generate(
              exerciseList.length,
              (index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(() => LegExerciseScreen());
                  },
                  child: Row(
                    spacing: 10.w,
                    children: [
                      SizedBox(
                        width: 60.w,
                        height: 60.h,
                        child: const CachedNetworkImageComponent(
                            imageUrl:
                                "https://cdn.pixabay.com/photo/2024/05/12/20/22/ai-generated-8757611_1280.jpg"),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: Get.width * .7,
                            child: AppTexts.blackText(
                                title: exerciseList[index]["title"],
                                overflow: TextOverflow.ellipsis),
                          ),
                          AppTexts.hintText(title: exerciseList[index]["sets"])
                        ],
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ).paddingSymmetric(horizontal: 15.w, vertical: 15.h),
      ),
    );
  }
}

Widget _circularIndicatorWidget(Color color) {
  return Container(
    width: 30.w,
    height: 30.h,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: color, width: 2.5.w),
    ),
  );
}
