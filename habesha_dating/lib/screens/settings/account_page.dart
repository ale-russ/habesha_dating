import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habesha_dating/images.dart';

import '../../widgets/common/loader.dart';

class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Center(
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: images[0],
              fit: BoxFit.fill,
              width: 90,
              height: 90,
              placeholder: (context, url) => const Loader(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        )
      ],
    );
  }
}
