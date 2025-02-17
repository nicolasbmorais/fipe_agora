import 'package:flutter/material.dart';

const String _fontFamily = 'Rubik';

class CustomTypography {
  static TextStyle bold =
      TextStyle(fontFamily: _fontFamily, fontWeight: FontWeight.w700);

  static TextStyle semiBold =
      TextStyle(fontFamily: _fontFamily, fontWeight: FontWeight.w600);

  static TextStyle medium =
      TextStyle(fontFamily: _fontFamily, fontWeight: FontWeight.w500);

  static TextStyle regular =
      TextStyle(fontFamily: _fontFamily, fontWeight: FontWeight.w400);
}
