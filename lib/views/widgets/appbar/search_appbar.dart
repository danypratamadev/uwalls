import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uwalls/shared/interfaces/text.dart';
import 'package:uwalls/shared/routes/routes_navigator.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/shared/themes/shortcut.dart';

class SearchAppbar extends StatelessWidget {
  const SearchAppbar({super.key});

  @override
  Widget build(BuildContext context) {

    final themeApp = Theme.of(context);
    
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
        child: AppBar(
          toolbarHeight: Platform.isAndroid ? kToolbarHeight : AppDimens.appBarSize,
          backgroundColor: themeApp.scaffoldBackgroundColor.withOpacity(0.9),
          leading: IconButton(
            onPressed: () => AppNavigator.back(), 
            icon: const Icon(
              Icons.arrow_back_rounded
            )
          ),
          title: Row(
            mainAxisSize: minSize,
            children: [
              Headline3Text(
                label: 'search',
                textColor: themeApp.primaryColor,
              ),
              const Headline3Text(
                label: 'result'
              ),
            ],
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
      ),
    );
  }
}