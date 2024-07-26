// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:habesha_dating/images.dart';
import 'package:habesha_dating/widgets/common/loader.dart';
import 'package:habesha_dating/widgets/custom_container.dart';
import 'package:sticky_headers/sticky_headers.dart';

import '../../models/contacts_model.dart';
import '../../providers/auth/auth_provider.dart';
import '../../providers/contacts/contacts_provider.dart';
import '../../providers/theme/theme_provider.dart';
import '../../themes/app_colors.dart';
import '../../widgets/common/home_appbar.dart';
import '../../widgets/home/home_wrapper.dart';

class ContactsPage extends ConsumerWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final groupedContacts = ref.watch(contactsProvider);
    log("groupedContacts: $groupedContacts");
    return groupedContacts.when(
      data: (groupContacts) {
        final sortedKeys = groupContacts.keys.toList();

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
                  ref.read(authProvider.notifier).logout();
                  context.pushReplacement("/intro");
                },
              ),
            ),
            title: Text(
              "Contacts",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColors.secondaryLight),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const ClipOval(
                    child: Icon(
                  Icons.person_add_alt_1_outlined,
                  color: AppColors.secondaryLight,
                )),
              ),
            ],
          ),
          child: Container(
            margin: const EdgeInsets.only(top: 72),
            child: CustomContainer(
              child: ListView.builder(
                itemCount: sortedKeys.length,
                itemBuilder: (context, index) {
                  String initial = sortedKeys[index];
                  List<Contacts> contactsByInitial = groupContacts[initial]!;

                  return StickyHeader(
                      header: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            shape: BoxShape.circle),
                        child: Text(
                          textAlign: TextAlign.center,
                          initial,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      content: Column(
                        children: contactsByInitial.map(
                          (contact) {
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(images[index]),
                              ),
                              title: Text(
                                contact.name,
                                style: Theme.of(context).textTheme.bodyMedium!,
                              ),
                              subtitle: Text(
                                contact.status,
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            );
                          },
                        ).toList(),
                      ));
                },
              ),
            ),
          ),
        );
      },
      error: (err, stackTrace) => const SizedBox.shrink(),
      loading: () => const Center(child: Loader()),
    );
  }
}
