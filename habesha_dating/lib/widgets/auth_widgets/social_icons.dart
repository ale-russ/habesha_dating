import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habesha_dating/themes/app_colors.dart';

import '../../providers/theme/theme_provider.dart';

class SocialIcons extends ConsumerWidget {
  const SocialIcons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialButtons(
          onTap: () {},
          child: const Icon(
            Icons.facebook,
            color: Colors.blue,
            size: 30,
          ),
        ),
        const SizedBox(width: 10),
        SocialButtons(
          onTap: () {},
          child: ClipOval(
            child:
                Image.asset('assets/images/google.png', width: 10, height: 10),
          ),
        ),
        const SizedBox(width: 10),
        SocialButtons(
          onTap: () {},
          child: Icon(
            Icons.apple,
            size: 30,
            color: themeMode == ThemeMode.light
                ? AppColors.secondaryDark
                : AppColors.secondaryLight,
          ),
        )
      ],
    );
  }
}

class SocialButtons extends ConsumerWidget {
  const SocialButtons({super.key, required this.onTap, required this.child});

  final void Function() onTap;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: themeMode == ThemeMode.dark
              ? const Color(0XFF0B0C0B)
              : AppColors.secondaryLight,
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0XFFA8B0AF), width: 2),
        ),
        child: child,
      ),
    );
  }
}
