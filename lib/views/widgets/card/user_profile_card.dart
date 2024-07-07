import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uwalls/controllers/auth_controller.dart';
import 'package:uwalls/controllers/firestore_controller.dart';
import 'package:uwalls/shared/interfaces/button.dart';
import 'package:uwalls/shared/interfaces/image.dart';
import 'package:uwalls/shared/interfaces/other.dart';
import 'package:uwalls/shared/interfaces/text.dart';
import 'package:uwalls/shared/themes/colors.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/shared/utils/stateid.dart';
import 'package:uwalls/views/widgets/items/detail_item.dart';

class UserProfileCard extends StatelessWidget {
  const UserProfileCard({super.key});

  @override
  Widget build(BuildContext context) {

    final mediaApp = MediaQuery.of(context);

    final authvm = Get.find<AuthController>();

    return GetBuilder<AuthController>(
      builder: (value) => Column(
        children: [
          ImageNetwork(
            width: AppDimens.primaryAvatarSize,
            radius: AppDimens.primaryAvatarSize,
            url: value.profile.photo,
          ),
          AppDimens.gap20,
          TitleText(
            label: value.profile.name
          ),
          AppDimens.gap3,
          CaptionText(
            label: value.profile.email
          ),
          AppDimens.gap20,
          SecondaryButton(
            width: mediaApp.size.width * 0.25,
            height: AppDimens.size40,
            label: 'Sign Out', 
            borderColor: Colors.transparent,
            btnColor: AppColors.accentRed.withOpacity(0.15),
            textColor: AppColors.accentRed,
            onPressed: () => authvm.logoutAccount(),
          ),
          AppDimens.gap20,
          const AppHorizontalDivider(
            thickness: AppDimens.secondaryDividerSize,
          ),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.primaryPaddingSize,
                      vertical: AppDimens.secondaryPaddingSize
                    ),
                    child: GetBuilder<FirestoreController>(
                      id: AppStateId.saved,
                      builder: (value) => DetailItem(
                        label: 'Walls Saved', 
                        value: '${value.listSaved.length}',
                      ),
                    ),
                  ),
                ),
                const AppVerticalDivider(
                  thickness: AppDimens.secondaryDividerSize,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.primaryPaddingSize,
                      vertical: AppDimens.secondaryPaddingSize
                    ),
                    child: GetBuilder<FirestoreController>(
                      id: AppStateId.liked,
                      builder: (value) => DetailItem(
                        label: 'Walls Liked', 
                        value: '${value.listLiked.length}',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const AppHorizontalDivider(
            thickness: AppDimens.secondaryDividerSize,
          ),
        ],
      ),
    );
  }
}