import 'dart:developer';
import 'package:gym_workout/utils/export_all.dart';

class LocalStorageService {
  final _storage = GetStorage();

  Future<void> initializeStorage() async {
    await GetStorage.init();
    log("get storage initialized");
  }

  Future<void> saveData({required String key, required dynamic value}) async {
    await _storage.write(key, value);
    log("key ===> <$key> value ===> <$value>");
  }

  dynamic getData({required String key}) {
    dynamic value = _storage.read(key);
    log('Retrieved data for $key: $value');
    return value;
  }

  Future<void> deleteData({required String key}) async {
    _storage.remove(key);
    log('Data deleted for key: $key');
  }

  bool containsKey(String key) {
    return _storage.hasData(key);
  }
}

class LocalStorageKeys {
  static String email = "email";
  static String password = "password";
  static String isRememberMe = "isRememberMe";
  static String userType = "userType";
}
