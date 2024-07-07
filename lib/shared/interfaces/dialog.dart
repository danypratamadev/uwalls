import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uwalls/shared/interfaces/text.dart';
import 'package:uwalls/shared/themes/colors.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/shared/themes/shortcut.dart';

class AppDialog {

  static snackbar({
    required String title, required String message,
    Color? bgColor, EdgeInsets? margin, EdgeInsets? padding, double? radius,
    Color? textColor, Duration? showDuration, Duration? animateDuration,
    SnackPosition? position, Curve? forwardCurve, Curve? reverseCurve,
    double? barBlur
    }) {
    return Get.showSnackbar(
      GetSnackBar(
        duration: showDuration ?? const Duration(seconds: 3),
        snackPosition: position ?? SnackPosition.TOP,
        animationDuration: animateDuration ?? const Duration(milliseconds: 500),
        forwardAnimationCurve: forwardCurve ?? Curves.fastOutSlowIn,
        reverseAnimationCurve: reverseCurve ?? Curves.fastOutSlowIn,
        backgroundColor: bgColor ?? AppColors.scaffoldColor,
        margin: margin ?? const EdgeInsets.symmetric(
          horizontal: AppDimens.primaryPaddingSize,
          vertical: AppDimens.tertiaryPaddingSize
        ),
        padding: padding ?? const EdgeInsets.symmetric(
          horizontal: AppDimens.primaryPaddingSize,
          vertical: AppDimens.tertiaryPaddingSize
        ),
        borderRadius: radius ?? AppDimens.quinaryRoundedCardSize,
        titleText: TitleText(
          label: title,
          textColor: textColor ?? AppColors.primaryTextColor,
          fontWeight: fontMedium,
        ),
        messageText: BodyText(
          label: message,
          textColor: (textColor ?? AppColors.primaryTextColor).withOpacity(0.7),
        ),
        barBlur: barBlur ?? 0.0,
      ),
    );
  }

}