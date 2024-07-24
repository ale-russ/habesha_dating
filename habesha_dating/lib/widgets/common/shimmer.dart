import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../themes/app_colors.dart';

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.darkGreyDarkColor,
      highlightColor: AppColors.darkGreyLightColor,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.all(0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(height: 4),
                      SizedBox(height: 8, width: 60),
                    ],
                  ),
                )),
      ),
    );
  }
}

// Shimmer.fromColors(
//                   baseColor: Colors.grey[300]!,
//                   highlightColor: Colors.grey[100]!,
//                   child: Container(
//                     height: 32.0,
//                     width: 180.0,
//                     color: Colors.grey[300],
//                   ),
//                 )