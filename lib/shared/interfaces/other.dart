import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:uwalls/shared/themes/dimens.dart';

class AppHorizontalDivider extends StatelessWidget {

  final double thickness;
  final double? indent;
  final double? endIndent;

  const AppHorizontalDivider({
    super.key, 
    this.thickness = AppDimens.quaternaryDividerSize,
    this.indent,
    this.endIndent
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: thickness,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
    );
  }
}

class AppVerticalDivider extends StatelessWidget {

  final double thickness;
  final double? indent;
  final double? endIndent;

  const AppVerticalDivider({
    super.key, 
    this.thickness = AppDimens.quaternaryDividerSize,
    this.indent,
    this.endIndent
  });

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      width: thickness,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
    );
  }
}

class DotSeparated extends StatelessWidget {

  final double? size;
  final Gap? gap;
  final Color? color;

  const DotSeparated({
    super.key, 
    this.size, 
    this.gap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {

    final themeApp = Theme.of(context);

    return Row(
      children: [
        gap ?? AppDimens.gap8,
        ClipOval(
          child: Container(
            width: size ?? AppDimens.size4,
            height: size ?? AppDimens.size4,
            color: color ?? themeApp.dividerColor,
          ),
        ),
        gap ?? AppDimens.gap8,
      ],
    );
  }
}