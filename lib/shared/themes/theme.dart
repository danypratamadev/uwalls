import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:uwalls/shared/themes/colors.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/shared/themes/shortcut.dart';

class AppTheme {
  
  static ThemeData appTheme = ThemeData(
    fontFamily: GoogleFonts.roboto().fontFamily,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.scaffoldColor,
    colorScheme: ColorScheme.fromSwatch(
      backgroundColor: AppColors.backgroundColor,
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
    ),
    primaryColor: AppColors.primaryColor,
    primarySwatch: Colors.blue,
    cardColor: AppColors.backgroundColor,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primaryTextColor,
    ),
    textTheme: TextTheme(
      displaySmall: TextStyle(
        color: AppColors.primaryTextColor
      ),
      headlineMedium: TextStyle(
        color: AppColors.primaryTextColor
      ),
      headlineSmall: TextStyle(
        color: AppColors.primaryTextColor
      ),
      titleLarge: TextStyle(
        color: AppColors.primaryTextColor
      ),
      titleMedium: TextStyle(
        color: AppColors.primaryTextColor
      ),
      bodyLarge: TextStyle(
        color: AppColors.primaryTextColor
      ),
      bodyMedium: TextStyle(
        color: AppColors.primaryTextColor
      ),
      bodySmall: const TextStyle(
        color: AppColors.secondaryTextColor
      ),
      labelLarge: TextStyle(
        color: AppColors.primaryTextColor
      ),
      labelSmall: const TextStyle(
        color: AppColors.tertiaryTextColor
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteTextColor,
        disabledBackgroundColor: AppColors.dividerColor,
        disabledForegroundColor: AppColors.tertiaryTextColor,
        shape: SmoothRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.tertiaryRoundedButtonSize),
          smoothness: AppDimens.smoothnessCorner,
        ),
        textStyle: GoogleFonts.poppins(
          fontSize: 15.0,
          fontWeight: fontSemiBold,
        ),
        elevation: 0.0,
        shadowColor: Colors.transparent,
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.secondaryIconColor,
      size: AppDimens.secondaryIconSize
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.scaffoldColor,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(
        color: AppColors.primaryColor,
      ),
      unselectedIconTheme: const IconThemeData(
        color: AppColors.secondaryTextColor,
      ),
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.secondaryTextColor,
      selectedLabelStyle: GoogleFonts.poppins(
        fontSize: AppDimens.bottomNavTextSize,
        fontWeight: fontMedium,
      ),
      unselectedLabelStyle: GoogleFonts.poppins(
        fontSize: AppDimens.bottomNavTextSize,
        fontWeight: fontMedium,
      ),
      elevation: 0.0,
    ),
    useMaterial3: false,
    visualDensity: VisualDensity.adaptivePlatformDensity
  );

}