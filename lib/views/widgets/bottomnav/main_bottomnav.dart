import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:uwalls/controllers/app_controller.dart';
import 'package:uwalls/shared/themes/dimens.dart';

class MainBottomnav extends StatelessWidget {
  const MainBottomnav({super.key});

  @override
  Widget build(BuildContext context) {

    final themeApp = Theme.of(context);

    final appvm = Get.find<AppController>();
    
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
        child: GetBuilder<AppController>(
          builder: (value) => BottomNavigationBar(
            currentIndex: value.currentPage,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            iconSize: AppDimens.primaryIconSize,
            backgroundColor: themeApp.scaffoldBackgroundColor.withOpacity(0.8),
            onTap: (value) => appvm.onChangePage(page: value),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  IconsaxPlusBold.search_normal_1
                ),
                label: 'Search'
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconsaxPlusBold.discover
                ),
                label: 'Explore'
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconsaxPlusBold.archive_1
                ),
                label: 'Saved'
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconsaxPlusBold.user
                ),
                label: 'Account'
              ),
            ],
          ),
        ),
      ),
    );
  }
}