import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uwalls/controllers/unsplash_controller.dart';
import 'package:uwalls/data/endpoint/api_status.dart';
import 'package:uwalls/shared/interfaces/text.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/shared/utils/stateid.dart';
import 'package:uwalls/views/widgets/card/collection_card.dart';

class CollectionGrid extends StatelessWidget {
  const CollectionGrid({super.key});

  @override
  Widget build(BuildContext context) {

    final mediaApp = MediaQuery.of(context);

    final topPadding = (mediaApp.viewPadding.top + (Platform.isAndroid ? kToolbarHeight : AppDimens.appBarSize) + AppDimens.primaryPaddingSize);
    final bottomPadding = (mediaApp.viewPadding.bottom + kBottomNavigationBarHeight + AppDimens.primaryPaddingSize);

    return GetBuilder<UnsplashController>(
      id: AppStateId.collection,
      builder: (value) => (value.collectionStatus != ApiStatus.loading || value.listCollection.isNotEmpty) ? GridView.builder(
        controller: value.collectionController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: AppDimens.primaryPaddingSize,
          crossAxisSpacing: AppDimens.primaryPaddingSize,
          childAspectRatio: 16/9,
        ), 
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          left: AppDimens.primaryPaddingSize,
          right: AppDimens.primaryPaddingSize,
          top: topPadding,
          bottom: bottomPadding,
        ),
        itemCount: value.listCollection.length,
        itemBuilder: (context, index) => CollectionCard(collection: value.listCollection[index]),
      ) : BodyText(label: value.exploreStatus.toString())
    );
  }
}