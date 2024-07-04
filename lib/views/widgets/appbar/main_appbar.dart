import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uwalls/controllers/app_controller.dart';
import 'package:uwalls/shared/interfaces/text.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/shared/themes/shortcut.dart';
import 'package:uwalls/shared/utils/stateid.dart';

class MainAppbar extends StatelessWidget {
  const MainAppbar({super.key});

  @override
  Widget build(BuildContext context) {

    final themeApp = Theme.of(context);
    
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
        child: AppBar(
          toolbarHeight: AppDimens.appBarSize,
          backgroundColor: themeApp.scaffoldBackgroundColor.withOpacity(0.9),
          title: GetBuilder<AppController>(
            id: AppStateId.pageIndex,
            builder: (value) => Row(
              mainAxisAlignment: centerMainAxis,
              children: [
                Headline2Text(
                  label: value.currentTitle,
                  textColor: themeApp.primaryColor,
                ),
                Headline2Text(
                  label: value.currentPage == 3 ? 'account' : 'walls'
                ),
              ],
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
      ),
    );
  }
}