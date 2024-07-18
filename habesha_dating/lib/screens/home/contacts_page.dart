import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/auth/auth_provider.dart';
import '../../providers/theme/theme_provider.dart';
import '../../themes/app_colors.dart';
import '../../widgets/common/home_appbar.dart';
import '../../widgets/home/home_wrapper.dart';

class ContactsPage extends ConsumerWidget {
  const ContactsPage({super.key});

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
      child: const Center(
        child: Text("Contacts Page"),
      ),
    );
  }
}
