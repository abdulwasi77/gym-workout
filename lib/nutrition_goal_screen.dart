import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:gym_workout/utils/export_all.dart';

class NutritionGoalScreen extends StatelessWidget {
  const NutritionGoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBars.primaryAppBar(title: "19/7/2022", isLeading: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20.h,
          children: [
            Center(
              child: AppTexts.hintText(title: "Calories"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    AppTexts.hintText(title: "Goal"),
                    AppTexts.darkBlackText(title: "2000"),
                  ],
                ),
                Column(
                  children: [
                    AppTexts.hintText(title: "Eaten"),
                    AppTexts.darkBlackText(title: "0"),
                  ],
                ),
                Column(
                  children: [
                    AppTexts.hintText(title: "Remaining"),
                    AppTexts.darkBlackText(title: "2000"),
                  ],
                ),
              ],
            ),
            Center(
              child: AppTexts.hintText(title: "Macros"),
            ),
            Column(
              children: [
                Row(
                  spacing: 8.w,
                  children: [
                    CircleAvatar(
                      radius: 10.r,
                      backgroundColor: AppColor.greenColor,
                    ),
                    AppTexts.blackText(title: "Protein"),
                  ],
                ),
                Row(
                  spacing: 8.w,
                  children: [
                    CircleAvatar(
                      radius: 10.r,
                      backgroundColor: AppColor.orangeColor,
                    ),
                    AppTexts.blackText(title: "Fat"),
                  ],
                ),
                Row(
                  spacing: 8.w,
                  children: [
                    CircleAvatar(
                      radius: 10.r,
                      backgroundColor: AppColor.blueColor,
                    ),
                    AppTexts.blackText(title: "Carbs"),
                  ],
                ),
              ],
            ),
            _countDownTimerWidget(context: context, title: "%"),
            20.h.verticalSpace,
            NutritionTable(),
          ],
        ).paddingSymmetric(horizontal: 15.w, vertical: 15.h),
      ),
    );
  }
}

Widget _countDownTimerWidget(
    {required BuildContext context, required String title}) {
  return Center(
    child: CircularCountDownTimer(
      duration: 10,
      initialDuration: 0,
      controller: CountDownController(),
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 4,
      ringColor: Colors.grey[300]!,
      ringGradient: null,
      fillColor: Colors.purpleAccent[100]!,
      fillGradient: null,
      // backgroundColor: Colors.purple[500],
      backgroundGradient: null,
      strokeWidth: 023,
      strokeCap: StrokeCap.round,
      textStyle: AppTextStyle.hintTextStyle.copyWith(fontSize: 20.sp),
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
    ),
  );
}

class NutritionTable extends StatelessWidget {
  final List<Map<String, String>> nutritionData = [
    {"name": "Protein", "goal": "150g", "eaten": "0g", "remaining": "150g"},
    {"name": "Fat", "goal": "67g", "eaten": "0g", "remaining": "67g"},
    {"name": "Carbs", "goal": "200g", "eaten": "0g", "remaining": "200g"},
    {"name": "Fiber", "goal": "0g", "eaten": "0g", "remaining": "0g"},
    {"name": "Sodium", "goal": "0mg", "eaten": "0mg", "remaining": "0mg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 80.w,
                child: Text(
                  "",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                ),
              ),
              Expanded(
                child: Text(
                  "Goal",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                ),
              ),
              Expanded(
                child: Text(
                  "Eaten",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                ),
              ),
              Expanded(
                child: Text(
                  "Remaining",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                ),
              ),
            ],
          ),
          const Divider(thickness: 1, color: Colors.grey),
          // Data rows
          Column(
            children: nutritionData.map((data) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Vertical text for the nutrient name
                    SizedBox(
                      width: 80,
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          data["name"]!,
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    // Goal, Eaten, and Remaining values
                    Expanded(
                      child: Text(
                        data["goal"]!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        data["eaten"]!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        data["remaining"]!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
