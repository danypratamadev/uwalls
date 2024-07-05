import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uwalls/shared/interfaces/button.dart';
import 'package:uwalls/shared/interfaces/card.dart';
import 'package:uwalls/shared/interfaces/image.dart';
import 'package:uwalls/shared/interfaces/input.dart';
import 'package:uwalls/shared/interfaces/other.dart';
import 'package:uwalls/shared/interfaces/text.dart';
import 'package:uwalls/shared/routes/routes_navigator.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/shared/themes/shortcut.dart';
import 'package:uwalls/shared/utils/images.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {

    final mediaApp = MediaQuery.of(context);
    final themeApp = Theme.of(context);

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
                  width: mediaApp.size.width * 0.5,
                ),
              ),
              const Headline1Text(
                label: 'Register Account'
              ),
              AppDimens.gap3,
              const BodyText(
                label: 'Join with us to explore and download your favorite wallpapers',
                textAlign: centerText,
              ),
              AppDimens.gap32,
              const RoundedCard(
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    CleanTextInput(
                      hintText: 'First name',
                    ),
                    AppHorizontalDivider(),
                    CleanTextInput(
                      hintText: 'Last name',
                    ),
                  ],
                ),
              ),
              AppDimens.gap20,
              const RoundedCard(
                padding: EdgeInsets.zero,
                child: CleanTextInput(
                  hintText: 'Email address',
                  inputType: TextInputType.emailAddress,
                ),
              ),
              AppDimens.gap20,
              const RoundedCard(
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    CleanTextInput(
                      hintText: 'Create password',
                      obscureText: true,
                    ),
                    AppHorizontalDivider(),
                    CleanTextInput(
                      hintText: 'Confirm password',
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              AppDimens.gap32,
              PrimaryButton(
                label: 'Register Now', 
                onPressed: () {
                  
                },
              ),
              AppDimens.gap32,
              Text.rich(
                textAlign: centerText,
                TextSpan(
                  text: 'Already have an account? ',
                  style: GoogleFonts.poppins(
                    textStyle: themeApp.textTheme.labelLarge,
                    fontWeight: fontRegular,
                  ),
                  children: <InlineSpan>[
                    TextSpan(
                      text: 'Sign In',
                      style: GoogleFonts.poppins(
                        textStyle: themeApp.textTheme.labelLarge,
                        color: themeApp.primaryColor,
                        fontWeight: fontSemiBold,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        AppNavigator.back();
                      },
                    ),
                  ]
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}