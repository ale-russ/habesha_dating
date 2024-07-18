import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habesha_dating/providers/auth/auth_provider.dart';
import 'package:habesha_dating/widgets/common/loader.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '/images.dart';
import '../../providers/color_palett_provider.dart';
import '../../themes/app_colors.dart';

class OnlineContacts extends ConsumerWidget {
  OnlineContacts({super.key});

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 80,
      width: size.width,
      color: Colors.transparent,
      child: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: CustomProfileImage(),
      ),
    );
  }
}

class CustomProfileImage extends ConsumerWidget {
  const CustomProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageProvider = ref.watch(imageUrlProvider);
    final colorProviderNotifier = ref.read(colorProvider.notifier);
    final colors = ref.watch(colorProvider);

    return imageProvider.when(
        data: (data) {
          return Row(
              children: List.generate(data.length, (index) {
            final imageUrl = data[index];
            if (!colors.containsKey(imageUrl)) {
              colorProviderNotifier.getDominantColor(imageUrl);
            }

            final borderColor = colors[imageUrl] ?? AppColors.borderLightColor;
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: borderColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  height: 60,
                  width: 60,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: data[index],
                      placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(
                        color: AppColors.borderLightColor,
                      )),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  names[index],
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.secondaryLight),
                )
              ],
            );
          }));
        },
        loading: () => const Loader(),
        error: (err, stackTrace) => const Icon(Icons.error));
  }
}
