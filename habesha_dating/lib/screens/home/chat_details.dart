import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:habesha_dating/images.dart';

import '/providers/theme/theme_provider.dart';
import '/widgets/common/home_appbar.dart';

import '../../themes/app_colors.dart';

class ChatDetailsPage extends ConsumerWidget {
  const ChatDetailsPage(
      {super.key,
      required this.isOnline,
      required this.name,
      required this.avatar});

  final bool isOnline;
  final String name;
  final String avatar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    // final bool isAliceOnline =chat['users']?['Alice']?['isOnline'] ?? false;
    final user = chat["users"] ?? {};

    log("USER: $user ");

    return Scaffold(
        appBar: HomeAppBar(
            centerTitle: false,
            hasLeading: kIsWeb ? false : true,
            color: theme == ThemeMode.dark
                ? AppColors.secondaryDark
                : AppColors.secondaryLight,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.secondaryDark,
              ),
              onPressed: () {
                context.pop();
              },
            ),
            title: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // height: 60,
                        // width: 60,
                        // padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: ClipOval(
                          child: Image.network(
                            width: 40,
                            height: 40,
                            avatar,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: theme != ThemeMode.dark
                                          ? AppColors.secondaryDark
                                          : AppColors.secondaryLight),
                            ),
                            Text(
                              'Online',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      color: theme != ThemeMode.dark
                                          ? AppColors.darkGreyDarkColor
                                          : AppColors.darkGreyLightColor),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 28,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isOnline
                          ? AppColors.onlineColor
                          : AppColors.offlineColor,
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(
                      CupertinoIcons.phone,
                      size: 30,
                      color: AppColors.darkGreyDarkColor,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      CupertinoIcons.video_camera,
                      size: 35,
                      color: AppColors.darkGreyDarkColor,
                    ),
                    onPressed: () {},
                  )
                ],
              )
            ]),
        body: Container(child: Center(child: Text("hello there"))));
  }
}
