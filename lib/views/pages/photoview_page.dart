import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:uwalls/models/urls_model.dart';

class PhotoviewPage extends StatelessWidget {
  const PhotoviewPage({super.key});

  @override
  Widget build(BuildContext context) {

    final argument = Get.arguments;
    final UrlsModel photoUrl = argument['url'];

    final mediaApp = MediaQuery.of(context);
    final themeApp = Theme.of(context);
    
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            width: double.maxFinite,
            height: mediaApp.size.height,
            imageUrl: photoUrl.regular,
            imageBuilder: (context, imageProvider) => PhotoView(
              imageProvider: imageProvider,
              loadingBuilder: (context, event) => const CupertinoActivityIndicator(),
              enableRotation: false,
              wantKeepAlive: true,
              disableGestures: true,
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered,
              backgroundDecoration: BoxDecoration(
                color: themeApp.scaffoldBackgroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}