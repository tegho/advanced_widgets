import 'dart:async';

import '/business/business.dart';

import 'package:flutter/material.dart';
import '/themes/themes.dart';
import '/widgets/color_pick.dart';

class DrawerSettings extends StatelessWidget {
  const DrawerSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AppBloc>();
    return Drawer(
      child: SingleChildScrollView(
        child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: CircleAvatar(
                  radius: 60,
                  child: Icon(
                    Icons.settings,
                    size: 70,
                  ),
                ),
              ),
              const Divider(),
              SegmentedButton<ThemePreset>(
                selected: {bloc.state.themePreset},
                onSelectionChanged: (Set<ThemePreset> newSelection) {
                  bloc.add(
                      ActionChangeThemePreset(preset: newSelection.single));
                },
                segments: const [
                  ButtonSegment<ThemePreset>(
                    value: ThemePreset.light,
                    label: Text('Light'),
                  ),
                  ButtonSegment<ThemePreset>(
                    value: ThemePreset.custom,
                    label: Text('Custom'),
                  ),
                  ButtonSegment<ThemePreset>(
                    value: ThemePreset.dark,
                    label: Text('Dark'),
                  ),
                ],
              ),
              const ColorPick(),
            ],
          );
        }),
      ),
    );
  }
}
