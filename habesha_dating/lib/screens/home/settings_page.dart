// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:habesha_dating/images.dart';

import '../../widgets/common/loader.dart';
import '/widgets/custom_container.dart';
import '../../providers/auth/auth_provider.dart';
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
          hasLeading: true,
          leading: Container(
            // margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                // shape: BoxShape.circle,
                border: Border.all(
                    color: theme == ThemeMode.light
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
                context.pushReplacement("/intro");
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
          actions: [
            IconButton(
              onPressed: () {},
              icon: ClipOval(
                child: Image.network(
                    width: 40,
                    height: 40,
                    "https://pics.craiyon.com/2023-07-15/dc2ec5a571974417a5551420a4fb0587.webp"),
              ),
            ),
          ],
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 72),
          child: CustomContainer(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0XFFF5F6F6),
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 8),
                        Row(
                          children: [
                            ClipOval(
                              child: CachedNetworkImage(
                                imageUrl: images[0],
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
                                Text(
                                  "James Madison",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: theme == ThemeMode.dark
                                              ? AppColors.headingDarkColor
                                              : AppColors.headingLightColor),
                                ),
                                Text(
                                  'Personal Motto',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(
                                        fontSize: 12,
                                        color: theme == ThemeMode.dark
                                            ? AppColors.secondaryLight
                                            : AppColors.darkGreyDarkColor,
                                      ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SettingsMenu(
                    icon: Icons.key,
                    title: 'Account',
                    label: 'Privacy, security, change number',
                    onTap: () {
                      context.push("home/settings/account");
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
                    icon: CupertinoIcons.download_circle,
                    title: 'Storage and data',
                    label: 'Network usage, storage usage',
                    onTap: () {}),
                SettingsMenu(
                  icon: CupertinoIcons.person_2,
                  title: 'Invite friend',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ));
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
      padding: const EdgeInsets.symmetric(vertical: 16.0),
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
          child: Icon(icon,
              color: theme == ThemeMode.dark
                  ? AppColors.darkGreyDarkColor
                  : AppColors.darkGreyLightColor),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: theme == ThemeMode.dark
                        ? AppColors.headingDarkColor
                        : AppColors.headingLightColor,
                  ),
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontSize: 12,
                    color: theme == ThemeMode.dark
                        ? AppColors.secondaryLight
                        : AppColors.darkGreyDarkColor,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
