import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/business/actions.dart';

part 'state.freezed.dart';

// part 'state.g.dart';

enum ThemePreset { light, dark, custom }

@freezed
class AppState with _$AppState {
  const factory AppState({
    ActionBase? lastAction,
    required ThemePreset themePreset,
    // required MaterialColor themeColor,
    required ThemeData theme,
    required double weatherLevel,
  }) = _AppState;

// factory AppState.fromJson(Map<String, Object?> json) =>
//     _$AppState(json);
}
