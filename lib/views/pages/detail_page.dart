import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:uwalls/models/photo_model.dart';
import 'package:uwalls/shared/interfaces/button.dart';
import 'package:uwalls/shared/interfaces/image.dart';
import 'package:uwalls/shared/interfaces/text.dart';
import 'package:uwalls/shared/themes/colors.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/shared/themes/shortcut.dart';
import 'package:uwalls/views/widgets/items/detail_item.dart';
import 'package:uwalls/views/widgets/items/photo_item.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {

    final argument = Get.arguments;
    final PhotoModel photo = argument['photo'];
    final Color bgColor = argument['bgcolor'];

    final mediaApp = MediaQuery.of(context);
    final themeApp = Theme.of(context);

    Color displayColor = (bgColor.computeLuminance() < 0.5 ? AppColors.whiteTextColor : themeApp.scaffoldBackgroundColor);

    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: photo.id,
            transitionOnUserGestures: true,
            child: ImageNetwork(
              width: double.maxFinite,
              height: mediaApp.size.height,
              url: photo.urls.regular,
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Hero(
              tag: '${photo.id}@bg',
              transitionOnUserGestures: true,
              child: SmoothClipRRect(
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
                                  OverlineText(
                                    label: photo.user.username,
                                    textColor: displayColor.withOpacity(0.7),
                                  ),
                                ],
                              )
                            ),
                            AppDimens.gap12,
                            Transform.translate(
                              offset: const Offset(AppDimens.size5, 0.0),
                              child: AppIconButton(
                                icon: Icons.zoom_out_map_rounded, 
                                bgColor: bgColor,
                                iconColor: displayColor,
                                onPressed: () {
                                  
                                },
                              ),
                            )
                          ],
                        ),
                        AppDimens.gap16,
                        TitleText(
                          label: photo.altDescription,
                          fontWeight: fontMedium,
                          textColor: bgColor.computeLuminance() < 0.5 ? AppColors.whiteTextColor : themeApp.scaffoldBackgroundColor,
                        ),
                        AppDimens.gap5,
                        CaptionText(
                          label: 'Published on ${DateFormat('MMMM dd, yyyy').format(photo.created)}',
                          textColor: displayColor.withOpacity(0.7),
                        ),
                        AppDimens.gap32,
                        GridView.count(
                          crossAxisCount: 3,
                          shrinkWrap: true,
                          mainAxisSpacing: AppDimens.quinaryPaddingSize,
                          crossAxisSpacing: AppDimens.quinaryPaddingSize,
                          padding: EdgeInsets.zero,
                          childAspectRatio: 2/1.1,
                          children: [
                            DetailItem(
                              label: 'Views', 
                              value: '${photo.views}',
                              textColor: displayColor
                            ),
                            DetailItem(
                              label: 'Likes', 
                              value: '${photo.likes}',
                              textColor: displayColor
                            ),
                            DetailItem(
                              label: 'Downloads', 
                              value: '${photo.downloads}',
                              textColor: displayColor
                            ),
                          ],
                        ),
                        AppDimens.gap32,
                        SecondaryButton(
                          label: 'Download', 
                          btnColor: displayColor,
                          borderColor: Colors.white12,
                          textColor: bgColor.computeLuminance() < 0.5 ? themeApp.scaffoldBackgroundColor : AppColors.whiteTextColor,
                          onPressed: () {
                            
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: AppDimens.primaryPaddingSize,
            right: AppDimens.primaryPaddingSize,
            bottom: -AppDimens.size54,
            child: Center(
              child: PhotoItem(photo: photo, bgColor: bgColor)
            )
          )
        ],
      ),
    );
  }
}