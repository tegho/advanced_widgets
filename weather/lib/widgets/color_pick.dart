// import 'package:flutter/material.dart';
// import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
//
// import '/business/business.dart';
//
// class ColorPick extends StatelessWidget {
//   const ColorPick({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final bloc = context.read<AppBloc>();
//
//     return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
//       return AbsorbPointer(
//         absorbing: (state.themePreset == ThemePreset.custom) ? false : true,
//         child: Padding(
//           padding: const EdgeInsets.all(8),
//           child: Container(
//             decoration: BoxDecoration(
//               border: Border.all(width: 2),
//               borderRadius: const BorderRadius.all(
//                 Radius.circular(32),
//               ),
//             ),
//             child: Opacity(
//               opacity: (state.themePreset == ThemePreset.custom) ? 1 : 0.3,
//               child: MaterialColorPicker(
//                 circleSize: 36,
//                 allowShades: false,
//                 selectedColor: state.themeColor,
//                 onMainColorChange: (newColor) {
//                   if ((newColor != null) && (newColor is MaterialColor)) {
//                     // print(newColor);
//                     bloc.add(ActionChangeThemeCustomColor(color: newColor));
//                   }
//                 },
//               ),
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }
