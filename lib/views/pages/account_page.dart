import 'dart:io';

import 'package:flutter/material.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/views/widgets/card/user_profile_card.dart';
import 'package:uwalls/views/widgets/gridview/saved_grid.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {

    final mediaApp = MediaQuery.of(context);

    final topPadding = (mediaApp.viewPadding.top + (Platform.isAndroid ? kToolbarHeight : AppDimens.appBarSize) + AppDimens.primaryPaddingSize);
    final bottomPadding = (mediaApp.viewPadding.bottom + kBottomNavigationBarHeight + AppDimens.primaryPaddingSize);

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: topPadding,
          bottom: bottomPadding,
        ),
        physics: const BouncingScrollPhysics(),
        child: const Column(
          children: [
            UserProfileCard(),
            AppDimens.gap32,
            SavedGrid(),
          ]
        )
      )
    );
  }
}