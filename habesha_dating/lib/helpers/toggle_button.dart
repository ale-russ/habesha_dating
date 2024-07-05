import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/theme_provider.dart';

class ThemeToggleButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(themeProvider.notifier);
    final themeMode = ref.watch(themeProvider);

    return IconButton(
      icon: Icon(
          themeMode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode),
      onPressed: () {
        themeNotifier.setThemeMode(
          themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark,
        );
      },
    );
  }
}
