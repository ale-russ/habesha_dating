import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:habesha_dating/images.dart';
import 'package:habesha_dating/models/user_model.dart';
import 'package:habesha_dating/widgets/common/home_appbar.dart';

import '../../providers/theme/theme_provider.dart';
import '../../themes/app_colors.dart';
import '../../widgets/common/loader.dart';
import '../../widgets/custom_container.dart';

class AccountPage extends ConsumerWidget {
  AccountPage({super.key});

  DatingUser? user;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return Scaffold(
      appBar: HomeAppBar(
        hasLeading: false,
        onPressed: () => context.pop(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: images[3],
                      fit: BoxFit.fill,
                      width: 90,
                      height: 90,
                      placeholder: (context, url) => const Loader(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.person),
                    ),
                  ),
                  Text(
                    // (user!.username) ??
                    "Mekseb Alem",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: AppColors.secondaryLight),
                  ),
                  Text(
                    // (user!.username) ??
                    "@meksebalem",
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: theme == ThemeMode.dark
                            ? AppColors.darkGreyDarkColor
                            : AppColors.darkGreyLightColor),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  AccountIcons(icon: CupertinoIcons.chat_bubble, onTap: () {}),
                  AccountIcons(icon: CupertinoIcons.video_camera, onTap: () {}),
                  AccountIcons(icon: CupertinoIcons.phone, onTap: () {}),
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: theme == ThemeMode.dark
                              ? AppColors.settingsIconsDarkColor
                              : AppColors.settingsIconsLightColor,
                        ),
                        child: const Icon(CupertinoIcons.ellipsis),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const CustomContainer(
              child: Column(
                children: [
                  UserDetails(label: "Display Name", title: "Mekseb Alem"),
                  UserDetails(
                      label: "Email Address", title: "mekseb@gmail.com"),
                  UserDetails(
                      label: "Address", title: "Falls Church, Virginia, USA"),
                  UserDetails(label: "Phone Number", title: "+1002000200202"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UserDetails extends ConsumerWidget {
  const UserDetails({super.key, required this.label, required this.title});
  final String label;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: AppColors.darkGreyDarkColor, fontSize: 12),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: theme == ThemeMode.dark
                    ? AppColors.secondaryLight
                    : AppColors.secondaryDark,
                fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class AccountIcons extends ConsumerWidget {
  const AccountIcons({super.key, required this.icon, required this.onTap});

  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: SizedBox(
          height: 40,
          width: 50,
          // width: size.width,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme == ThemeMode.dark
                    ? AppColors.settingsIconsDarkColor
                    : AppColors.settingsIconsLightColor,
              ),
              child: Icon(icon, color: AppColors.secondaryLight),
            ),
          )),
    );
  }
}
