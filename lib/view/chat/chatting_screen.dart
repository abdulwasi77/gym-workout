import 'package:gym_workout/controllers/chat/chatting_screen_controller.dart';
import 'package:gym_workout/utils/export_all.dart';

class ChattingScreen extends StatelessWidget {
  const ChattingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chattingController = Get.put(ChattingScreenController());
    return Scaffold(
      // backgroundColor: AppColor.primaryColor,
      appBar: CustomAppBars.primaryAppBar(
        isLeading: true,
        title: "John",
      ),
      bottomNavigationBar: GetBuilder<ChattingScreenController>(
        init: chattingController,
        builder: (_) => TextFieldWidget(
          controller: chattingController.messageController,
          labelText: "Message",
          suffixIcon: chattingController.messageController.text.isNotEmpty
              ? Icon(Icons.send_rounded, color: AppColor.primaryColor)
              : null,
        ).paddingOnly(left: 30.0.w, right: 30.w, bottom: 20.h),
      ),

      body: SingleChildScrollView(
          reverse: true,
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 20.h),
              itemCount: 10,
              itemBuilder: (context, index) {
                return index % 2 == 0 ? _leftTileWidget() : _rightTileWidget();
              })),
    );
  }
}

Widget _leftTileWidget() {
  return ListTile(
    horizontalTitleGap: 10,
    minVerticalPadding: 8,
    leading: CircleAvatar(
      backgroundColor: AppColor.transparentColor,
      radius: 20,
      backgroundImage: AssetImage(AppAssets.avatarImage),
    ),
    title: Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: AppTexts.themeText(title: "John"),
    ),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: 0.9.sw,
          child: AppTexts.hintText(title: "Hello John"),
        ),
        AppTexts.hintText(title: "11:02 PM")
      ],
    ),
  );
}

Widget _rightTileWidget() {
  return Column(
    children: [
      4.verticalSpace,
      Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Container(
            constraints: BoxConstraints(
                minWidth: 10.w, minHeight: 10.h, maxWidth: 0.7.sw),
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            // width: 0.75.sw,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AppTexts.secondaryText(title: "hello"),
                  AppTexts.secondaryText(title: "11:09 PM"),
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
