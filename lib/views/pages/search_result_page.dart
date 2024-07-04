import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uwalls/controllers/unsplash_controller.dart';
import 'package:uwalls/shared/interfaces/text.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/shared/themes/shortcut.dart';
import 'package:uwalls/shared/utils/stateid.dart';
import 'package:uwalls/views/widgets/appbar/search_appbar.dart';
import 'package:uwalls/views/widgets/gridview/search_grid.dart';
import 'package:uwalls/views/widgets/loading/alert_loading.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({super.key});

  @override
  Widget build(BuildContext context) {

    final mediaApp = MediaQuery.of(context);

    final argument = Get.arguments;
    final String query = argument['query'] ?? '-';

    final topPadding = (mediaApp.viewPadding.top + (Platform.isAndroid ? kToolbarHeight : AppDimens.appBarSize) + AppDimens.primaryPaddingSize);
    final bottomPadding = (mediaApp.viewPadding.bottom + AppDimens.primaryPaddingSize);

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0.0,
            right: 0.0,
            top: 0.0,
            bottom: 0.0,
            child: GetBuilder<UnsplashController>(
              builder: (value) => SingleChildScrollView(
                controller: value.searchController,
                padding: EdgeInsets.only(
                  left: AppDimens.primaryPaddingSize,
                  right: AppDimens.primaryPaddingSize,
                  top: topPadding,
                  bottom: bottomPadding,
                ),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: startCrossAxis,
                  children: [
                    Headline1Text(
                      label: toBeginningOfSentenceCase(query)
                    ),
                    GetBuilder<UnsplashController>(
                      id: AppStateId.search,
                      builder: (value) => CaptionText(
                        label: value.totalPhoto > 0 ? '${value.totalPhoto} wallpapers found' : 'Please wait a moment...'
                      ),
                    ),
                    AppDimens.gap20,
                    const SearchGrid()
                  ],
                ),
              ),
            ),
          ),
          const Positioned(
            left: 0.0,
            right: 0.0,
            top: 0.0,
            child: SearchAppbar()
          ),
          GetBuilder<UnsplashController>(
            id: AppStateId.regetSearch,
            builder: (value) => AnimatedPositioned(
              left: 0.0,
              right: 0.0,
              bottom: value.regetLoadingSearch ? bottomPadding : -AppDimens.size34,
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              child: Center(
                child: AlertLoading(
                  animating: value.regetLoadingSearch,
                )
              )
            ),
          )
        ],
      ),
    );
  }
}