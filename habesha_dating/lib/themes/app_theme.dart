import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primaryLightColor,
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: AppColors.primaryLightColor,
      onPrimary: AppColors.primaryLightColor,
      secondary: AppColors.secondaryLight,
      onSecondary: AppColors.secondaryLight,
      error: AppColors.lightErrorColor,
      surface: AppColors.headingLightColor,
      onError: AppColors.lightErrorColor,
      onSurface: AppColors.headingLightColor,
      tertiary: AppColors.darkGreyLightColor,
      outline: AppColors.darkGreyLightColor,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          color: AppColors.secondaryDark,
          fontSize: 68,
          fontWeight: FontWeight.w600),
      headlineMedium: TextStyle(
          color: AppColors.secondaryDark,
          fontSize: 40,
          fontWeight: FontWeight.w500),
      headlineSmall: TextStyle(
          color: AppColors.secondaryDark,
          fontSize: 20,
          fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(color: AppColors.secondaryDark, fontSize: 20),
      bodyMedium: TextStyle(color: AppColors.secondaryDark, fontSize: 18),
      bodySmall: TextStyle(color: AppColors.secondaryDark, fontSize: 16),
      labelLarge: TextStyle(color: AppColors.secondaryDark, fontSize: 16),
      labelMedium: TextStyle(color: AppColors.secondaryDark, fontSize: 14),
      labelSmall: TextStyle(color: AppColors.darkGreyLightColor, fontSize: 12),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primaryLightColor,
      textTheme: ButtonTextTheme.primary,
      disabledColor: AppColors.disabledLightColor,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        color: AppColors.primaryDarkColor,
        fontSize: 15,
        height: 14,
        fontWeight: FontWeight.w500,
      ),
      floatingLabelStyle:
          TextStyle(color: AppColors.primaryLightColor, fontSize: 12),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      errorStyle: TextStyle(
          color: AppColors.lightErrorColor,
          fontSize: 12,
          fontWeight: FontWeight.w200),
      errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightErrorColor)),
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.passwordBorderLightColor,
          width: 0.5,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.passwordBorderLightColor,
          width: 0.5,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.passwordBorderLightColor,
          width: 0.5,
        ),
      ),
    ),
    fontFamily: 'Caros',
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primaryDarkColor,
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      primary: AppColors.primaryDarkColor,
      secondary: AppColors.secondaryDark,
      onSecondary: AppColors.darkAddIconBorderColor,
      error: AppColors.darkErrorColor,
      surface: AppColors.headingDarkColor,
      onPrimary: AppColors.primaryDarkColor,
      onError: AppColors.darkErrorColor,
      onSurface: AppColors.headingDarkColor,
      tertiary: AppColors.darkGreyDarkColor,
      outline: AppColors.darkGreyDarkColor,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          color: AppColors.secondaryLight,
          fontSize: 68,
          fontWeight: FontWeight.w600),
      headlineMedium: TextStyle(
          color: AppColors.secondaryLight,
          fontSize: 40,
          fontWeight: FontWeight.w500),
      headlineSmall: TextStyle(
          color: AppColors.secondaryLight,
          fontSize: 20,
          fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(color: AppColors.secondaryLight, fontSize: 20),
      bodyMedium: TextStyle(color: AppColors.secondaryLight, fontSize: 18),
      bodySmall: TextStyle(color: AppColors.secondaryLight, fontSize: 16),
      labelLarge: TextStyle(color: AppColors.secondaryLight, fontSize: 16),
      labelMedium: TextStyle(color: AppColors.secondaryLight, fontSize: 14),
      labelSmall: TextStyle(color: AppColors.darkGreyDarkColor, fontSize: 12),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primaryDarkColor,
      textTheme: ButtonTextTheme.primary,
      disabledColor: AppColors.disabledDarkColor,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
          color: AppColors.darkGreenColor,
          height: 14,
          fontSize: 15,
          fontWeight: FontWeight.w500),
      floatingLabelStyle:
          TextStyle(color: AppColors.primaryLightColor, fontSize: 14),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      errorStyle: TextStyle(
          color: AppColors.darkErrorColor,
          fontSize: 12,
          fontWeight: FontWeight.w200),
      errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightErrorColor)),
      border: UnderlineInputBorder(
        borderSide:
            BorderSide(color: AppColors.passwordBorderDarkColor, width: 0.5),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide:
            BorderSide(color: AppColors.passwordBorderDarkColor, width: 0.5),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide:
            BorderSide(color: AppColors.passwordBorderDarkColor, width: 0.5),
      ),
    ),
    fontFamily: 'Caros',
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
  );
}
