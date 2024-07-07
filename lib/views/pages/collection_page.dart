import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uwalls/controllers/unsplash_controller.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/shared/utils/stateid.dart';
import 'package:uwalls/views/widgets/gridview/collection_grid.dart';
import 'package:uwalls/views/widgets/loading/alert_loading.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context) {

    final mediaApp = MediaQuery.of(context);

    final bottomPadding = (mediaApp.viewPadding.bottom + kBottomNavigationBarHeight + AppDimens.primaryPaddingSize);
    
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
            left: 0.0,
            right: 0.0,
            top: 0.0,
            bottom: 0.0,
            child: CollectionGrid(),
          ),
          GetBuilder<UnsplashController>(
            id: AppStateId.regetCollection,
            builder: (value) => AnimatedPositioned(
              left: 0.0,
              right: 0.0,
              bottom: value.regetLoadingColl ? bottomPadding : -AppDimens.size34,
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              child: Center(
                child: AlertLoading(
                  animating: value.regetLoadingColl,
                )
              )
            ),
          )
        ],
      ), 
    );
  }
}