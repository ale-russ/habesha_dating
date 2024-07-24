import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/online_contacts_image_provider.dart';
import '../../widgets/home/messages/messages_tile.dart';
import '/widgets/home/home_wrapper.dart';
import '../../providers/auth/auth_provider.dart';
import '../../widgets/common/home_appbar.dart';
import '../../widgets/home/online_contacts.dart';
import '../../themes/app_colors.dart';
import '/providers/theme/theme_provider.dart';

class MessagesPage extends ConsumerWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final imageProvider = ref.watch(imageUrlProvider);

    return HomeWrapper(
      appbar: HomeAppBar(
        hasLeading: true,
        leading: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
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
              ref.read(authController.notifier).logout();
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
      child: const SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            OnlineContacts(),
            MessagesTile(),
          ],
        ),
      ),
    );
  }
}
