import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '/widgets/common/loader.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage(
      {super.key, required this.imageUrl, this.showPlaceHolder = true});

  final String imageUrl;
  final bool showPlaceHolder;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        fit: BoxFit.fill,
        height: 50,
        width: 50,
        imageUrl: imageUrl,
        placeholder: (context, url) =>
            !showPlaceHolder ? const Loader() : const SizedBox.shrink(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
