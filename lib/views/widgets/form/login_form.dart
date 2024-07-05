import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:uwalls/controllers/auth_controller.dart';
import 'package:uwalls/shared/interfaces/button.dart';
import 'package:uwalls/shared/interfaces/card.dart';
import 'package:uwalls/shared/interfaces/input.dart';
import 'package:uwalls/shared/interfaces/other.dart';
import 'package:uwalls/shared/interfaces/text.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/shared/utils/stateid.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {

    final authvm = Get.find<AuthController>();

    final themeApp = Theme.of(context);

    return Column(
      children: [
        const Headline1Text(
          label: 'Welcome to uwalls'
        ),
        AppDimens.gap3,
        const BodyText(
          label: 'Explore and download your favorite wallpapers'
        ),
        AppDimens.gap32,
        RoundedCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              CleanTextInput(
                hintText: 'Email',
                inputType: TextInputType.emailAddress,
                onChange: (value) => authvm.onChangeInput(action: 10, value: value),
              ),
              const AppHorizontalDivider(),
              GetBuilder<AuthController>(
                id: AppStateId.obscurePass,
                builder: (value) => CleanTextInput(
                  hintText: 'Password',
                  obscureText: value.obscurePass,
                  onChange: (value) => authvm.onChangeInput(action: 20, value: value),
                  suffix: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Icon(
                        value.obscurePass ? IconsaxPlusLinear.eye_slash : IconsaxPlusLinear.eye,
                        size: AppDimens.tertiaryIconSize,
                        color: themeApp.iconTheme.color
                      ),
                      onTap: () => authvm.onChangeObscure(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        AppDimens.gap32,
        GetBuilder<AuthController>(
          id: AppStateId.btnLogin,
          builder: (value) => PrimaryButton(
            label: 'Sign In', 
            onPressed: value.btnEnable ? () => authvm.loginAccount() : null,
          ),
        ),
      ],
    );
  }
}