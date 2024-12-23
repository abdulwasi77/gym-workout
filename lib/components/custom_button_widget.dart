import 'package:gym_workout/utils/export_all.dart';

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final double? width;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final VoidCallback onTap;
  const CustomButtonWidget(
      {super.key,
      required this.title,
      required this.onTap,
      this.backgroundColor,
      this.textStyle,
      this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? Get.width,
        height: 60.h,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColor.primaryColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Center(
          child: AppTexts.primaryText(
              title: title, style: textStyle ?? AppTextStyle.whiteTextStyle),
        ),
      ),
    );
  }
}
