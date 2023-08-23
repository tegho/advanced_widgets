import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

import '/business/actions.dart';
import '/business/state.dart';

class AppBloc extends Bloc<ActionBase, AppState> {
  AppBloc()
      : super(
          AppState(
            themePreset: ThemePreset.dark,
            theme: ThemeData.dark(),
            weatherLevel: 0.25,
            widgetMode: WeatherWidgetMode.small,
          ),
        ) {
    on<ActionInit>(_onActionInit);
    on<ActionPullState>(_onActionPullState);
    on<ActionChangeThemePreset>(_onActionChangeThemePreset);
    on<ActionChangeWeatherLevel>(_onActionChangeWeatherLevel);
    on<ActionChangeWidgetMode>(_onActionChangeWidgetMode);
  }

  Future<void> _onActionInit(ActionInit action, Emitter<AppState> emit) async {
    emit(state.copyWith(lastAction: action));
  }

  Future<void> _onActionPullState(
      ActionPullState action, Emitter<AppState> emit) async {
    emit(state);
  }

  Future<void> _onActionChangeThemePreset(
      ActionChangeThemePreset action, Emitter<AppState> emit) async {
    ThemeData theme = ThemeData.light();

    switch (action.preset) {
      case ThemePreset.dark:
        theme = ThemeData.dark();
        break;
      case ThemePreset.light:
        theme = ThemeData.light();
        break;
      case ThemePreset.custom:
        const col1 = Color(0xFF2B2D42);
        const col2 = Color(0xFF967D69);
        const col3 = Color(0xFF087E8B);

        theme = FlexColorScheme.light(
          textTheme: TextTheme(
            labelLarge: ThemeData.light()
                .textTheme
                .labelLarge!
                .copyWith(letterSpacing: 0.3),
          ),
          colors: FlexSchemeColor.from(
            primary: col1,
            secondary: col2,
            tertiary: col3,
            brightness: Brightness.light,
          ),
        ).toTheme;
        break;
    }
    emit(state.copyWith(
        lastAction: action, theme: theme, themePreset: action.preset));
  }

  Future<void> _onActionChangeWeatherLevel(
      ActionChangeWeatherLevel action, Emitter<AppState> emit) async {
    emit(state.copyWith(weatherLevel: action.weatherLevel));
  }

  Future<void> _onActionChangeWidgetMode(
      ActionChangeWidgetMode action, Emitter<AppState> emit) async {
    emit(state.copyWith(lastAction: action, widgetMode: action.newMode));
  }
}
