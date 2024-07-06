import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/theme_provider.dart';
import '../../themes/app_colors.dart';

class HomeAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const HomeAppBar(
      {super.key, this.leading, this.actions, this.title, this.color});

  final Widget? leading;
  final Widget? title;
  final Widget? actions;
  final Color? color;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return AppBar(
      backgroundColor: color ??
          (theme == ThemeMode.light
              ? AppColors.headingLightColor
              : AppColors.primaryDarkColor),
      centerTitle: true,
      leading: leading ??
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.secondaryLight,
            ),
            onPressed: () {},
          ),
      title: title!,
      actions: [actions ?? const SizedBox.shrink()],
    );
  }
}
