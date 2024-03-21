import 'package:flutter/material.dart';

const _customColor = Color(0x001E1EA7);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class DefaultTheme {
  final int colorCode;
  DefaultTheme({
    this.colorCode = 0
  }):
    assert(colorCode >= 0, "colorCode must be non-negative"),
    assert (colorCode < _colorThemes.length, "colorCode must be lesser than ${_colorThemes.length}");
  
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[colorCode],
    );
  }
}
