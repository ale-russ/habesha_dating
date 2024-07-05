import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habesha_dating/helpers/theme_preference.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});

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
