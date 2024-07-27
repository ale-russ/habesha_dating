// import 'dart:developer';

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/auth/form_validation_provider.dart';
import '../../providers/loading_provider.dart';
import '../../providers/theme/theme_provider.dart';
import '../../themes/app_colors.dart';
import '../common/loader.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({
    super.key,
    required this.onButtonTap,
    this.onTap,
    required this.label,
    required this.buttonLabel,
    this.height = 60,
    this.isLogin = false,
    this.color = AppColors.secondaryLight,
    this.validate = false,
  });

  final String buttonLabel;
  final String label;
  final double height;
  final bool isLogin;

  final Color color;
  final void Function() onButtonTap;
  final void Function()? onTap;
  final bool validate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(loadingProvider);
    final themeMode = ref.watch(themeProvider);
    final isFormValid = isLogin
        ? ref.watch(isLoginFormValidProvider)
        : ref.watch(isFormValidProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: validate
                ? isFormValid
                    ? onButtonTap
                    : null
                : onButtonTap,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              disabledBackgroundColor: themeMode == ThemeMode.dark
                  ? AppColors.disabledDarkColor
                  : AppColors.disabledLightColor,
              backgroundColor: color,
              padding: const EdgeInsets.symmetric(vertical: 20),
            ),
            child: isLoading
                ? const Loader()
                : Text(
                    buttonLabel,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 16,
                          color: validate
                              ? !isFormValid
                                  ? AppColors.darkGreyDarkColor
                                  : AppColors.secondaryLight
                              : AppColors.secondaryDark,
                        ),
                  ),
          ),
          SizedBox(height: height),
          Center(
            child: Column(
              children: [
                TextButton(
                  onPressed: onTap ?? () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        label,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.primaryLightColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(isLogin ? "" : "Log in",
                          style: Theme.of(context).textTheme.labelLarge!),
                    ],
                  ),
                ),
                if (isLogin)
                  TextButton(
                      onPressed: () => context.push("/signup"),
                      child: Text(
                        "Register",
                        style: Theme.of(context).textTheme.bodySmall,
                      ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
