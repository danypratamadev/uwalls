import 'package:flutter/material.dart';
import 'package:uwalls/models/photo_model.dart';
import 'package:uwalls/shared/interfaces/other.dart';
import 'package:uwalls/shared/interfaces/text.dart';
import 'package:uwalls/shared/themes/colors.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/shared/themes/shortcut.dart';

class PhotoItem extends StatelessWidget {

  final int action;
  final PhotoModel photo;
  final Color bgColor;

  const PhotoItem({super.key, required this.action, required this.photo, required this.bgColor});

  @override
  Widget build(BuildContext context) {

    final themeApp = Theme.of(context);

    Color displayColor = (bgColor.computeLuminance() < 0.5 ? AppColors.whiteTextColor : themeApp.scaffoldBackgroundColor);

    return SizedBox(
      width: double.maxFinite,
      height: AppDimens.size54,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.quaternaryPaddingSize,
          vertical: AppDimens.quinaryPaddingSize
        ),
        child: Column(
          crossAxisAlignment: startCrossAxis,
          mainAxisAlignment: centerMainAxis,
          children: [
            Hero(
              tag: '${photo.id}@title@$action',
              transitionOnUserGestures: true,
              child: CaptionText(
                label: photo.altDescription,
                fontWeight: fontMedium,
                textColor: bgColor.computeLuminance() < 0.5 ? AppColors.whiteTextColor : themeApp.scaffoldBackgroundColor,
                maxLines: 1,
              ),
            ),
            AppDimens.gap2,
            Hero(
              tag: '${photo.id}@caption@$action',
              transitionOnUserGestures: true,
              child: Row(
                children: [
                  OverlineText(
                    label: '${photo.likes} likes',
                    textColor: displayColor.withOpacity(0.7),
                    maxLines: 1,
                  ),
                  DotSeparated(color: displayColor.withOpacity(0.3),),
                  Flexible(
                    child: OverlineText(
                      label: photo.user.username,
                      textColor: displayColor.withOpacity(0.7),
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}