import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:uwalls/models/explore_model.dart';
import 'package:uwalls/shared/interfaces/image.dart';
import 'package:uwalls/shared/interfaces/text.dart';
import 'package:uwalls/shared/themes/colors.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/shared/themes/shortcut.dart';

class ExploreGridview extends StatelessWidget {

  final List<ExploreModel> listExplore;

  const ExploreGridview({super.key, required this.listExplore});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: AppDimens.primaryPaddingSize,
        crossAxisSpacing: AppDimens.primaryPaddingSize,
        childAspectRatio: 3/4,
      ), 
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: listExplore.length,
      itemBuilder: (context, index) => ExploreGridItem(explore: listExplore[index]),
    );
  }
}

class ExploreGridItem extends StatelessWidget {

  final ExploreModel explore;

  const ExploreGridItem({super.key, required this.explore});

  @override
  Widget build(BuildContext context) {

    final themeApp = Theme.of(context);

    Color bgColor = Color(int.parse('FF${explore.color.replaceAll('#', '')}', radix: 16)).withOpacity(0.5);

    return SmoothClipRRect(
      borderRadius: BorderRadius.circular(AppDimens.quaternaryRoundedCardSize),
      smoothness: AppDimens.smoothnessCorner,
      child: Stack(
        children: [
          ImageNetwork(
            width: double.maxFinite,
            url: explore.urls.thumb,
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Material(
                  color: bgColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.quaternaryPaddingSize,
                      vertical: AppDimens.quinaryPaddingSize
                    ),
                    child: Column(
                      crossAxisAlignment: startCrossAxis,
                      children: [
                        CaptionText(
                          label: explore.user.name,
                          fontWeight: fontMedium,
                          textColor: bgColor.computeLuminance() < 0.5 ? AppColors.whiteTextColor : themeApp.scaffoldBackgroundColor,
                          maxLines: 1,
                        ),
                        AppDimens.gap2,
                        OverlineText(
                          label: '${explore.likes} likes',
                          textColor: (bgColor.computeLuminance() < 0.5 ? AppColors.whiteTextColor : themeApp.scaffoldBackgroundColor).withOpacity(0.7),
                          maxLines: 1,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}