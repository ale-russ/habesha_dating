import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '/images.dart';
import '../../../providers/color_palett_provider.dart';
import '../../../themes/app_colors.dart';

class OnlineContacts extends ConsumerWidget {
  OnlineContacts({super.key});

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: 100,
        width: size.width,
        color: Colors.transparent,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
                images.length,
                (index) => CustomProfileImage(
                      imageUrl: images[index],
                      userName: names[index],
                    )),
          ),
        ));
  }
}

class CustomProfileImage extends ConsumerStatefulWidget {
  const CustomProfileImage({
    super.key,
    required this.imageUrl,
    required this.userName,
  });
  final String imageUrl;
  final String userName;
  @override
  ConsumerState<CustomProfileImage> createState() => _CustomProfileImageState();
}

class _CustomProfileImageState extends ConsumerState<CustomProfileImage> {
  late Future<Color> _bColor;

  Future<Color> getDominantColor(String imageUrl) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      CachedNetworkImageProvider(imageUrl),
      size: const Size(50, 50),
      maximumColorCount: 10,
    );

    return paletteGenerator.dominantColor?.color ?? Colors.transparent;
  }

  @override
  void initState() {
    super.initState();

    _bColor =
        ref.read(paletteProvider.notifier).updateDominantColor(widget.imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<Color>(
          future: _bColor,
          builder: (context, snapshot) {
            Color borderColor = snapshot.data ?? Colors.transparent;
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              padding: const EdgeInsets.all(4),
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
                  imageUrl: widget.imageUrl,
                  placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                    color: AppColors.borderLightColor,
                  )),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
        Text(
          widget.userName,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
              fontWeight: FontWeight.w400, color: AppColors.secondaryLight),
        )
      ],
    );
  }
}
