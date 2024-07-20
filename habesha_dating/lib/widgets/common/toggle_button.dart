import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/theme/theme_provider.dart';
import '../../themes/app_colors.dart';

class ThemeToggleButton extends ConsumerWidget {
  const ThemeToggleButton({super.key, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(themeProvider.notifier);
    final themeMode = ref.watch(themeProvider);

    return IconButton(
      icon: Icon(
        themeMode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode,
        color: color ??
            (themeMode == ThemeMode.dark
                ? AppColors.secondaryLight
                : AppColors.secondaryDark),
      ),
      onPressed: () {
        themeNotifier.setThemeMode(
          themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark,
        );
      },
    );
  }
}
