import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/theme/theme_provider.dart';
import '../../themes/app_colors.dart';

class HomeWrapper extends ConsumerWidget {
  const HomeWrapper({super.key, required this.appbar, required this.child});

  final PreferredSizeWidget appbar;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return Scaffold(
      backgroundColor: themeMode == ThemeMode.light
          ? AppColors.headingLightColor
          : AppColors.primaryDarkColor,
      appBar: appbar,
      body: child,
    );
  }
}
