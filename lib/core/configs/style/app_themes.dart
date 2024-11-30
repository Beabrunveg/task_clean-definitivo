import 'package:flutter/material.dart';
import 'package:taks_daily_app/core/configs/configs.dart';

/// App themes.
ThemeData getLightTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.getMaterialColorFromColor(AppColors.white),
    colorScheme: const ColorScheme.light(
      primary: AppColors.blue50,
      surface: AppColors.bg,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.blue50,
      colorScheme: ColorScheme.light(primary: AppColors.blue50),
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyleApp.h1Header.black,
      displayMedium: TextStyleApp.h2.black,
      displaySmall: TextStyleApp.h2BSmall.black,
      headlineLarge: TextStyleApp.h1.black,
      headlineMedium: TextStyleApp.h1High.black,
      headlineSmall: TextStyleApp.h1Header.black,
      titleLarge: TextStyleApp.bodyBold.black,
      titleMedium: TextStyleApp.body.black,
      titleSmall: TextStyleApp.body.black,
      bodyLarge: TextStyleApp.body.black,
      bodySmall: TextStyleApp.body.black,
      labelLarge: TextStyleApp.body.black,
      labelMedium: TextStyleApp.body.black,
      labelSmall: TextStyleApp.body.black,
    ),
    primaryTextTheme: TextTheme(
      displayLarge: TextStyleApp.h1Header.black,
      displayMedium: TextStyleApp.h2.black,
      displaySmall: TextStyleApp.h2BSmall.black,
      headlineLarge: TextStyleApp.h1Header.black,
      headlineMedium: TextStyleApp.h1High.black,
      headlineSmall: TextStyleApp.h1Header.black,
      titleLarge: TextStyleApp.bodyBold.black,
      titleMedium: TextStyleApp.body.black,
      titleSmall: TextStyleApp.body.black,
      bodyLarge: TextStyleApp.body.black,
      bodySmall: TextStyleApp.body.black,
      labelLarge: TextStyleApp.body.black,
      labelMedium: TextStyleApp.body.black,
      labelSmall: TextStyleApp.body.black,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(AppColors.blue50),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.bg,
    ),
  );
}

/// App themes.
ThemeData getDarkTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColorDark: AppColors.getMaterialColorFromColor(AppColors.white),
    colorScheme: ColorScheme.dark(
      primary: AppColors.white,
      surface: AppColors.black.withOpacity(0.8),
    ),
    scaffoldBackgroundColor: AppColors.black,
    textTheme: TextTheme(
      displayLarge: TextStyleApp.h1Header.white,
      displayMedium: TextStyleApp.h2.white,
      displaySmall: TextStyleApp.h2BSmall.white,
      headlineLarge: TextStyleApp.h1.white,
      headlineMedium: TextStyleApp.h1High.white,
      headlineSmall: TextStyleApp.h1Header.white,
      titleLarge: TextStyleApp.bodyBold.white,
      titleMedium: TextStyleApp.body.white,
      titleSmall: TextStyleApp.body.white,
      bodyLarge: TextStyleApp.body.white,
      bodySmall: TextStyleApp.body.white,
      labelLarge: TextStyleApp.body.white,
      labelMedium: TextStyleApp.body.white,
      labelSmall: TextStyleApp.body.white,
    ),
    primaryTextTheme: TextTheme(
      displayLarge: TextStyleApp.h1Header.white,
      displayMedium: TextStyleApp.h2.white,
      displaySmall: TextStyleApp.h2BSmall.white,
      headlineLarge: TextStyleApp.h1Header.white,
      headlineMedium: TextStyleApp.h1High.white,
      headlineSmall: TextStyleApp.h1Header.white,
      titleLarge: TextStyleApp.bodyBold.white,
      titleMedium: TextStyleApp.body.white,
      titleSmall: TextStyleApp.body.white,
      bodyLarge: TextStyleApp.body.white,
      bodySmall: TextStyleApp.body.white,
      labelLarge: TextStyleApp.body.white,
      labelMedium: TextStyleApp.body.white,
      labelSmall: TextStyleApp.body.white,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.blue50,
      colorScheme: ColorScheme.dark(primary: AppColors.blue50),
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(AppColors.blue50),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.blue50),
        shadowColor: WidgetStateProperty.all(AppColors.blue50),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.black.withOpacity(0.8),
      foregroundColor: AppColors.white,
    ),
  );
}
