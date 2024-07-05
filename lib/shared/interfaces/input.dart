import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uwalls/shared/themes/dimens.dart';
import 'package:uwalls/shared/themes/shortcut.dart';

class CleanTextInput extends StatelessWidget {

  final TextEditingController? controller;
  final String hintText;
  final EdgeInsets? contentPadding;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final int? maxLength;
  final int? maxLines;
  final bool? obscureText;
  final bool? readOnly;
  final bool? autoFocus;
  final Widget? prefix;
  final String? prefixText;
  final Widget? suffix;
  final ValueChanged<String>? onChange;
  final ValueChanged<String>? onSubmit;

  const CleanTextInput({super.key, 
    this.controller, 
    required this.hintText, 
    this.contentPadding, 
    this.textStyle, 
    this.textAlign,
    this.inputType, 
    this.inputAction, 
    this.maxLength, 
    this.maxLines, 
    this.obscureText, 
    this.readOnly, 
    this.autoFocus, 
    this.prefix, 
    this.prefixText, 
    this.suffix, 
    this.onChange,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {

    final mediaApp = MediaQuery.of(context);
    final themeApp = Theme.of(context);

    return MediaQuery(
      data: mediaApp.copyWith(
        textScaler: const TextScaler.linear(AppDimens.textScaleFactor)
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText ?? false,
        readOnly: readOnly ?? false,
        scrollPhysics: const BouncingScrollPhysics(),
        cursorRadius: const Radius.circular(AppDimens.size2),
        cursorWidth: AppDimens.size2,
        onChanged: onChange,
        onFieldSubmitted: onSubmit,
        decoration: InputDecoration(
          contentPadding: contentPadding ?? const EdgeInsets.symmetric(
            horizontal: AppDimens.primaryPaddingSize,
            vertical: AppDimens.secondaryPaddingSize
          ),
          hintText: hintText,
          border: InputBorder.none,
          isDense: true,
          counterText: '',
          prefixText: prefixText,
          prefixIcon: prefix,
          suffixIcon: suffix,
        ),
        style: GoogleFonts.poppins(
          textStyle: textStyle ?? themeApp.textTheme.bodyMedium
        ),
        textAlign: textAlign ?? startText,
        keyboardType: inputType ?? TextInputType.text,
        textInputAction: inputAction ?? TextInputAction.done,
        textCapitalization: TextCapitalization.sentences,
        maxLength: maxLength ?? 100,
        maxLines: maxLines ?? 1,
        autofocus: autoFocus ?? false,
      ),
    );
  }
}