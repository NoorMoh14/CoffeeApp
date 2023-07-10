// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:coffee_app/Shared/Resource/view_mangment.dart';
import 'package:coffee_app/Shared/components/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:coffee_app/Shared/Resource/size_mangment.dart';

Widget copyright({
  var colorText,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: PaddingEdit.p20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget(
          FontSize: FontSize.s11,
          Title: "Copyright",
          colorText: colorText,
        ),
        Padding(
          padding:
              EdgeInsets.only(left: PaddingEdit.p10, right: PaddingEdit.p10),
          child: Icon(
            Icons.copyright,
            size: 10,
            color: colorText,
          ),
        ),
        TextWidget(
          FontSize: FontSize.s11,
          Title: "2023.  All Rights Reserved.",
          colorText: colorText,
        ),
      ],
    ),
  );
}
