import 'package:gym_workout/utils/export_all.dart';

class SegrecationController extends GetxController {
  final LocalStorageService localStorageService = LocalStorageService();

  Future<void> segrecationFunc(String value) async {
    await localStorageService.saveData(
        key: LocalStorageKeys.userType, value: value);
    update();
  }

  String? getUserTypeFromStorage() {
    return localStorageService.getData(key: LocalStorageKeys.userType);
  }
}
