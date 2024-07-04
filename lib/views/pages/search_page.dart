import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:uwalls/controllers/unsplash_controller.dart';
import 'package:uwalls/shared/interfaces/button.dart';
import 'package:uwalls/shared/interfaces/text.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/shared/themes/shortcut.dart';
import 'package:uwalls/views/widgets/card/search_box_card.dart';
import 'package:uwalls/views/widgets/gridview/recomendation_grid.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {

    final mediaApp = MediaQuery.of(context);
    final themeApp = Theme.of(context);

    final unsplashvm = Get.find<UnsplashController>();

    final topPadding = (mediaApp.viewPadding.top + (Platform.isAndroid ? kToolbarHeight : AppDimens.appBarSize) + AppDimens.primaryPaddingSize);
    final bottomPadding = (mediaApp.viewPadding.bottom + kBottomNavigationBarHeight + AppDimens.primaryPaddingSize);
    
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: AppDimens.primaryPaddingSize,
            right: AppDimens.primaryPaddingSize,
            top: topPadding,
            bottom: bottomPadding,
          ),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SearchBoxCard(),
              AppDimens.gap20,
              Padding(
                padding: const EdgeInsets.only(left: AppDimens.quinaryPaddingSize),
                child: Row(
                  mainAxisAlignment: betweenMainAxis,
                  children: [
                    const TitleText(
                      label: 'Recomendation',
                      fontWeight: fontMedium,
                    ),
                    AppDimens.gap12,
                    Transform.translate(
                      offset: const Offset(AppDimens.size5, 0.0),
                      child: AppIconButton(
                        icon: IconsaxPlusBold.refresh_circle, 
                        iconColor: themeApp.primaryColor,
                        onPressed: () => unsplashvm.fetchRecomendation()
                      ),
                    )
                  ],
                ),
              ),
              AppDimens.gap5,
              const RecomendationGrid(),
            ],
          ),
        )
      ),
    );
  }
}