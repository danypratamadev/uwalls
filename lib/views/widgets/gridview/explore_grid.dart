import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uwalls/controllers/unsplash_controller.dart';
import 'package:uwalls/data/endpoint/api_status.dart';
import 'package:uwalls/shared/interfaces/text.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/shared/utils/stateid.dart';
import 'package:uwalls/views/widgets/card/photo_card.dart';

class ExploreGrid extends StatelessWidget {
  const ExploreGrid({super.key});

  @override
  Widget build(BuildContext context) {

    final mediaApp = MediaQuery.of(context);

    final topPadding = (mediaApp.viewPadding.top + (Platform.isAndroid ? kToolbarHeight : AppDimens.appBarSize) + AppDimens.primaryPaddingSize);
    final bottomPadding = (mediaApp.viewPadding.bottom + kBottomNavigationBarHeight + AppDimens.primaryPaddingSize);

    return GetBuilder<UnsplashController>(
      id: AppStateId.explore,
      builder: (value) => (value.exploreStatus != ApiStatus.loading || value.listExplore.isNotEmpty) ? GridView.builder(
        controller: value.exploreController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: AppDimens.primaryPaddingSize,
          crossAxisSpacing: AppDimens.primaryPaddingSize,
          childAspectRatio: 3/4,
        ), 
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          left: AppDimens.primaryPaddingSize,
          right: AppDimens.primaryPaddingSize,
          top: topPadding,
          bottom: bottomPadding,
        ),
        itemCount: value.listExplore.length,
        itemBuilder: (context, index) => PhotoCard(action: 10, photo: value.listExplore[index]),
      ) : BodyText(label: value.exploreStatus.toString())
    );
  }
}