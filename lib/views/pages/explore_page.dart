import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uwalls/controllers/explore_controller.dart';
import 'package:uwalls/data/endpoint/api_status.dart';
import 'package:uwalls/shared/interfaces/text.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/shared/utils/stateid.dart';
import 'package:uwalls/views/widgets/card/explore_card.dart';
import 'package:uwalls/views/widgets/loading/alert_loading.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {

    final mediaApp = MediaQuery.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0.0,
            right: 0.0,
            top: 0.0,
            bottom: 0.0,
            child: GetBuilder<ExploreController>(
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
                  top: (mediaApp.viewPadding.top + AppDimens.appBarSize + AppDimens.primaryPaddingSize),
                  bottom: (mediaApp.viewPadding.bottom + kBottomNavigationBarHeight + AppDimens.primaryPaddingSize),
                ),
                itemCount: value.listExplore.length,
                itemBuilder: (context, index) => ExploreCard(photo: value.listExplore[index]),
              ) : BodyText(label: value.exploreStatus.toString())
            ),
          ),
          GetBuilder<ExploreController>(
            id: AppStateId.regetExplore,
            builder: (value) => AnimatedPositioned(
              left: 0.0,
              right: 0.0,
              bottom: value.regetLoading ? (mediaApp.viewPadding.bottom + kBottomNavigationBarHeight + AppDimens.primaryPaddingSize) : -AppDimens.primaryPaddingSize,
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              child: Center(
                child: AlertLoading(
                  animating: value.regetLoading,
                )
              )
            ),
          )
        ],
      ), 
    );
  }
}


          