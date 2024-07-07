import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:uwalls/controllers/firestore_controller.dart';
import 'package:uwalls/shared/interfaces/button.dart';
import 'package:uwalls/shared/interfaces/text.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/shared/themes/shortcut.dart';
import 'package:uwalls/shared/utils/stateid.dart';
import 'package:uwalls/views/widgets/card/photo_card.dart';

class SavedGrid extends StatelessWidget {
  const SavedGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FirestoreController>(
      id: AppStateId.saved,
      builder: (value) => value.listSaved.isNotEmpty ? GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: AppDimens.primaryPaddingSize,
          crossAxisSpacing: AppDimens.primaryPaddingSize,
          childAspectRatio: 3/4,
        ), 
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.primaryPaddingSize
        ),
        itemCount: value.listSaved.length,
        itemBuilder: (context, index) => PhotoCard(action: 40, photo: value.listSaved[index]),
      ) : const EmptySaved(),
    );
  }
}

class EmptySaved extends StatelessWidget {
  const EmptySaved({super.key});

  @override
  Widget build(BuildContext context) {

    final mediaApp = MediaQuery.of(context);
    final themeApp = Theme.of(context);

    return Column(
      children: [
        ClipOval(
          child: Material(
            color: themeApp.cardColor.withOpacity(0.5),
            child: Padding(
              padding: const EdgeInsets.all(AppDimens.size24),
              child: Icon(
                IconsaxPlusBold.archive_1,
                size: AppDimens.primaryAvatarSize,
                color: themeApp.cardColor.withOpacity(0.9),
              ),
            ),
          ),
        ),
        AppDimens.gap20,
        TitleText(
          label: "You don't have any saved yet.",
          fontWeight: fontRegular,
          textColor: themeApp.textTheme.bodySmall?.color,
        ),
        AppDimens.gap32,
        PrimaryButton(
          width: mediaApp.size.width * 0.4,
          label: 'Explore Now',
          onPressed: () {
            
          },
        ),
      ],
    );
  }
}