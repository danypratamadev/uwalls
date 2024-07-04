import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:uwalls/shared/interfaces/text.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/shared/themes/shortcut.dart';

class AlertLoading extends StatelessWidget {

  final bool? animating;

  const AlertLoading({super.key, this.animating});

  @override
  Widget build(BuildContext context) {

    final themeApp = Theme.of(context);

    return SmoothClipRRect(
      borderRadius: BorderRadius.circular(AppDimens.quinaryRoundedCardSize),
      smoothness: AppDimens.smoothnessCorner,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Material(
          color: themeApp.scaffoldBackgroundColor.withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.size10,
              vertical: AppDimens.size6
            ),
            child: Row(
              mainAxisSize: minSize,
              children: [
                CupertinoActivityIndicator(
                  radius: AppDimens.size7,
                  animating: animating ?? true,
                  color: themeApp.primaryColor,
                ),
                AppDimens.gap8,
                const CaptionText(
                  label: 'LOADING',
                  fontWeight: fontMedium,
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}