import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:uwalls/controllers/app_controller.dart';
import 'package:uwalls/models/photo_model.dart';
import 'package:uwalls/shared/interfaces/image.dart';
import 'package:uwalls/shared/routes/routes.dart';
import 'package:uwalls/shared/routes/routes_navigator.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/views/widgets/items/photo_item.dart';

class PhotoCard extends StatelessWidget {


  final int action;
  final PhotoModel photo;

  const PhotoCard({super.key, required this.action, required this.photo});

  @override
  Widget build(BuildContext context) {

    final appvm = Get.find<AppController>();

    Color bgColor = Color(int.parse('FF${photo.color.replaceAll('#', '')}', radix: 16)).withOpacity(0.5);

    return Bounce(
      duration: const Duration(milliseconds: 100),
      onPressed: () {
        if(appvm.fullPreview) {
          appvm.onChangePreview(value: false);
        }
        if(action == 20) {
          FocusScope.of(context).requestFocus(FocusNode());
        }
        AppNavigator.push(route: AppRoutes.detailRoute, argument: {'photo': photo, 'bgcolor': bgColor});
      },
      child: Stack(
        children: [
          Positioned(
            left: 0.0,
            right: 0.0,
            top: 0.0,
            bottom: 0.0,
            child: Hero(
              tag: photo.id,
              transitionOnUserGestures: true,
              child: SmoothClipRRect(
                borderRadius: BorderRadius.circular(AppDimens.quaternaryRoundedCardSize),
                smoothness: AppDimens.smoothnessCorner,
                child: ImageNetwork(
                  width: double.maxFinite,
                  url: photo.urls.small,
                ),
              ),
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
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(AppDimens.quaternaryRoundedCardSize),
                  bottomRight: Radius.circular(AppDimens.quaternaryRoundedCardSize)
                ),
                smoothness: AppDimens.smoothnessCorner,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Material(
                    color: bgColor,
                    child: const SizedBox(
                      width: double.maxFinite,
                      height: AppDimens.size54,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: PhotoItem(photo: photo, bgColor: bgColor)
          )
        ],
      ),
    );
  }
}