import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '/screens/home/chat_details.dart';
import '/widgets/home/home_wrapper.dart';
import '../../providers/auth/auth_provider.dart';
import '../../providers/loading_provider.dart';
import '../../widgets/common/home_appbar.dart';
import '../../widgets/common/loader.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/home/online_contacts.dart';
import '/widgets/common/custom_dismissible.dart';
import '/images.dart';
import '../../themes/app_colors.dart';
import '/providers/theme/theme_provider.dart';

class MessagesPage extends ConsumerWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final isLoading = ref.watch(loadingProvider);

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
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            OnlineContacts(),
            CustomContainer(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          /*  Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const ChatDetailsPage(),
                            ),
                          ); */
                          /*  context.pushNamed("/chat", pathParameters: {name:messages[index]["name"],avatar:images[index], isOline:messages[index]["isOnline"]}); */
                        },
                        child: CustomDismissibleCard(
                          onDelete: () {},
                          onNotification: () {},
                          child: Stack(
                            children: [
                              Container(
                                color: theme == ThemeMode.light
                                    ? AppColors.secondaryLight
                                    : AppColors.darkAddIconBorderColor,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 8),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                height: 80,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: ClipOval(
                                              child: CachedNetworkImage(
                                            fit: BoxFit.fill,
                                            height: 50,
                                            width: 50,
                                            imageUrl: images[index],
                                            placeholder: (context, url) =>
                                                const Loader(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          )
                                              // Image.network(
                                              //   width: 50,
                                              //   height: 50,
                                              //   images[index],
                                              //   fit: BoxFit.fill,
                                              //   loadingBuilder: (context, child,
                                              //           loadingProgress) =>
                                              //       const Loader(),
                                              // ),
                                              ),
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              messages[index]['name'],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      color: theme ==
                                                              ThemeMode.dark
                                                          ? AppColors
                                                              .secondaryLight
                                                          : AppColors
                                                              .secondaryDark),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              messages[index]["message"],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium!
                                                  .copyWith(
                                                    fontSize: 12,
                                                    color: AppColors
                                                        .darkGreyDarkColor,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          messages[index]['time'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall!
                                              .copyWith(
                                                color:
                                                    AppColors.darkGreyDarkColor,
                                              ),
                                        ),
                                        const SizedBox(height: 4),
                                        Container(
                                          height: 18,
                                          width: 18,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.red),
                                          child: Center(
                                            child: Text(
                                              textAlign: TextAlign.center,
                                              messages[index]['unread'],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall!
                                                  .copyWith(
                                                    color: AppColors
                                                        .secondaryLight,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
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
                                    color: messages[index]["isOnline"]
                                        ? AppColors.offlineColor
                                        : AppColors.primaryLightColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
