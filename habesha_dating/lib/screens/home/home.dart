// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habesha_dating/images.dart';

import '../../providers/bottom_nav_provider.dart';
import '../../widgets/common/bottom_navbar.dart';
import '/screens/home/call_page.dart';
import '/screens/home/contacts_page.dart';
import '/screens/home/messages_page.dart';
import '/screens/home/settings_page.dart';
import '../../themes/app_colors.dart';
import '../../providers/theme/theme_provider.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  final List<Widget> pages = [
    const MessagesPage(),
    const CallPage(),
    ContactsPage(),
    const SettingsPage()
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final size = MediaQuery.of(context).size;
    final currentIndex = ref.watch(bottomNavBarIndexProvider);

    return Scaffold(
      backgroundColor: themeMode == ThemeMode.light
          ? AppColors.headingLightColor
          : AppColors.primaryDarkColor,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavBar(
        onTap: (index) =>
            ref.watch(bottomNavBarIndexProvider.notifier).state = index,
      ),
    );
  }
}
