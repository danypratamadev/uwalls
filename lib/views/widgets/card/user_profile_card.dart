import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uwalls/controllers/auth_controller.dart';
import 'package:uwalls/shared/interfaces/image.dart';
import 'package:uwalls/shared/interfaces/text.dart';
import 'package:uwalls/shared/themes/dimens.dart';

class UserProfileCard extends StatelessWidget {
  const UserProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (value) => Row(
        children: [
          ImageNetwork(
            width: AppDimens.tertiaryAvatarSize,
            radius: AppDimens.tertiaryAvatarSize,
            url: value.profile.photo,
          ),
          AppDimens.gap20,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
        ],
      ),
    );
  }
}