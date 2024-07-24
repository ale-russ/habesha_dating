import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  static final light = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primaryLightColor,
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: AppColors.primaryLightColor,
      onPrimary: AppColors.primaryLightColor,
      secondary: AppColors.secondaryLight,
      onSecondary: AppColors.secondaryDark,
      error: AppColors.lightErrorColor,
      surface: AppColors.headingLightColor,
      onError: AppColors.lightErrorColor,
      onSurface: AppColors.headingLightColor,
      tertiary: AppColors.darkGreyLightColor,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5,
          color: AppColors.darkGreyLightColor),
      displayMedium: TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5,
          color: AppColors.darkGreyLightColor),
      displaySmall: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.w400,
          color: AppColors.darkGreyLightColor),
      headlineLarge: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: AppColors.darkGreyLightColor),
      headlineMedium: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w400,
          color: AppColors.darkGreyLightColor),
      headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          color: AppColors.darkGreyLightColor),
      titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: AppColors.darkGreyLightColor),
      titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
          color: AppColors.darkGreyLightColor),
      titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          color: AppColors.darkGreyLightColor),
      bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: AppColors.secondaryDark),
      bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: AppColors.darkGreyLightColor),
      bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          color: AppColors.darkGreyLightColor),
      labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
          color: AppColors.darkGreyLightColor),
      labelMedium: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
          color: AppColors.darkGreyLightColor),
      labelSmall: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
          color: AppColors.darkGreyLightColor),
    ).apply(fontFamily: "Caros"),
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
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    fontFamily: 'Caros',
  );

  // static final darkTheme = ThemeData(
  static final dark = ThemeData(
    primaryColor: AppColors.primaryDarkColor,
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      primary: AppColors.primaryDarkColor,
      secondary: AppColors.secondaryDark,
      error: AppColors.darkErrorColor,
      surface: AppColors.headingDarkColor,
      onPrimary: AppColors.primaryDarkColor,
      onSecondary: AppColors.secondaryLight,
      onError: AppColors.darkErrorColor,
      onSurface: AppColors.headingDarkColor,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 96,
          fontWeight: FontWeight.w300,
          letterSpacing: -1.5,
          color: AppColors.darkGreyDarkColor),
      displayMedium: TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5,
          color: AppColors.darkGreyDarkColor),
      displaySmall: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.w400,
          color: AppColors.darkGreyDarkColor),
      headlineLarge: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: AppColors.darkGreyDarkColor),
      headlineMedium: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w400,
          color: AppColors.darkGreyDarkColor),
      headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          color: AppColors.darkGreyDarkColor),
      titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: AppColors.darkGreyDarkColor),
      titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
          color: AppColors.darkGreyDarkColor),
      titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          color: AppColors.darkGreyDarkColor),
      bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: AppColors.secondaryLight),
      bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: AppColors.darkGreyDarkColor),
      bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          color: AppColors.darkGreyDarkColor),
      labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
          color: AppColors.darkGreyDarkColor),
      labelMedium: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
          color: AppColors.darkGreyDarkColor),
      labelSmall: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
          color: AppColors.darkGreyDarkColor),
    ).apply(fontFamily: "Caros"),
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
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    fontFamily: 'Caros',
  );
}
