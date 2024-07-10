import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/providers/bottom_nav_provider.dart';
// import '/providers/theme/theme_provider.dart';

import '../../themes/app_colors.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavBarIndexProvider);
    // final theme = ref.watch(themeProvider);

    return BottomNavigationBar(
      // type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (index) {
        ref.read(bottomNavBarIndexProvider.notifier).state = index;
      },
      items: [
        BottomNavigationBarItem(
          icon: Column(
            children: [
              SvgPicture.asset(
                'assets/images/message.svg',
                height: 26,
                width: 26,
                color: currentIndex == 0
                    ? AppColors.primaryDarkColor
                    : AppColors.darkGreyDarkColor,
              ),
              Text("Messages",
                  style: TextStyle(
                      color: currentIndex == 0
                          ? AppColors.primaryDarkColor
                          : AppColors.darkGreyDarkColor))
            ],
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Column(children: [
            SvgPicture.asset(
              'assets/images/Call.svg',
              height: 26,
              width: 26,
              color: currentIndex == 1
                  ? AppColors.primaryDarkColor
                  : AppColors.darkGreyDarkColor,
            ),
            Text("Calls",
                style: TextStyle(
                    color: currentIndex == 1
                        ? AppColors.primaryDarkColor
                        : AppColors.darkGreyDarkColor)),
          ]),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Column(children: [
            SvgPicture.asset(
              'assets/images/user.svg',
              height: 26,
              width: 26,
              color: currentIndex == 2
                  ? AppColors.primaryDarkColor
                  : AppColors.darkGreyDarkColor,
            ),
            Text("Contacts",
                style: TextStyle(
                    color: currentIndex == 2
                        ? AppColors.primaryDarkColor
                        : AppColors.darkGreyDarkColor))
          ]),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Column(children: [
            SvgPicture.asset(
              'assets/images/settings.svg',
              height: 26,
              width: 26,
              color: currentIndex == 3
                  ? AppColors.primaryDarkColor
                  : AppColors.darkGreyDarkColor,
            ),
            Text("Settings",
                style: TextStyle(
                    color: currentIndex == 3
                        ? AppColors.primaryDarkColor
                        : AppColors.darkGreyDarkColor))
          ]),
          label: '',
        ),
      ],
    );
  }
}
