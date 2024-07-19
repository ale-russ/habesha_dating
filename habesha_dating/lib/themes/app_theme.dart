import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primaryLightColor,
    colorScheme: const ColorScheme.light(
      brightness: Brightness.dark,
      primary: AppColors.primaryLightColor,
      secondary: AppColors.secondaryLight,
      error: AppColors.lightErrorColor,
    ),
    textTheme: const TextTheme(
      bodyLarge:
          TextStyle(color: AppColors.darkGreyLightColor, fontFamily: 'Caros'),
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

    /* splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory, */
  );

  static final darkTheme = ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.primaryDarkColor,
      colorScheme: const ColorScheme.dark(
        brightness: Brightness.dark,
        primary: AppColors.primaryDarkColor,
        secondary: AppColors.secondaryDark,
        error: AppColors.darkErrorColor,
      ),
      textTheme: const TextTheme(
        bodyLarge:
            TextStyle(color: AppColors.darkGreyDarkColor, fontFamily: 'Caros'),
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
      fontFamily: 'Caros');
}
