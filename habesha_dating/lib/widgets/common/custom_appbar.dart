import 'package:flutter/material.dart';
import 'package:habesha_dating/helpers/toggle_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../themes/app_colors.dart';
import '../../providers/theme_provider.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return AppBar(
      backgroundColor: themeMode == ThemeMode.dark
          ? AppColors.darkAddIconBorderColor
          : AppColors.secondaryLight,
      automaticallyImplyLeading: true,
      // leading: Icon(Icons.arrow_back),
      actions: [
        ThemeToggleButton()
        // IconButton(
        //   icon: Icon(
        //     themeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode,
        //     color: themeMode == ThemeMode.light
        //         ? AppColors.secondaryDark
        //         : AppColors.secondaryLight,
        //   ),
        //   onPressed: () {
        //     ref.read(themeProvider.notifier).toggleTheme();
        //   },
        // )
      ],
    );
  }
}
