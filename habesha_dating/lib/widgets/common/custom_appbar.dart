import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habesha_dating/widgets/common/toggle_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../themes/app_colors.dart';
import '../../providers/theme/theme_provider.dart';

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
      automaticallyImplyLeading: !kIsWeb ? true : false,
      leading: kIsWeb
          ? const SizedBox.shrink()
          : Builder(
              builder: (context) {
                return IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: themeMode == ThemeMode.dark
                        ? AppColors.secondaryLight
                        : AppColors.secondaryDark,
                  ),
                  onPressed: context.pop,
                );
              },
            ),
      actions: const [ThemeToggleButton()],
    );
  }
}
