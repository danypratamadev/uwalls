import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:uwalls/shared/themes/colors.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/shared/themes/shortcut.dart';

class PrimaryButton extends StatelessWidget {

  final double width;
  final double height;
  final String label;
  final Color? btnColor;
  final Color? textColor;
  final double? radius;
  final bool loading;
  final String? labelLoading;
  final GestureTapCallback onPressed;

  const PrimaryButton({
    super.key, 
    this.width = double.maxFinite, 
    this.height = AppDimens.buttonHeightSize, 
    required this.label,
    this.btnColor, 
    this.textColor, 
    this.radius,
    this.loading = false,
    this.labelLoading,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {

    final themeApp = Theme.of(context);

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: !loading ? onPressed : null,
        style: themeApp.elevatedButtonTheme.style?.copyWith(
          backgroundColor: WidgetStatePropertyAll(btnColor),
          foregroundColor: WidgetStatePropertyAll(textColor),
          shape: WidgetStatePropertyAll(
            SmoothRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? AppDimens.buttonHeightSize),
              smoothness: AppDimens.smoothnessCorner,
            ),
          )
        ),
        child: loading ? Row(
          mainAxisAlignment: centerMainAxis,
          children: [
            const CupertinoActivityIndicator(),
            AppDimens.gap8,
            Text(
              labelLoading ?? 'Loading...'
            ),
          ],
        ) : Text(label),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {

  final double width;
  final double height;
  final String label;
  final Color? btnColor;
  final Color? borderColor;
  final Color? textColor;
  final double? radius;
  final Widget? leading;
  final bool loading;
  final String? labelLoading;
  final GestureTapCallback onPressed;

  const SecondaryButton({
    super.key, 
    this.width = double.maxFinite, 
    this.height = AppDimens.buttonHeightSize, 
    required this.label,
    this.btnColor, 
    this.borderColor, 
    this.textColor, 
    this.radius,
    this.leading,
    this.loading = false,
    this.labelLoading,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {

    final themeApp = Theme.of(context);

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: !loading ? onPressed : null,
        style: themeApp.elevatedButtonTheme.style?.copyWith(
          backgroundColor: !loading ? WidgetStatePropertyAll(btnColor ?? themeApp.primaryColor.withOpacity(0.1)) : 
            WidgetStatePropertyAll(themeApp.dividerColor),
          foregroundColor: !loading ? WidgetStatePropertyAll(textColor ?? themeApp.primaryColor) :
            const WidgetStatePropertyAll(AppColors.tertiaryTextColor),
          shape: WidgetStatePropertyAll(
            SmoothRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? AppDimens.buttonHeightSize),
              smoothness: AppDimens.smoothnessCorner,
              side: BorderSide(
                width: AppDimens.primaryDividerSize,
                color: !loading ? (borderColor ?? themeApp.primaryColor) : themeApp.dividerColor,
              )
            ),
          )
        ),
        child: loading ? Row(
          mainAxisAlignment: centerMainAxis,
          children: [
            const CupertinoActivityIndicator(),
            AppDimens.gap8,
            Text(
              labelLoading ?? 'Loading...'
            ),
          ],
        ) : Stack(
          children: [
            Positioned(
              left: 0.0,
              top: 0.0,
              bottom: 0.0,
              child: Center(
                child: leading ?? const SizedBox()
              ),
            ),
            Center(
              child: Text(label)
            ),
          ],
        ),
      ),
    );
  }
}


class AppIconButton extends StatelessWidget {

  final double? width;
  final double? height;
  final IconData icon;
  final double? iconSize;
  final Color? iconColor;
  final Color? bgColor;
  final double? radius;
  final double? borderWidth;
  final Color? borderColor;
  final GestureTapCallback onPressed;

  const AppIconButton({
    super.key, 
    this.width, 
    this.height, 
    required this.icon, 
    this.iconSize, 
    this.iconColor, 
    this.bgColor,
    this.radius,
    this.borderWidth,
    this.borderColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

    final themeApp = Theme.of(context);

    return Bounce(
      duration: const Duration(milliseconds: 100),
      onPressed: onPressed,
      child: Material(
        color: bgColor ?? Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? AppDimens.size20),
          side: BorderSide(
            width: borderWidth ?? 0.0,
            color: borderColor ?? Colors.transparent
          ),
        ),
        child: SizedBox(
          width: width ?? AppDimens.iconButtonSize,
          height: height ?? AppDimens.iconButtonSize,
          child: Icon(
            icon,
            size: iconSize ?? AppDimens.secondaryIconSize,
            color: iconColor ?? themeApp.iconTheme.color
          ),
        ),
      ),
    );
  }
}