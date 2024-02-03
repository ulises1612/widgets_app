import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.black,
  Colors.red,
  Colors.orange,
  Colors.pink,
  Colors.yellow,
  Colors.green,
  Colors.purple,
  Colors.white,
];

class AppTheme{

  final int selectedColor;
  final bool isDarkMode;

  AppTheme({
    this.isDarkMode = false,
    this.selectedColor = 0
  }):
  assert( selectedColor >= 0 , 'Selected colro must be greater than 0'),
  assert( selectedColor < colorList.length , 'Selected color must be less than ${colorList.length - 1}');

  ThemeData getThemeData ()=> ThemeData(
    useMaterial3: true,
    brightness: isDarkMode? Brightness.dark: Brightness.light,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(centerTitle: true)
  );

}