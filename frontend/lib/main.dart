import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mazemaster/components/sky_widget.dart';
import 'package:mazemaster/providers/app_root.dart';
import 'package:mazemaster/providers/star_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => StarSimulation())],
      child: const MyApp(),
    ),
  );
}

//
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

//
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const AppRoot());
  }
}

//
class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    var root = RootState(context);
    var vh = root.vh();
    var vw = root.vw();
    return Stack(
      children: [
        SkyWidget(),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
          child: SizedBox(height: vh, width: vw),
        ),
      ],
    );
  }
}
