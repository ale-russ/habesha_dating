import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:palette_generator/palette_generator.dart';

import '../models/images_model.dart';
import '../themes/app_colors.dart';
import 'auth/auth_provider.dart';

final imageUrlProvider =
    StateNotifierProvider<ImageNotifier, AsyncValue<List<ImageData>>>(
        (ref) => ImageNotifier(ref));

class ImageNotifier extends StateNotifier<AsyncValue<List<ImageData>>> {
  ImageNotifier(this._ref) : super(const AsyncValue.loading()) {
    fetchImages();
  }
  final Ref _ref;

  Future<void> fetchImages() async {
    state = const AsyncValue.loading();

    try {
      final urls = await _ref.read(authRepositoryProvider).fetchImageUrl();
      final images = urls.map((url) => ImageData(url)).toList();
      state = AsyncValue.data(images);
      _extractColors(images);
    } catch (err, stackTrace) {
      state = AsyncValue.error(err, stackTrace);
      rethrow;
    }
  }

  Future<void> _extractColors(List<ImageData> images) async {
    for (var i = 0; i < images.length; i++) {
      final paletteGenerator = await PaletteGenerator.fromImageProvider(
        CachedNetworkImageProvider(images[i].url),
        size: const Size(50, 50),
        maximumColorCount: 10,
      );
      final dominantColor =
          paletteGenerator.dominantColor?.color ?? AppColors.borderLightColor;
      images[i] = ImageData(images[i].url, dominantColor: dominantColor);
      state = AsyncValue.data(List.from(images));
    }
  }
}
