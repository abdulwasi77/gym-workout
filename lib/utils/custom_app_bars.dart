import 'package:gym_workout/utils/app_texts.dart';
import 'package:gym_workout/utils/export_all.dart';

class CustomAppBars {
  static PreferredSizeWidget primaryAppBar(
      {required String title,
      Widget? leading,
      bool? isLeading,
      List<Widget>? action}) {
    return AppBar(
      actions: action,
      leading: leading,
      automaticallyImplyLeading: isLeading ?? false,
      centerTitle: true,
      foregroundColor: AppColor.whiteColor,
      backgroundColor: AppColor.primaryColor,
      title: AppTexts.primaryText(title: title),
    );
  }
}
