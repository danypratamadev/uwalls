import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:uwalls/controllers/app_controller.dart';
import 'package:uwalls/models/photo_model.dart';
import 'package:uwalls/shared/interfaces/button.dart';
import 'package:uwalls/shared/interfaces/image.dart';
import 'package:uwalls/shared/interfaces/text.dart';
import 'package:uwalls/shared/routes/routes.dart';
import 'package:uwalls/shared/routes/routes_navigator.dart';
import 'package:uwalls/shared/themes/colors.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/shared/themes/shortcut.dart';
import 'package:uwalls/shared/utils/stateid.dart';
import 'package:uwalls/views/widgets/items/detail_item.dart';

class DetailPhotoCard extends StatelessWidget {
  const DetailPhotoCard({super.key});

  @override
  Widget build(BuildContext context) {

    final mediaApp = MediaQuery.of(context);
    final themeApp = Theme.of(context);

    final argument = Get.arguments;
    final PhotoModel photo = argument['photo'];
    final Color bgColor = argument['bgcolor'];

    Color displayColor = (bgColor.computeLuminance() < 0.5 ? AppColors.whiteTextColor : themeApp.scaffoldBackgroundColor);

    return GetBuilder<AppController>(
      id: AppStateId.fullPreview,
      builder: (value) => AnimatedPositioned(
        left: 0.0,
        right: 0.0,
        bottom: value.fullPreview ? -mediaApp.size.height * 0.5 : 0.0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastEaseInToSlowEaseOut,
        child: Hero(
          tag: '${photo.id}@bg',
          transitionOnUserGestures: true,
          child: SmoothClipRRect(
            borderRadius: BorderRadius.circular(AppDimens.quaternaryRoundedCardSize),
            smoothness: AppDimens.smoothnessCorner,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
              child: Material(
                color: bgColor,
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(
                    left: AppDimens.primaryPaddingSize,
                    right: AppDimens.primaryPaddingSize,
                    top: AppDimens.primaryPaddingSize,
                    bottom: (mediaApp.viewPadding.bottom + AppDimens.secondaryPaddingSize),
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Row(
                      children: [
                        ClipOval(
                          child: ImageNetwork(
                            url: photo.user.avatar.medium,
                            width: AppDimens.size40,
                            height: AppDimens.size40,
                          ),
                        ),
                        AppDimens.gap16,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: startCrossAxis,
                            children: [
                              BodyText(
                                label: photo.user.name,
                                textColor: displayColor,
                                fontWeight: fontMedium,
                              ),
                              AppDimens.gap2,
                              OverlineText(
                                label: photo.user.username,
                                textColor: displayColor.withOpacity(0.7),
                              ),
                            ],
                          )
                        ),
                        AppDimens.gap12,
                        Transform.translate(
                          offset: const Offset(AppDimens.size3, 0.0),
                          child: Row(
                            mainAxisSize: minSize,
                            children: [
                              AppIconButton(
                                icon: IconsaxPlusBold.heart, 
                                bgColor: bgColor,
                                iconColor: displayColor.withOpacity(0.6),
                                onPressed: () => AppNavigator.push(
                                  route: AppRoutes.previewRoute,
                                  argument: {
                                    'id': photo.id,
                                    'url': photo.urls,
                                  }
                                ),
                              ),
                              AppDimens.gap10,
                              AppIconButton(
                                icon: IconsaxPlusBold.archive_1, 
                                bgColor: bgColor,
                                iconColor: displayColor.withOpacity(0.6),
                                onPressed: () => AppNavigator.push(
                                  route: AppRoutes.previewRoute,
                                  argument: {
                                    'id': photo.id,
                                    'url': photo.urls,
                                  }
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    AppDimens.gap24,
                    CaptionText(
                      label: 'Description:',
                      textColor: displayColor.withOpacity(0.6),
                    ),
                    AppDimens.gap3,
                    BodyText(
                      label: photo.altDescription,
                      textColor: displayColor,
                    ),
                    AppDimens.gap20,
                    GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      mainAxisSpacing: AppDimens.quinaryPaddingSize,
                      crossAxisSpacing: AppDimens.quinaryPaddingSize,
                      padding: EdgeInsets.zero,
                      childAspectRatio: 2/1.4,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        DetailItem(
                          label: 'Views', 
                          value: '${photo.views}',
                          textColor: displayColor,
                        ),
                        DetailItem(
                          label: 'Likes', 
                          value: '${photo.likes}',
                          textColor: displayColor,
                        ),
                        DetailItem(
                          label: 'Downloads', 
                          value: '${photo.downloads}',
                          textColor: displayColor,
                        ),
                      ],
                    ),
                    AppDimens.gap24,
                    PrimaryButton(
                      label: 'Download', 
                      btnColor: displayColor,
                      textColor: bgColor.computeLuminance() < 0.5 ? themeApp.scaffoldBackgroundColor : AppColors.whiteTextColor,
                      onPressed: () {
                        
                      },
                    ),
                    // AppDimens.gap20,
                    // CaptionText(
                    //   label: 'Published on ${DateFormat('MMMM dd, yyyy').format(photo.created)}',
                    //   textColor: displayColor.withOpacity(0.7),
                    //   textAlign: centerText,
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}