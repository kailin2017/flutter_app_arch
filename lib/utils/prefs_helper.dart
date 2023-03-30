import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper {
  PrefsHelper._();

  factory PrefsHelper() => _instance;

  static final _instance = PrefsHelper._();

  late SharedPreferences prefs;

  Future<void> initial() async {
    prefs = await SharedPreferences.getInstance();
  }

  bool getBool(String key, bool defaultValue) =>
      prefs.getBool(key) ?? defaultValue;

  void setBool(String key, bool value) async {
    await prefs.setBool(key, value);
  }
}
