import 'package:flutter/material.dart';
import '/business/state.dart';

@immutable
abstract class ActionBase {}

class ActionInit extends ActionBase {}

class ActionPullState extends ActionBase {}

class ActionChangeThemePreset extends ActionBase {
  final ThemePreset preset;

  ActionChangeThemePreset({required this.preset});
}

class ActionChangeWeatherLevel extends ActionBase {
  final double weatherLevel;

  ActionChangeWeatherLevel({required this.weatherLevel});
}

class ActionChangeWidgetMode extends ActionBase {
  final WeatherWidgetMode newMode;

  ActionChangeWidgetMode({required this.newMode});
}
