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
import 'package:uwalls/shared/themes/shortcut.dart';
import 'package:uwalls/shared/utils/stateid.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {

    final authvm = Get.find<AuthController>();

    final themeApp = Theme.of(context);

    return Column(
      children: [
        const Headline1Text(
          label: 'Register Account'
        ),
        AppDimens.gap3,
        const BodyText(
          label: 'Join with us to explore and download your favorite wallpapers',
          textAlign: centerText,
        ),
        AppDimens.gap32,
        RoundedCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              CleanTextInput(
                hintText: 'First name',
                onChange: (value) => authvm.onChangeInputReg(action: 10, value: value),
              ),
              const AppHorizontalDivider(),
              CleanTextInput(
                hintText: 'Last name',
                onChange: (value) => authvm.onChangeInputReg(action: 20, value: value),
              ),
            ],
          ),
        ),
        AppDimens.gap20,
        RoundedCard(
          padding: EdgeInsets.zero,
          child: CleanTextInput(
            hintText: 'Email address',
            inputType: TextInputType.emailAddress,
            onChange: (value) => authvm.onChangeInputReg(action: 30, value: value),
          ),
        ),
        AppDimens.gap20,
        RoundedCard(
          padding: EdgeInsets.zero,
          child: GetBuilder<AuthController>(
            id: AppStateId.obscurePassReg,
            builder: (value) => Column(
              children: [
                CleanTextInput(
                  hintText: 'Create password',
                  obscureText: value.obscurePassReg,
                  onChange: (value) => authvm.onChangeInputReg(action: 40, value: value),
                  suffix: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Icon(
                        value.obscurePassReg ? IconsaxPlusLinear.eye_slash : IconsaxPlusLinear.eye,
                        size: AppDimens.tertiaryIconSize,
                        color: themeApp.iconTheme.color
                      ),
                      onTap: () => authvm.onChangeObscureReg(action: 10),
                    ),
                  ),
                ),
                const AppHorizontalDivider(),
                CleanTextInput(
                  hintText: 'Confirm password',
                  obscureText: value.obscureConfirmPassReg,
                  onChange: (value) => authvm.onChangeInputReg(action: 50, value: value),
                  suffix: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Icon(
                        value.obscureConfirmPassReg ? IconsaxPlusLinear.eye_slash : IconsaxPlusLinear.eye,
                        size: AppDimens.tertiaryIconSize,
                        color: themeApp.iconTheme.color
                      ),
                      onTap: () => authvm.onChangeObscureReg(action: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        AppDimens.gap32,
        GetBuilder<AuthController>(
          id: AppStateId.btnRegister,
          builder: (value) => PrimaryButton(
            label: 'Register Now', 
            loading: value.loadingReg,
            onPressed: value.btnEnableReg ? () {
              FocusScope.of(context).requestFocus(FocusNode());
              authvm.registerAccount();
            } : null,
          ),
        ),
      ],
    );
  }
}