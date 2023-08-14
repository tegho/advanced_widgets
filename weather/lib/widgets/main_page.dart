import 'dart:async';
import 'package:flutter/material.dart';
// export 'package:flutter_bloc/flutter_bloc.dart';

import '/business/business.dart';
import '/widgets/drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    final bloc = context.read<AppBloc>();
    // print('Button');
    // bloc.add(ActionChangeTheme(theme: ThemeData(primarySwatch: Colors.lime)));
    // bloc.add(ActionChangeThemePreset(preset: ThemePreset.custom));
    setState(()
    {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print('main_page_build');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const DrawerSettings(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
