import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/theme/theme_provider.dart';
import '../themes/app_colors.dart';

class Logo extends ConsumerWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 250,
          width: 250,
          child: InkWell(
            onTap: () => context.go("/intro"),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: theme == ThemeMode.dark
                              ? AppColors.borderDarkColor
                              : AppColors.borderLightColor)),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 180,
                      width: 180,
                    ),
                  ),
                ),
                const Text(
                  'Habesha Dating',
                  style: TextStyle(fontSize: 28),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
