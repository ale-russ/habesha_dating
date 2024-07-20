import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/helpers/theme_preference.dart';
import '/utils/db_access.dart';
import '/utils/utility_methods.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});

final isDarkModeProvider =
    NotifierProvider<IsDarkModeNotifier, bool>(IsDarkModeNotifier.new);

class IsDarkModeNotifier extends Notifier<bool> {
  @override
  bool build() {
    determineAppThemeMode();
    return true;
  }

  String determineAppThemeMode([String? newTheme]) {
    switch (newTheme ?? DbAccess.readData("themeMode")) {
      case 'light':
        state = false;
        return 'light';
      case 'deviceThemeMode':
        state = deviceThemeMode;
        return "system_default";
      default:
        state = true;
        return 'dark';
    }
  }

  bool get deviceThemeMode =>
      PlatformDispatcher.instance.platformBrightness == Brightness.dark;
}

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.light) {
    _loadThemeMode();
  }

  final ThemePreferences _preferences = ThemePreferences();

  Future<void> _loadThemeMode() async {
    final String? themeModeString = await _preferences.getThemeMode();
    if (themeModeString != null) {
      state = themeModeString == 'dark' ? ThemeMode.dark : ThemeMode.light;
    }
  }

  void setThemeMode(ThemeMode themeMode) {
    state = themeMode;
    _preferences.setThemeMode(themeMode == ThemeMode.dark ? "dark" : "light");
    log('Theme: $state');
  }

  void toggleTheme() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    log('Theme: $state');
  }
}
