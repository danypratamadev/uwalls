import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uwalls/controllers/unsplash_controller.dart';
import 'package:uwalls/data/endpoint/api_status.dart';
import 'package:uwalls/shared/interfaces/text.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/shared/utils/stateid.dart';
import 'package:uwalls/views/widgets/card/photo_card.dart';

class RecomendationGrid extends StatelessWidget {
  const RecomendationGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UnsplashController>(
      id: AppStateId.recomendation,
      builder: (value) => (value.recomendationStatus != ApiStatus.loading || value.listRecomendation.isNotEmpty) ? GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: AppDimens.primaryPaddingSize,
          crossAxisSpacing: AppDimens.primaryPaddingSize,
          childAspectRatio: 3/4,
        ), 
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: value.listRecomendation.length,
        itemBuilder: (context, index) => PhotoCard(action: 20, photo: value.listRecomendation[index]),
      ) : BodyText(label: value.exploreStatus.toString())
    );
  }
}