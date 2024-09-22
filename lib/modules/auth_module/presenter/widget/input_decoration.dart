import 'package:flutter/material.dart';

import '../../../core/style/app_color.dart';
import '../../../core/style/text_style.dart';

InputDecoration inputDecorationDefault(String hintText) {
  return InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    hintText: hintText,
    hintStyle: Style.defaultStyle,
    fillColor: AppColor.kBackground,
    filled: true,
  );
}
