import 'package:flutter/services.dart';
import 'package:habesha_dating/themes/app_colors.dart';

void setSystemUIOverlayStyle({bool isInDarkMode = true}) async {
  if (isInDarkMode) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: DarkModeColors.primaryDarkColor,
        systemNavigationBarColor: DarkModeColors.primaryDarkColor,
        systemNavigationBarDividerColor: DarkModeColors.primaryDarkColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  } else {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: LightModeColors.primaryLightColor,
        systemNavigationBarColor: LightModeColors.primaryLightColor,
        systemNavigationBarDividerColor: LightModeColors.primaryLightColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
