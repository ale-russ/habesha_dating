import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/custom_container.dart';
import '/widgets/common/custom_dismissible.dart';
import '/images.dart';
import '../../themes/app_colors.dart';
import '/providers/theme/theme_provider.dart';
import '../../widgets/common/home/online_contacts.dart';

class MessagesPage extends ConsumerWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return SingleChildScrollView(
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
                    return CustomDismissibleCard(
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
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            height: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: ClipOval(
                                        child: Image.network(
                                          width: 50,
                                          height: 50,
                                          images[index],
                                          fit: BoxFit.fill,
                                        ),
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
                                                  color: theme == ThemeMode.dark
                                                      ? AppColors.secondaryLight
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
                                                color:
                                                    AppColors.darkGreyDarkColor,
                                                fontWeight: FontWeight.w300,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      messages[index]['time'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(
                                            color: AppColors.darkGreyDarkColor,
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
                                                color: AppColors.secondaryLight,
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
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
