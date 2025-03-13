import 'package:gym_workout/body_fat_screen.dart';
import 'package:gym_workout/nutrition_goal_screen.dart';
import 'package:gym_workout/photos_screen.dart';
import 'package:gym_workout/schedule_workout_screen.dart';
import 'package:gym_workout/utils/export_all.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:gym_workout/vegetables_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBars.primaryAppBar(
          title: "Dashboard", leading: const Icon(Icons.menu)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20.h,
          children: [
            AppTexts.darkBlackText(
              title: "THINGS TO DO TODAY",
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const NutritionGoalScreen());
              },
              child: Column(
                children: [
                  Row(
                    spacing: 10.w,
                    children: [
                      _circularIndicatorWidget(AppColor.yellowColor),
                      AppTexts.simpleText("Hit your daily nutrition goal")
                    ],
                  ),
                  20.h.verticalSpace,
                  Row(
                    spacing: 30.w,
                    children: [
                      Column(
                        children: [
                          AppTexts.hintText(title: "Calories"),
                          _countDownTimerWidget(context: context, title: "cal"),
                        ],
                      ),
                      Column(
                        children: [
                          AppTexts.hintText(title: "Protein"),
                          _countDownTimerWidget(context: context, title: "g"),
                        ],
                      ),
                      Column(
                        children: [
                          AppTexts.hintText(title: "Carbs"),
                          _countDownTimerWidget(context: context, title: "g"),
                        ],
                      ),
                      Column(
                        children: [
                          AppTexts.hintText(title: "Fat"),
                          _countDownTimerWidget(context: context, title: "g"),
                        ],
                      ),
                    ],
                  ).paddingOnly(left: Get.width * .12),
                ],
              ),
            ),
            _divider(),
            GestureDetector(
              onTap: () {
                Get.to(() => const ScheduleWorkoutScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 20.w,
                    children: [
                      _circularIndicatorWidget(AppColor.lightBlueColor),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTexts.blackText(title: "Legs (Day 1)"),
                          AppTexts.hintText(
                              title: "Complete your scheduled workout"),
                        ],
                      ),
                    ],
                  ),
                  Icon(Icons.fitness_center, color: AppColor.greyColor),
                ],
              ),
            ),
            _divider(),
            GestureDetector(
              onTap: () {
                Get.to(() => const VegetablesScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 20.w,
                    children: [
                      _circularIndicatorWidget(AppColor.yellowColor),
                      AppTexts.blackText(title: "Eat vegetables"),
                    ],
                  ),
                  Icon(Icons.grass, color: AppColor.greyColor),
                ],
              ),
            ),
            AppTexts.darkBlackText(title: "MY PROGRESS"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _progressCard(
                  ontap: () {},
                  title: 'Body Weight',
                  date: '7 Jun 2021',
                  value: '196',
                  unit: ' lbs',
                ),
                _progressCard(
                  ontap: () {
                    Get.to(() => const BodyFatScreen());
                  },
                  title: 'Body Fat',
                  date: '7 Jun 2021',
                  value: '17',
                  unit: '%',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _progressCard(
                  ontap: () {},
                  title: 'Resting HR',
                  // date: '7 Jun 2021',
                  value: '....',
                  // unit: 'lbs',
                ),
                _progressCard(
                  ontap: () {
                    Get.to(() => const PhotosScreen());
                  },
                  title: 'Photos',
                  date: '7 Jun 2021',
                  value: '17',
                  unit: '%',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _progressCard(
                  ontap: () {},
                  title: 'Caloric Intake',
                  date: '7 Jun 2021',
                  value: '224.7',
                  unit: 'cal',
                ),
                const Expanded(child: SizedBox())
              ],
            ),
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

Widget _countDownTimerWidget(
    {required BuildContext context, required String title}) {
  return CircularCountDownTimer(
    duration: 10,
    initialDuration: 0,
    controller: CountDownController(),
    width: MediaQuery.of(context).size.width / 7,
    height: MediaQuery.of(context).size.height / 7,
    ringColor: Colors.grey[300]!,
    ringGradient: null,
    fillColor: Colors.purpleAccent[100]!,
    fillGradient: null,
    // backgroundColor: Colors.purple[500],
    backgroundGradient: null,
    strokeWidth: 05,
    strokeCap: StrokeCap.round,
    textStyle:
        const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    textAlign: TextAlign.center,
    textFormat: CountdownTextFormat.S,
    isReverse: false,
    isReverseAnimation: false,
    isTimerTextShown: true,
    autoStart: false,
    onStart: () {
      debugPrint('Countdown Started');
    },
    onComplete: () {
      debugPrint('Countdown Ended');
    },
    onChange: (String timeStamp) {
      debugPrint('Countdown Changed $timeStamp');
    },
    timeFormatterFunction: (defaultFormatterFunction, duration) {
      if (duration.inSeconds == 0) {
        return "${duration.inSeconds}$title";
      } else {
        return Function.apply(defaultFormatterFunction, [duration]);
      }
    },
  );
}

Widget _divider() {
  return Divider(
    color: AppColor.greyColor.withValues(alpha: .3),
  ).paddingSymmetric(horizontal: 9.w);
}

Widget _progressCard({
  final String? title,
  final String? date,
  final String? value,
  final String? unit,
  required VoidCallback ontap,
}) {
  return Expanded(
    child: GestureDetector(
      onTap: ontap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? "",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.h.verticalSpace,
              Text(
                date ?? "",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey[600],
                ),
              ),
              18.h.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    value ?? "",
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  8.h.verticalSpace,
                  Text(
                    unit ?? "",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                height: 6.h,
                decoration: BoxDecoration(
                  color: Colors.purple[100],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
