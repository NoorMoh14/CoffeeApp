import 'package:flutter/material.dart';

class ColorManagement {
  static Color colorPrimaryLight = const Color(0xfff5edda);
  static Color colorPrimary = const Color(0xff363636);
  static Color colorPrimaryDark = const Color(0xff98694f);
  static Color colorSecondary = const Color.fromARGB(255, 193, 173, 61);
  static LinearGradient gColor = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xffffd600), Colors.redAccent]);
  static Color colorGrey = const Color(0xffc6c6c6);
  static Color colorGreyLight = const Color(0xff757575);
  static Color colorbluedark = const Color(0xff4b3298);
  static Color colorBlack = const Color(0xFF000000);
  static Color colorWhite = const Color(0xffffffff);
  static Color colorWhiteDark = const Color(0xFFf6f6f6);
  static Color colorTrans = Colors.transparent;
}
