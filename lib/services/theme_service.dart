import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  static const String _themeKey = 'isDarkTheme';

  static Future<void> setTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, isDark);
  }

  static Future<bool> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_themeKey) ?? false; // Default to light theme
  }

  static Future<bool> toggleTheme() async {
    final currentTheme = await getTheme();
    await setTheme(!currentTheme);
    return !currentTheme;
  }
}
