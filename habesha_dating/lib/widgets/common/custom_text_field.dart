import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/theme/theme_provider.dart';
import '../../themes/app_colors.dart';

class CustomTextForm extends ConsumerWidget {
  const CustomTextForm({
    super.key,
    required this.controller,
    required this.labelText,
    required this.onChanged,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 24.0, vertical: kIsWeb ? 16 : 2),
      child: TextFormField(
        onChanged: onChanged,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.normal,
            color: themeMode == ThemeMode.dark
                ? AppColors.headingDarkColor
                : AppColors.headingLightColor),
        // style: TextStyle(
        //   color: themeMode == ThemeMode.dark
        //       ? AppColors.headingDarkColor
        //       : AppColors.headingLightColor,
        //   fontSize: 12,
        //   fontWeight: FontWeight.w400,
        // ),
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
        ),
      ),
    );
  }
}
