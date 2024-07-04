import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:uwalls/shared/themes/dimens.dart';

class RoundedCard extends StatelessWidget {

  final double? radius;
  final EdgeInsets? padding;
  final Color? lightBgColor;
  final Color? darkBgColor;
  final Color? darkBorderColor;
  final Color? lightBorderColor;
  final LinearGradient? gradientBgColor;
  final Widget child;

  const RoundedCard({
    super.key,
    this.radius,
    this.padding,
    this.lightBgColor,
    this.darkBgColor,
    this.darkBorderColor,
    this.lightBorderColor,
    this.gradientBgColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {

    final themeApp = Theme.of(context);

    return SmoothClipRRect(
      smoothness: AppDimens.smoothnessCorner,
      borderRadius: BorderRadius.circular(radius ?? AppDimens.quaternaryRoundedCardSize),
      child: Container(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: AppDimens.secondaryPaddingSize, vertical: AppDimens.tertiaryPaddingSize),
        decoration: BoxDecoration(
          color: gradientBgColor == null ? themeApp.cardColor : null,
          gradient: gradientBgColor,
        ),
        child: child,
      ),
    );
  }
}