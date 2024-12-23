import 'package:gym_workout/utils/export_all.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBars.primaryAppBar(
        isLeading: true,
        title: "Notifications",
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return _notificationCard();
        },
      ).paddingOnly(bottom: 20.h),
    );
  }
}

Widget _notificationCard() {
  return Container(
    // height: 100.h,
    decoration: BoxDecoration(
      color: AppColor.primaryColor,
      border: Border.all(color: AppColor.primaryColor),
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTexts.primaryText(title: "John"),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: Get.width * .67,
                child: AppTexts.secondaryText(
                  title:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
                )),
            AppTexts.secondaryText(title: "11:12 PM")
          ],
        ),
      ],
    ).paddingSymmetric(horizontal: 10.w, vertical: 10.h),
  ).paddingOnly(left: 20.h, right: 20.w, top: 10.h);
}
