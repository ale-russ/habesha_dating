import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habesha_dating/images.dart';

import '/providers/theme/theme_provider.dart';
import '/widgets/common/home_appbar.dart';

import '../../themes/app_colors.dart';

class ChatDetailsPage extends ConsumerWidget {
  const ChatDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    // final bool isAliceOnline =chat['users']?['Alice']?['isOnline'] ?? false;
    final user = chat["users"] ?? {};

    log("USER: $user ");

    return Scaffold(
        appBar: HomeAppBar(
          color: theme == ThemeMode.dark
              ? AppColors.secondaryDark
              : AppColors.secondaryLight,
          leading: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: ClipOval(
                  child: Image.network(
                      width: 40,
                      height: 40,
                      "https://pics.craiyon.com/2023-07-15/dc2ec5a571974417a5551420a4fb0587.webp"),
                ),
              ),
              Positioned(
                top: 58,
                left: 63,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // color: isOnline == "true"
                    //     ? AppColors.offlineColor
                    //     : AppColors.primaryLightColor,
                  ),
                ),
              )
            ],
          ),

          // title: Text(
          //   "Home",
          //   style: Theme.of(context)
          //       .textTheme
          //       .bodyLarge!
          //       .copyWith(color: AppColors.secondaryLight),
          // ),
        ),
        body: Container(child: Center(child: Text("hello there"))));
  }
}
