import 'package:flutter/material.dart';
import 'package:uwalls/models/collection_model.dart';
import 'package:uwalls/shared/interfaces/other.dart';
import 'package:uwalls/shared/interfaces/text.dart';
import 'package:uwalls/shared/themes/colors.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/shared/themes/shortcut.dart';

class CollectionItem extends StatelessWidget {

  final CollectionModel collection;
  final Color bgColor;

  const CollectionItem({super.key, required this.collection, required this.bgColor});

  @override
  Widget build(BuildContext context) {

    final themeApp = Theme.of(context);

    Color displayColor = (bgColor.computeLuminance() < 0.5 ? AppColors.whiteTextColor : themeApp.scaffoldBackgroundColor);

    return SizedBox(
      width: double.maxFinite,
      height: AppDimens.size65,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.primaryPaddingSize,
          vertical: AppDimens.quinaryPaddingSize
        ),
        child: Column(
          crossAxisAlignment: startCrossAxis,
          mainAxisAlignment: centerMainAxis,
          children: [
            Hero(
              tag: '${collection.id}@title',
              transitionOnUserGestures: true,
              child: SubtitleText(
                label: collection.title,
                fontWeight: fontMedium,
                textColor: displayColor,
                maxLines: 1,
              ),
            ),
            AppDimens.gap2,
            Hero(
              tag: '${collection.id}@caption',
              transitionOnUserGestures: true,
              child: Row(
                children: [
                  OverlineText(
                    label: collection.user.username,
                    textColor: displayColor.withOpacity(0.7),
                    maxLines: 1,
                  ),
                  DotSeparated(color: displayColor.withOpacity(0.3),),
                  Flexible(
                    child: OverlineText(
                      label: '${collection.totalPhoto} wallpapers',
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