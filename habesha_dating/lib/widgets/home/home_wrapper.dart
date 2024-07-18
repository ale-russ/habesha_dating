import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/bottom_nav_provider.dart';
import '../../providers/theme/theme_provider.dart';
import '../../themes/app_colors.dart';
import '../common/bottom_navbar.dart';

class HomeWrapper extends ConsumerWidget {
  const HomeWrapper({super.key, required this.appbar, required this.child});

  final PreferredSizeWidget appbar;
  final Widget child;

  final List<String> pagePaths = const [
    "/messages",
    "/calls",
    "/contacts",
    "/settings",
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return Scaffold(
      backgroundColor: themeMode == ThemeMode.light
          ? AppColors.headingLightColor
          : AppColors.primaryDarkColor,
      appBar: appbar,
      body: child,
      // bottomNavigationBar: BottomNavBar(
      //   onTap: (index) {
      //     ref.read(bottomNavBarIndexProvider.notifier).state = index;
      //     context.go(pagePaths[index]);
      //   },
      // ),
    );
  }
}
