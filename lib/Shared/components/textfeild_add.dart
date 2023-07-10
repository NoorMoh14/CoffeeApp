// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Widget defaultFormField({
  TextEditingController? controller,
  TextDirection? textdirection,
  required context,
  String? hintText,
  dynamic label,
  IconData? prefix,
  String? initialValue,
  TextInputType? keyboardType,
  onTap,
  required String? Function(String?) validate ,
  bool isPassword = false,
  IconData? suffix,
  suffixPressed,
  Color? color_fill,
  int? maxLines,
}) =>
    TextFormField(
      obscureText: isPassword,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      controller: controller,
      // maxLines: maxLines,
      textDirection: textdirection,
      keyboardType: keyboardType,
      textCapitalization: TextCapitalization.words,
      textAlignVertical: TextAlignVertical.center,
      validator: validate,
      decoration: InputDecoration(
        prefixIcon: Icon(prefix),
        hintTextDirection: TextDirection.ltr,
        hintText: hintText,
        border: InputBorder.none,
        fillColor: color_fill,
        filled: true,
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixPressed, icon: Icon(suffix))
            : null,
      ),
    );
