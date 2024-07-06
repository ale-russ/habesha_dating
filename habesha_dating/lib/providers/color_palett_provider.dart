import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:palette_generator/palette_generator.dart';

import '/themes/app_colors.dart';

final paletteProvider =
    StateNotifierProvider<ColorPaletteNotifier, Map<String, Color>>((ref) {
  return ColorPaletteNotifier();
});

class ColorPaletteNotifier extends StateNotifier<Map<String, Color>> {
  ColorPaletteNotifier() : super({});

  Future<Color> updateDominantColor(String imageUrl) async {
    if (state.containsKey(imageUrl)) {
      return state[imageUrl]!;
    } else {
      final PaletteGenerator paletteGenerator =
          await PaletteGenerator.fromImageProvider(
              CachedNetworkImageProvider(imageUrl),
              size: const Size(50, 50),
              maximumColorCount: 10);

      final color =
          paletteGenerator.dominantColor?.color ?? AppColors.borderLightColor;
      state = {...state, imageUrl: color};
      return color;
    }
  }
}
