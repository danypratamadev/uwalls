import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uwalls/shared/interfaces/image.dart';
import 'package:uwalls/shared/themes/colors.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/shared/utils/images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final mediaApp = MediaQuery.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Hero(
              tag: 'logo',
              transitionOnUserGestures: true,
              child: ImageAsset(
                src: iconUwalls,
                width: mediaApp.size.width * 0.4,
                height: mediaApp.size.width * 0.4,
              ),
            ),
          ),
          Positioned(
            left: AppDimens.primaryPaddingSize,
            right: AppDimens.primaryPaddingSize,
            bottom: mediaApp.size.height * 0.12,
            child: CupertinoActivityIndicator(
              color: AppColors.whiteTextColor,
            ),
          )
        ],
      ),
    );
  }
}