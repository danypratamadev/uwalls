import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uwalls/controllers/auth_controller.dart';
import 'package:uwalls/shared/interfaces/button.dart';
import 'package:uwalls/shared/interfaces/image.dart';
import 'package:uwalls/shared/interfaces/other.dart';
import 'package:uwalls/shared/interfaces/text.dart';
import 'package:uwalls/shared/routes/routes.dart';
import 'package:uwalls/shared/routes/routes_navigator.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/shared/themes/shortcut.dart';
import 'package:uwalls/shared/utils/images.dart';
import 'package:uwalls/shared/utils/stateid.dart';
import 'package:uwalls/views/widgets/form/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

    final mediaApp = MediaQuery.of(context);
    final themeApp = Theme.of(context);

    final authvm = Get.find<AuthController>();

    final topPadding = (mediaApp.viewPadding.top + (Platform.isAndroid ? kToolbarHeight : AppDimens.appBarSize));
    final bottomPadding = (mediaApp.viewPadding.bottom + kBottomNavigationBarHeight + AppDimens.primaryPaddingSize);
    
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(
            left: AppDimens.primaryPaddingSize,
            right: AppDimens.primaryPaddingSize,
            top: topPadding,
            bottom: bottomPadding,
          ),
          child: Column(
            children: [
              Hero(
                tag: 'logo',
                transitionOnUserGestures: true,
                child: ImageAsset(
                  src: logoUwalls,
                  width: mediaApp.size.width * 0.4,
                  height: mediaApp.size.width * 0.4,
                ),
              ),
              AppDimens.gap20,
              const LoginForm(),
              AppDimens.gap32,
              Text.rich(
                textAlign: centerText,
                TextSpan(
                  text: "Don't have an account? ",
                  style: GoogleFonts.poppins(
                    textStyle: themeApp.textTheme.labelLarge,
                    fontWeight: fontRegular,
                  ),
                  children: <InlineSpan>[
                    TextSpan(
                      text: 'Sign Up',
                      style: GoogleFonts.poppins(
                        textStyle: themeApp.textTheme.labelLarge,
                        color: themeApp.primaryColor,
                        fontWeight: fontSemiBold,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        AppNavigator.push(route: AppRoutes.registerRoute);
                      },
                    ),
                  ]
                ),
              ),
              AppDimens.gap32,
              const Row(
                children: [
                  Expanded(
                    child: AppHorizontalDivider()
                  ),
                  AppDimens.gap12,
                  CaptionText(label: 'OR'),
                  AppDimens.gap12,
                  Expanded(
                    child: AppHorizontalDivider()
                  ),
                ],
              ),
              AppDimens.gap32,
              GetBuilder<AuthController>(
                id: AppStateId.btnGoogle,
                builder: (value) => SecondaryButton(
                  label: 'Google', 
                  btnColor: themeApp.cardColor,
                  borderColor: themeApp.cardColor,
                  loading: value.loadingGoogle,
                  onPressed: () => authvm.loginWithGoogle(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}