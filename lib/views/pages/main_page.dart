import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uwalls/controllers/app_controller.dart';
import 'package:uwalls/shared/utils/stateid.dart';
import 'package:uwalls/views/pages/account_page.dart';
import 'package:uwalls/views/pages/collection_page.dart';
import 'package:uwalls/views/pages/explore_page.dart';
import 'package:uwalls/views/pages/search_page.dart';
import 'package:uwalls/views/widgets/appbar/main_appbar.dart';
import 'package:uwalls/views/widgets/bottomnav/main_bottomnav.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [
      const SearchPage(),
      const ExplorePage(),
      const CollectionPage(),
      const AccountPage(),
    ];
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            left: 0.0,
            right: 0.0,
            top: 0.0,
            bottom: 0.0,
            child: GetBuilder<AppController>(
              id: AppStateId.pageIndex,
              builder: (value) => PageTransitionSwitcher(
                duration: const Duration(milliseconds: 300),
                reverse: value.reversePage,
                transitionBuilder: (child, primaryAnimation, secondaryAnimation) => SharedAxisTransition(
                  animation: primaryAnimation, 
                  secondaryAnimation: secondaryAnimation, 
                  transitionType: SharedAxisTransitionType.horizontal,
                  fillColor: Colors.transparent,
                  child: child,
                ),
                child: Container(
                  key: ValueKey<int>(value.currentPage),
                  color: Colors.transparent,
                  child: children[value.currentPage],
                ),
              ),
              // IndexedStack(
              //   index: value.currentPage,
              //   children: const [
              //     SearchPage(),
              //     ExplorePage(),
              //     CollectionPage(),
              //     AccountPage(),
              //   ],
              // ),
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