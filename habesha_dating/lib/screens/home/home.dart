// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '/providers/auth/auth_provider.dart';
import '../../themes/app_colors.dart';
import '../../widgets/common/home/online_contacts.dart';
import '../../widgets/common/home_appbar.dart';
import '../../providers/theme/theme_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: themeMode == ThemeMode.light
          ? AppColors.headingLightColor
          : AppColors.primaryDarkColor,
      appBar: HomeAppBar(
        leading: Container(
          margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              // shape: BoxShape.circle,
              border: Border.all(
                  color: themeMode == ThemeMode.light
                      ? AppColors.borderLightColor
                      : AppColors.borderDarkColor,
                  width: 1)),
          child: IconButton(
            icon: const Icon(
              Icons.search_rounded,
              color: AppColors.secondaryLight,
            ),
            onPressed: () {
              ref.read(userProvider.notifier).logout();
              context.go("/login");
            },
          ),
        ),
        title: Text(
          "Home",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: AppColors.secondaryLight),
        ),
        actions: IconButton(
          onPressed: () {},
          icon: ClipOval(
            child: Image.network(
                width: 40,
                height: 40,
                "https://pics.craiyon.com/2023-07-15/dc2ec5a571974417a5551420a4fb0587.webp"),
          ),
        ),
      ),
      body: Column(
        children: [
          OnlineContacts(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        width: size.width,
        decoration: BoxDecoration(
            color: themeMode == ThemeMode.light
                ? AppColors.secondaryLight
                : AppColors.darkAddIconBorderColor),
      ),
    );
  }
}
