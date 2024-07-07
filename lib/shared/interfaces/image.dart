import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:uwalls/shared/themes/dimens.dart';

class ImageAsset extends StatelessWidget {

  final double? width;
  final double? height;
  final String src;
  final BoxFit? fit;
  final FilterQuality? quality;
  final double? chacheWidth;

  const ImageAsset({
    super.key, 
    this.width, 
    this.height,
    required this.src, 
    this.fit,
    this.quality,
    this.chacheWidth,
  });

  @override
  Widget build(BuildContext context) {

    final mediaApp = MediaQuery.of(context);

    return Image.asset(
      src,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      filterQuality: quality ?? FilterQuality.medium,
      cacheWidth: ((chacheWidth ?? 100) * mediaApp.devicePixelRatio).round(),
    );
  }
  
}

class ImageNetwork extends StatelessWidget {

  final double? width;
  final double? height;
  final String url;
  final BoxFit? fit;
  final FilterQuality? quality;
  final double? radius;
  final double? chacheWidth;

  const ImageNetwork({
    super.key, 
    this.width, 
    this.height,
    required this.url,
    this.fit,
    this.quality,
    this.radius,
    this.chacheWidth,
  });

  @override
  Widget build(BuildContext context) {

    final mediaApp = MediaQuery.of(context);
    final themeApp = Theme.of(context);

    return SmoothClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 0.0),
      smoothness: AppDimens.smoothnessCorner,
      child: CachedNetworkImage(
        width: width,
        height: height,
        imageUrl: url,
        fit: fit ?? BoxFit.cover,
        filterQuality: quality ?? FilterQuality.medium,
        memCacheWidth: ((chacheWidth ?? 100) * mediaApp.devicePixelRatio).round(),
        placeholder: (context, url) => Material(
          color: themeApp.cardColor,
        ),
        errorWidget: (context, url, error) => Material(
          color: themeApp.cardColor,
          child: Icon(
            IconsaxPlusBold.gallery_slash,
            color: themeApp.disabledColor,
          ),
        ),
      ),
    );
  }
}