import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uwalls/controllers/explore_controller.dart';
import 'package:uwalls/data/endpoint/api_status.dart';
import 'package:uwalls/shared/interfaces/text.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/views/widgets/gridview/explore_gridview.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {

    final mediaApp = MediaQuery.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: AppDimens.primaryPaddingSize,
          right: AppDimens.primaryPaddingSize,
          top: (mediaApp.viewPadding.top + AppDimens.appBarSize + AppDimens.primaryPaddingSize),
          bottom: (mediaApp.viewPadding.bottom + kBottomNavigationBarHeight + AppDimens.primaryPaddingSize),
        ),
        child: Column(
          children: [
            GetBuilder<ExploreController>(
              builder: (value) => value.exploreStatus != ApiStatus.loading ? ExploreGridview(
                listExplore: value.listExplore
              ) : BodyText(label: value.exploreStatus.toString())
            ),
          ],
        ),
      )
    );
  }
}