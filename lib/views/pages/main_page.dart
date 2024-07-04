import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uwalls/controllers/app_controller.dart';
import 'package:uwalls/shared/utils/stateid.dart';
import 'package:uwalls/views/pages/account_page.dart';
import 'package:uwalls/views/pages/explore_page.dart';
import 'package:uwalls/views/pages/saved_page.dart';
import 'package:uwalls/views/pages/search_page.dart';
import 'package:uwalls/views/widgets/appbar/main_appbar.dart';
import 'package:uwalls/views/widgets/bottomnav/main_bottomnav.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0.0,
            right: 0.0,
            top: 0.0,
            bottom: 0.0,
            child: GetBuilder<AppController>(
              id: AppStateId.pageIndex,
              builder: (value) => IndexedStack(
                index: value.currentPage,
                children: const [
                  SearchPage(),
                  ExplorePage(),
                  SavedPage(),
                  AccountPage(),
                ],
              ),
            )
          ),
          const Positioned(
            left: 0.0,
            right: 0.0,
            top: 0.0,
            child: MainAppbar()
          ),
          const Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: MainBottomnav()
          )
        ],
      ),
    );
  }
}