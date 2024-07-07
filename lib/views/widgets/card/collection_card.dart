import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:uwalls/models/collection_model.dart';
import 'package:uwalls/shared/interfaces/image.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/views/widgets/items/collection_item.dart';

class CollectionCard extends StatelessWidget {

  final CollectionModel collection;

  const CollectionCard({super.key, required this.collection});

  @override
  Widget build(BuildContext context) {

    Color bgColor = Color(int.parse('FF${collection.cover.color.replaceAll('#', '')}', radix: 16));

    return Bounce(
      duration: const Duration(milliseconds: 100),
      onPressed: () {

      },
      child: Stack(
        children: [
          Positioned(
            left: 0.0,
            right: 0.0,
            top: 0.0,
            bottom: 0.0,
            child: Hero(
              tag: collection.id,
              transitionOnUserGestures: true,
              child: SmoothClipRRect(
                borderRadius: BorderRadius.circular(AppDimens.quaternaryRoundedCardSize),
                smoothness: AppDimens.smoothnessCorner,
                child: ImageNetwork(
                  width: double.maxFinite,
                  url: collection.cover.urls.small,
                  chacheWidth: AppDimens.size100,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Hero(
              tag: '${collection.id}@bg',
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
                    color: bgColor.withOpacity(0.5),
                    child: const SizedBox(
                      width: double.maxFinite,
                      height: AppDimens.size65,
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
            child: CollectionItem(collection: collection, bgColor: bgColor)
          )
        ],
      ),
    );
  }
}