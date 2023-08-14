import 'package:flutter/material.dart';
import '/business/state.dart';

@immutable
abstract class ActionBase {}

class ActionInit extends ActionBase {}

class ActionPullState extends ActionBase {}

// class ActionChangeTheme extends ActionBase {
//   final ThemeData theme;
//
//   ActionChangeTheme({required this.theme});
// }

class ActionChangeThemePreset extends ActionBase {
  final ThemePreset preset;

  ActionChangeThemePreset({required this.preset});
}

// class ActionChangeThemeCustomColor extends ActionBase {
//   final MaterialColor color;
//
//   ActionChangeThemeCustomColor({required this.color});
// }
