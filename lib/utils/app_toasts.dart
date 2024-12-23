import 'package:gym_workout/utils/export_all.dart';

class AppToasts {
  static errorToast({required String title}) {
    return Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColor.redColor,
        textColor: AppColor.whiteColor,
        fontSize: 16.0);
  }

  static successToast({required String title}) {
    return Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColor.primaryColor,
        textColor: AppColor.whiteColor,
        fontSize: 16.0.sp);
  }
}
