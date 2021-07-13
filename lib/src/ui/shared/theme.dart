import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData themeData = ThemeData(
      brightness: Brightness.light,
      primaryColor: Color(0xff385F7D),
      accentColor: Color(0xff8846F8),
      primaryColorDark: Colors.black45,
      primaryColorLight: Color(0xFFFFFFFF),
      fontFamily: 'CenturyGothic');
}
