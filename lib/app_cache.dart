import 'package:shared_preferences/shared_preferences.dart';

class AppCache {
  static final AppCache _instance = AppCache._internal();

  late SharedPreferences _prefs;

  AppCache._internal();

  factory AppCache() {
    return _instance;
  }

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> setLocale(String locale) async {
    await _prefs.setString('locale', locale);
  }

  String? getLocale() {
    return _prefs.getString('locale') ?? "en";
  }
}
