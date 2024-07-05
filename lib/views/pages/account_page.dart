import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uwalls/controllers/auth_controller.dart';
import 'package:uwalls/shared/interfaces/button.dart';
import 'package:uwalls/shared/interfaces/text.dart';
import 'package:uwalls/shared/themes/colors.dart';
import 'package:uwalls/shared/themes/dimens.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {

    final mediaApp = MediaQuery.of(context);

    final authvm = Get.find<AuthController>();

    final topPadding = (mediaApp.viewPadding.top + (Platform.isAndroid ? kToolbarHeight : AppDimens.appBarSize) + AppDimens.primaryPaddingSize);
    final bottomPadding = (mediaApp.viewPadding.bottom + kBottomNavigationBarHeight + AppDimens.primaryPaddingSize);

    return Scaffold(
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
            GetBuilder<AuthController>(
              builder: (value) => Column(
                children: [
                  TitleText(
                    label: value.profile.name
                  ),
                  AppDimens.gap3,
                  CaptionText(
                    label: value.profile.email
                  )
                ],
              ),
            ),
            AppDimens.gap32,
            SecondaryButton(
              label: 'Sign Out', 
              borderColor: Colors.transparent,
              btnColor: AppColors.accentRed.withOpacity(0.15),
              textColor: AppColors.accentRed,
              onPressed: () => authvm.logoutAccount(),
            )
          ]
        )
      )
    );
  }
}