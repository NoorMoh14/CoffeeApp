// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/cupertino.dart';

Widget TextWidget({
  TextDirection textDirection = TextDirection.ltr,
  TextAlign textAlign = TextAlign.center,
  int maxLines = 1,
  required String Title,
  Color? colorText,
  double? FontSize,
  FontWeight? FontWeight,
  TextDecoration TextDecorationEdit = TextDecoration.none,
  Shadow? shadows,
  String? customFont,
  double? height,
  Color? backgroundColor
}) {
  return Text(
    Title,
    textDirection: textDirection,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      decoration: TextDecorationEdit,
      color: colorText,
      fontSize: FontSize,
      fontWeight: FontWeight,
      fontFamily: customFont,
      height: height,
      backgroundColor: backgroundColor

    ),
  );
}
