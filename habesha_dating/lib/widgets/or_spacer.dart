import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../themes/app_colors.dart';
import '../providers/theme/theme_provider.dart';

class OrSpacer extends ConsumerWidget {
  const OrSpacer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 0.3,
              color: themeMode == ThemeMode.light
                  ? AppColors.passwordBorderDarkColor
                  : AppColors.passwordBorderLightColor,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "OR",
              style: TextStyle(
                color: AppColors.orLabelColor,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 0.3,
              color: themeMode == ThemeMode.light
                  ? AppColors.passwordBorderDarkColor
                  : AppColors.passwordBorderLightColor,
            ),
          ),
        ],
      ),
    );
  }
}
