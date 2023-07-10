// ignore_for_file: unnecessary_brace_in_string_interps, non_constant_identifier_names, prefer_const_constructors

import 'package:coffee_app/Shared/Resource/color_mangment.dart';
import 'package:coffee_app/Shared/Resource/font_mangment.dart';
import 'package:coffee_app/Shared/Resource/size_mangment.dart';
import 'package:flutter/material.dart';

Widget botton({
  double? width,
  String? title,
  var colortext,
  var colorbotton,
  required VoidCallback onTap,
  Color? ColorBorder,
  double? paddingtop,
  double? paddingbotton,
  double? paddingleft,
  double? paddingright,
  double? borderRadiusize,
}) =>
    InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(
              width: 1.0, color: ColorBorder ?? ColorManagement.colorSecondary),
          color: colorbotton,
          borderRadius: BorderRadius.circular(borderRadiusize!),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: paddingtop!,
              bottom: paddingbotton!,
              left: paddingleft!,
              right: paddingright!,
            ),
            child: Text(
              "${title}",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 20, color: colortext, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );

Widget botton_Auth({
  Widget? image_1,
  double? width,
  String? title,
  var colortext,
  var colorbotton,
  required VoidCallback onTap,
}) =>
    InkWell(
      onTap: onTap,
      child: Container(
          height: 50,
          width: width,
          decoration: BoxDecoration(
            border:
                Border.all(width: 1.0, color: ColorManagement.colorSecondary),
            color: colorbotton,
            boxShadow: [
              BoxShadow(
                color: ColorManagement.colorGrey,
                blurRadius: 6,
                offset: Offset(0, 3),
              )
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(0.0),
                  child: image_1,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "${title}",
                    style: TextStyle(
                      fontSize: FontSize.s16,
                      color: colortext,
                      fontWeight: FontWidgetText.bold,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
