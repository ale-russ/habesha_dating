import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/theme/theme_provider.dart';
import '../../themes/app_colors.dart';

class HomeAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    this.leading,
    this.actions,
    this.title,
    this.color,
    this.hasLeading = false,
    this.centerTitle = true,
  });

  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  final Color? color;
  final bool hasLeading;
  final bool centerTitle;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return AppBar(
      titleSpacing: 0,
      backgroundColor: color ??
          (theme == ThemeMode.light
              ? AppColors.headingLightColor
              : AppColors.primaryDarkColor),
      centerTitle: centerTitle,
      leading: Builder(
        builder: (context) {
          if (!hasLeading && kIsWeb) return const SizedBox.shrink();
          return IconButton(
            icon: leading ??
                const Icon(
                  Icons.arrow_back,
                  color: AppColors.secondaryLight,
                ),
            onPressed: () {},
          );
        },
      ),
      title: title ?? const SizedBox.shrink(),
      actions: [...?actions],
    );
  }
}
