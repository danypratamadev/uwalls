import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uwalls/controllers/app_controller.dart';
import 'package:uwalls/controllers/unsplash_controller.dart';
import 'package:uwalls/shared/interfaces/card.dart';
import 'package:uwalls/shared/interfaces/input.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/shared/themes/shortcut.dart';
import 'package:uwalls/shared/utils/stateid.dart';

class SearchBoxCard extends StatelessWidget {
  const SearchBoxCard({super.key});

  @override
  Widget build(BuildContext context) {
    
    final unsplashvm = Get.find<UnsplashController>();

    final themeApp = Theme.of(context);

    return Stack(
      children: [
        RoundedCard(
          radius: AppDimens.size28,
          padding: EdgeInsets.zero,
          child: GetBuilder<AppController>(
            id: AppStateId.pageIndex,
            builder: (value) => CleanTextInput(
              hintText: 'Search Wallpaper', 
              textAlign: centerText,
              textStyle: themeApp.textTheme.bodyLarge,
              readOnly: value.currentPage == 0 ? false : true,
              inputAction: TextInputAction.go,
              onSubmit: (value) => unsplashvm.requestSearchPhoto(query: value),
            ),
          ),
        ),

      ],
    );
  }
}