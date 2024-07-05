import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:uwalls/shared/themes/colors.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/shared/themes/shortcut.dart';

class AppTheme {
  
  static ThemeData appTheme = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.scaffoldColor,
    colorScheme: ColorScheme.fromSwatch(
      backgroundColor: AppColors.backgroundColor,
      primarySwatch: Colors.green,
      brightness: Brightness.dark,
    ),
    primaryColor: AppColors.primaryColor,
    primarySwatch: Colors.green,
    cardColor: AppColors.backgroundColor,
    appBarTheme: AppBarTheme(
      toolbarHeight: AppDimens.appBarSize,
      backgroundColor: AppColors.scaffoldColor,
      elevation: AppDimens.quaternaryDividerSize,
      shadowColor: Colors.white30,
      scrolledUnderElevation: AppDimens.quaternaryDividerSize,
      titleTextStyle: const TextStyle(
        color: AppColors.primaryTextColor,
      ),
      iconTheme: IconThemeData(
        color: AppColors.primaryIconColor
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    ),
    actionIconTheme: ActionIconThemeData(
      backButtonIconBuilder: (context) => const Icon(Icons.arrow_back_rounded),
      closeButtonIconBuilder: (context) => const Icon(Icons.close_rounded),
      drawerButtonIconBuilder: (context) => const Icon(Icons.menu_rounded),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primaryTextColor,
    ),
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        color: AppColors.primaryTextColor,
      ),
      headlineMedium: TextStyle(
        color: AppColors.primaryTextColor,
      ),
      headlineSmall: TextStyle(
        color: AppColors.primaryTextColor,
      ),
      titleLarge: TextStyle(
        color: AppColors.primaryTextColor,
      ),
      titleMedium: TextStyle(
        color: AppColors.primaryTextColor,
      ),
      titleSmall: TextStyle(
        color: AppColors.primaryTextColor,
      ),
      bodyMedium: TextStyle(
        color: AppColors.primaryTextColor,
      ),
      bodySmall: TextStyle(
        color: AppColors.secondaryTextColor,
      ),
      labelLarge: TextStyle(
        color: AppColors.primaryTextColor,
      ),
      labelSmall: TextStyle(
        color: AppColors.tertiaryTextColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.scaffoldColor,
        disabledBackgroundColor: AppColors.dividerColor,
        disabledForegroundColor: AppColors.tertiaryTextColor,
        shape: SmoothRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.tertiaryRoundedButtonSize),
          smoothness: AppDimens.smoothnessCorner,
        ),
        textStyle: GoogleFonts.poppins(
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
      selectedIconTheme: const IconThemeData(
        color: AppColors.primaryColor,
      ),
      unselectedIconTheme: const IconThemeData(
        color: AppColors.secondaryTextColor,
      ),
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.secondaryTextColor,
      selectedLabelStyle: GoogleFonts.poppins(
        fontWeight: fontMedium,
      ),
      unselectedLabelStyle: GoogleFonts.poppins(
        fontWeight: fontMedium,
      ),
      elevation: 0.0,
    ),
    useMaterial3: false,
    visualDensity: VisualDensity.adaptivePlatformDensity
  );

}