import 'package:shared_preferences/shared_preferences.dart';

class SharePreferenceUtil {
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();

  static Future<void> init() async {
    _prefsInstance = await _instance;
  }

  static bool getBool(String key) {
    return _prefsInstance!.getBool(key) ?? false;
  }

  static Future<bool> setBool(String key, bool value) async {
    return await _prefsInstance!.setBool(key, value);
  }

  static String? getString(String key) {
    return _prefsInstance!.getString(key);
  }

  static Future<bool> setString(String key, String value) async {
    return await _prefsInstance!.setString(key, value);
  }
}
