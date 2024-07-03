import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:uwalls/shared/interfaces/text.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/shared/themes/shortcut.dart';

class AlertLoading extends StatelessWidget {
  const AlertLoading({super.key});

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
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimens.size10,
              vertical: AppDimens.size6
            ),
            child: Row(
              mainAxisSize: minSize,
              children: [
                CupertinoActivityIndicator(
                  radius: AppDimens.size7,
                ),
                AppDimens.gap8,
                CaptionText(
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