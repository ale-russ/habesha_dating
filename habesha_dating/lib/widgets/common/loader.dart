import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../themes/app_colors.dart';

class Loader extends ConsumerWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.primaryDarkColor,
      ),
    );
  }
}
