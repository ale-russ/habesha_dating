// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../providers/auth/auth_provider.dart';
import '/images.dart';
import '../../widgets/common/loader.dart';
import '../../widgets/common/toggle_button.dart';
import '/widgets/custom_container.dart';
import '../../providers/theme/theme_provider.dart';
import '../../themes/app_colors.dart';
import '../../widgets/common/home_appbar.dart';
import '../../widgets/home/home_wrapper.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return HomeWrapper(
        appbar: HomeAppBar(
          hasLeading: false,
          title: Text(
            "Settings",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColors.secondaryLight),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 72),
          child: CustomContainer(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: GetPlatform.isMobile ? 16 : 24),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .outline
                                  .withOpacity(0.1)),
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 8),
                          Row(
                            children: [
                              ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl: images[3],
                                  fit: BoxFit.fill,
                                  width: 50,
                                  height: 50,
                                  placeholder: (context, url) => const Loader(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("James Madison",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!),
                                  Text(
                                    'Personal Motto',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(
                                            fontSize: 12,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .tertiary),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  AccountIconsTile(theme: theme)
                ],
              ),
            ),
          ),
        ));
  }
}

class AccountIconsTile extends ConsumerWidget {
  const AccountIconsTile({
    super.key,
    required this.theme,
  });

  final ThemeMode theme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      height: GetPlatform.isMobile ? 400 : size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SettingsMenu(
                icon: CupertinoIcons.profile_circled,
                title: 'Account',
                label: 'Privacy, security, change number',
                onTap: () {
                  context.push("/home/settings/account");
                }),
            SettingsMenu(
                icon: CupertinoIcons.chat_bubble,
                title: 'Chat',
                label: 'Chat history, theme, wallpaper',
                onTap: () {}),
            SettingsMenu(
                icon: CupertinoIcons.bell,
                title: 'Notifications',
                label: 'Messages, group and others',
                onTap: () {}),
            SettingsMenu(
                icon: Icons.help_outline,
                title: 'Help',
                label: 'Help center, contact us, privacy policy',
                onTap: () {}),
            SettingsMenu(
                icon: CupertinoIcons.cube_box,
                title: 'Storage and data',
                label: 'Network usage, storage usage',
                onTap: () {}),
            SettingsMenu(
              icon: CupertinoIcons.person_add,
              title: 'Invite friend',
              label: "Invite your friends and earn some",
              onTap: () {},
            ),
            ListTile(
              dense: true,
              horizontalTitleGap: 30,
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: theme == ThemeMode.dark
                        ? AppColors.shareDarkColor
                        : AppColors.sharedLightColor,
                    shape: BoxShape.circle),
                child: ThemeToggleButton(
                    color: theme == ThemeMode.dark
                        ? AppColors.darkGreyDarkColor
                        : AppColors.darkGreyLightColor),
              ),
              title: Text(
                "Theme",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: theme == ThemeMode.dark
                          ? AppColors.headingDarkColor
                          : AppColors.headingLightColor,
                    ),
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: ref.read(userProvider.notifier).logout,
              child: ListTile(
                dense: true,
                horizontalTitleGap: 30,
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: theme == ThemeMode.dark
                          ? AppColors.shareDarkColor
                          : AppColors.sharedLightColor,
                      shape: BoxShape.circle),
                  child: Icon(Icons.logout,
                      color: theme == ThemeMode.dark
                          ? AppColors.darkGreyDarkColor
                          : AppColors.darkGreyLightColor),
                ),
                title: Text(
                  "Logout",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: theme == ThemeMode.dark
                            ? AppColors.headingDarkColor
                            : AppColors.headingLightColor,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsMenu extends ConsumerWidget {
  SettingsMenu(
      {super.key,
      required this.icon,
      required this.title,
      this.label = '',
      required this.onTap});

  final IconData icon;
  final String title;
  final String label;
  void Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: GetPlatform.isMobile ? 4 : 16.0),
      child: ListTile(
        onTap: onTap,
        dense: true,
        horizontalTitleGap: 30,
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: theme == ThemeMode.dark
                  ? AppColors.shareDarkColor
                  : AppColors.sharedLightColor,
              shape: BoxShape.circle),
          child: Icon(icon, color: Theme.of(context).colorScheme.tertiary),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Text(label, style: Theme.of(context).textTheme.labelSmall!)
          ],
        ),
      ),
    );
  }
}
