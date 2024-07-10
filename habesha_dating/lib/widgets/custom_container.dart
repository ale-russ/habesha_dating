import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/providers/theme/theme_provider.dart';

import '../themes/app_colors.dart';

class CustomContainer extends ConsumerWidget {
  const CustomContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.7,
      padding: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: theme == ThemeMode.light
            ? AppColors.secondaryLight
            : AppColors.darkAddIconBorderColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(26),
          topRight: Radius.circular(26),
        ),
      ),
      child: child,
    );
  }
}
