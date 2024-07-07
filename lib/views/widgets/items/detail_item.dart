import 'package:flutter/material.dart';
import 'package:uwalls/shared/interfaces/text.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/shared/themes/shortcut.dart';

class DetailItem extends StatelessWidget {

  final String label;
  final String value;
  final Color? textColor;

  const DetailItem({
    super.key, 
    required this.label, 
    required this.value,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: centerMainAxis,
      children: [
        Headline3Text(
          label: value,
          fontWeight: fontMedium,
          textColor: textColor,
        ),
        AppDimens.gap8,
        CaptionText(
          label: label,
          textColor: textColor?.withOpacity(0.8),
        ),
      ],
    );
  }
}