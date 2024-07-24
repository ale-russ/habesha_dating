import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  static const String themeKey = "theme_mode";

  Future<void> setThemeMode(String themeMode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(themeKey, themeMode);
  }

  Future<String?> getThemeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(themeKey);
  }
}
