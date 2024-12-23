import 'package:gym_workout/utils/export_all.dart';

class SettingsScreenController extends GetxController {
  bool notificationListener = false;

  void notificationsSetter(bool value) {
    notificationListener = value;
    update();
  }
}
