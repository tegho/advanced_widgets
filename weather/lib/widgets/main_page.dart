import 'package:flutter/material.dart';

import '/business/business.dart';
import '/widgets/drawer.dart';
import '/widgets/weather/weather_indicator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AppBloc>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
          return Text('${widget.title}  ${state.weatherLevel}');
        }),
      ),
      drawer: DrawerSettings(
        scaffoldKey: scaffoldKey,
      ),
      body: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 20, bottom: 8, left: 8, right: 8),
              child: Slider(
                value: state.weatherLevel,
                divisions: 100,
                label: state.weatherLevel.toString(),
                onChanged: (newValue) {
                  bloc.add(ActionChangeWeatherLevel(weatherLevel: newValue));
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  // alignment: Alignment.center,
                  // alignment: Alignment.bottomLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      // color: Colors.blueAccent,
                    ),
                    child: WeatherIndicator(
                      weatherLevel: state.weatherLevel,
                      mode: state.widgetMode,
                      onModeChanged: (newMode) {
                        bloc.add(ActionChangeWidgetMode(newMode: newMode));
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
