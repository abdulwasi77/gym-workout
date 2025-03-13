import 'package:gym_workout/utils/export_all.dart';

class AppTexts {
  static Widget primaryText(
      {required String title, TextStyle? style, TextOverflow? overflow}) {
    return Text(
      title,
      style: style ??
          AppTextStyle.appBarTextStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColor.whiteColor,
          ),
    );
  }

  static Widget secondaryText({
    required String title,
    TextOverflow? overflow,
    TextStyle? style,
    int? maxLines,
  }) {
    return Text(
      title,
      overflow: overflow,
      style: style ??
          AppTextStyle.appBarTextStyle.copyWith(
            fontSize: 14.sp,
            color: AppColor.whiteColor.withValues(alpha: 0.8),
          ),
      maxLines: maxLines,
    );
  }

  static Widget blackText(
      {required String title, TextOverflow? overflow, TextStyle? style}) {
    return Text(
      title,
      overflow: overflow,
      style: style ??
          AppTextStyle.blackHeaderTextStyle.copyWith(
            fontSize: 16.sp,
            color: AppColor.blackColor,
          ),
    );
  }

  static Widget themeText(
      {required String title,
      TextOverflow? overflow,
      TextStyle? style,
      TextDecoration? decoration}) {
    return Text(
      title,
      overflow: overflow,
      style: style ??
          AppTextStyle.primaryTextStyle.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColor.primaryColor,
            decoration: decoration,
          ),
    );
  }

  static Widget hintText(
      {required String title,
      TextOverflow? overflow,
      TextStyle? style,
      TextDecoration? decoration}) {
    return Text(
      title,
      overflow: overflow,
      style: style ?? AppTextStyle.hintTextStyle,
    );
  }

  static Widget simpleText(
    String title,
  ) {
    return Text(
      title,
    );
  }

  static Widget darkBlackText({required String title}) {
    return Text(
      title,
      style: AppTextStyle.blackHeaderTextStyle,
    );
  }
}
