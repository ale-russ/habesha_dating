import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../themes/app_colors.dart';
import '../../providers/theme_provider.dart';

class AuthHeading extends ConsumerWidget {
  const AuthHeading({
    super.key,
    required this.isLogin,
    required this.label,
  });

  final bool isLogin;
  final String label;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return Column(
      children: [
        Text(
          label,
          // isLogin ? "Login to Habesha Dating" : "Sign up with Email",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: themeMode == ThemeMode.dark
                  ? AppColors.headingDarkColor
                  : AppColors.headingLightColor,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(
          isLogin
              ? 'Welcome back! Sign in using your social '
              : "Get chatting with friends and family today",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: themeMode == ThemeMode.dark
                    ? AppColors.headingDarkColor
                    : AppColors.headingLightColor,
                fontSize: 14,
              ),
        ),
        Text(
          isLogin
              ? 'account or using your email '
              : " signing up for our chat app!",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: themeMode == ThemeMode.dark
                    ? AppColors.headingDarkColor
                    : AppColors.headingLightColor,
                fontSize: 14,
              ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
