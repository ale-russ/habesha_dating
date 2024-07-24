import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:habesha_dating/widgets/common/profile_image.dart';
import 'package:habesha_dating/widgets/common/shimmer.dart';
import 'package:shimmer/shimmer.dart';

import '../../models/images_model.dart';
import '/widgets/common/loader.dart';
import '/providers/online_contacts_image_provider.dart';
import '/images.dart';
import '../../themes/app_colors.dart';

class OnlineContacts extends ConsumerWidget {
  const OnlineContacts({super.key});

  // final ScrollController controller = ScrollController();

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
  const CustomProfileImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageProvider = ref.watch(imageUrlProvider);
    return imageProvider.when(
      data: (data) => OnlineContactsList(
        data: data,
      ),
      loading: () => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: 32.0,
          width: 180.0,
          color: Colors.grey[300],
        ),
      ),
      error: (err, stackTrace) => const Icon(Icons.error),
    );
  }
}

class OnlineContactsList extends StatelessWidget {
  const OnlineContactsList({
    super.key,
    required this.data,
  });

  final List<ImageData> data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(data.length, (index) {
        final imageUrl = data[index];

        return Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                border: Border.all(
                  color: data[index].dominantColor ?? AppColors.borderDarkColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              height: 60,
              width: 60,
              child: ProfileImage(
                imageUrl: imageUrl.url,
              ),
            ),
            Text(
              names[index],
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontWeight: FontWeight.w400, color: AppColors.secondaryLight),
            ),
          ],
        );
      }),
    );
  }
}
