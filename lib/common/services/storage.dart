import 'package:freefish/common/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  Future<String> getString(String key) async {
    return _prefs.getString(key) ?? "";
  }

  Future<void> setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }

  bool isLoggedIn() {
    return _prefs.getString(AppConstants.storageUserProfileKey) != null;
  }

  String getUserToken() {
    return _prefs.getString(AppConstants.storageUserTokenKey) ?? "";
  }
}
