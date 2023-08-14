import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/business/actions.dart';
import '/business/state.dart';

class AppBloc extends Bloc<ActionBase, AppState> {
  AppBloc()
      : super(
    AppState(
      themePreset: ThemePreset.dark,
      theme: ThemeData.dark(),
      themeColor: Colors.green,
      weatherLevel: 0.5,
    ),
  ) {
    on<ActionInit>(_onActionInit);
    on<ActionPullState>(_onActionPullState);
    on<ActionChangeTheme>(_onActionChangeTheme);
    on<ActionChangeThemePreset>(_onActionChangeThemePreset);
    on<ActionChangeThemeCustomColor>(_onActionChangeThemeCustomColor);
  }

  Future<void> _onActionInit(ActionInit action, Emitter<AppState> emit) async {
    emit(state.copyWith(lastAction: action));
  }

  Future<void> _onActionPullState(ActionPullState action,
      Emitter<AppState> emit) async {
    emit(state);
  }

  Future<void> _onActionChangeTheme(ActionChangeTheme action,
      Emitter<AppState> emit) async {
    emit(state.copyWith(lastAction: action, theme: action.theme));
  }

  Future<void> _onActionChangeThemePreset(ActionChangeThemePreset action,
      Emitter<AppState> emit) async {
    ThemeData theme = ThemeData.light();

    switch (action.preset) {
      case ThemePreset.dark:
        theme = ThemeData.dark();
        break;
      case ThemePreset.light:
        theme = ThemeData.light();
        break;
      case ThemePreset.custom:
        theme = ThemeData(
          primarySwatch: state.themeColor,
        );
        break;
    }
    emit(state.copyWith(
        lastAction: action, theme: theme, themePreset: action.preset));
    }

  Future<void> _onActionChangeThemeCustomColor(
      ActionChangeThemeCustomColor action, Emitter<AppState> emit) async {
    if (state.themePreset == ThemePreset.custom) {
      emit(
        state.copyWith(
            lastAction: action,
            theme: ThemeData(
              primarySwatch: action.color,
            ),
            themeColor: action.color),
      );
    } else {
      emit(
        state.copyWith(
            lastAction: action,
            themeColor: action.color),
      );
    }
  }
}
