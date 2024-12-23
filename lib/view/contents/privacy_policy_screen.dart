import 'package:gym_workout/utils/export_all.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColor.primaryColor,
      appBar: CustomAppBars.primaryAppBar(
        isLeading: true,
        title: "Privacy Policy",
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTexts.themeText(
              title: "Privacy's",
              style: AppTextStyle.primaryTextStyle
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 40.sp)),
          20.h.verticalSpace,
          AppTexts.themeText(
            title:
                "Lorem Ipsum does not knowingly collect personally identifiable information (PII) from persons under the age of 13. If you are under the age of 13, please do not provide us with information of any kind whatsoever. If you have reason to believe that we may have accidentally received information from a child under the age of 13, please contact us immediately at legal@wasai.co. If we become aware that we have inadvertently received Personal Information from a person under the age of 13, we will delete such information from our records.",
          )
        ],
      ).paddingSymmetric(horizontal: 22.h, vertical: 10.w),
    );
  }
}
