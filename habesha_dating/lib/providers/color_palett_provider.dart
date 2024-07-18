// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:riverpod/riverpod.dart';

import '/themes/app_colors.dart';

final colorProvider =
    StateNotifierProvider<ColorNotifier, Map<String, Color>>((ref) {
  return ColorNotifier();
});

class ColorNotifier extends StateNotifier<Map<String, Color>> {
  ColorNotifier() : super({});

  Future<void> getDominantColor(String imageUrl) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      CachedNetworkImageProvider(imageUrl),
      size: const Size(50, 50),
      maximumColorCount: 10,
    );

    final dominantColor =
        paletteGenerator.dominantColor?.color ?? AppColors.borderLightColor;

    // Update the state with the new color for the given image URL
    state = {
      ...state,
      imageUrl: dominantColor,
    };
  }
}
