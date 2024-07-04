import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:uwalls/controllers/app_controller.dart';
import 'package:uwalls/models/photo_model.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/shared/utils/stateid.dart';
import 'package:uwalls/views/widgets/card/detail_photo_card.dart';
import 'package:uwalls/views/widgets/items/photo_item.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {

    final argument = Get.arguments;
    final PhotoModel photo = argument['photo'];
    final Color bgColor = argument['bgcolor'];

    final mediaApp = MediaQuery.of(context);
    final themeApp = Theme.of(context);

    final appvm = Get.find<AppController>();

    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () => appvm.onChangePreview(),
            child: Hero(
              tag: photo.id,
              transitionOnUserGestures: true,
              child: CachedNetworkImage(
                width: double.maxFinite,
                height: mediaApp.size.height,
                imageUrl: photo.urls.regular,
                imageBuilder: (context, imageProvider) => GetBuilder<AppController>(
                  id: AppStateId.fullPreview,
                  builder: (value) => PhotoView(
                    imageProvider: imageProvider,
                    loadingBuilder: (context, event) => const CupertinoActivityIndicator(),
                    enableRotation: false,
                    wantKeepAlive: true,
                    disableGestures: !value.fullPreview,
                    initialScale: PhotoViewComputedScale.covered,
                    minScale: PhotoViewComputedScale.covered,
                    maxScale: PhotoViewComputedScale.covered * 2,
                    backgroundDecoration: BoxDecoration(
                      color: themeApp.scaffoldBackgroundColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const DetailPhotoCard(),
          Positioned(
            left: AppDimens.primaryPaddingSize,
            right: AppDimens.primaryPaddingSize,
            bottom: -AppDimens.size54,
            child: Center(
              child: PhotoItem(photo: photo, bgColor: bgColor)
            )
          )
        ],
      ),
    );
  }
}