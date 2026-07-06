import 'package:flutter/material.dart';
import 'package:mazemaster/components/board.dart';
import 'package:mazemaster/components/cover.dart';
import 'package:mazemaster/components/help_progress_indicator.dart';
import 'package:mazemaster/components/result.dart';
import 'package:mazemaster/components/sky_widget.dart';
import 'package:mazemaster/providers/game_provider.dart';
import 'package:mazemaster/providers/socket_provider.dart';
import 'package:mazemaster/providers/star_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StarSimulation()),
        ChangeNotifierProvider(create: (_) => GameProvider()),
        ChangeNotifierProvider(
          lazy: false,
          create: (s) => SocketProvider(s.read<GameProvider>()),
        ),
      ],
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
    var game = Provider.of<GameProvider>(context);
    return Stack(
      children: [
        SkyWidget(),
        Cover(),
        !game.over ? GameBoard() : ResultWidget(win: game.won),
        HelpProgressIndicator(),
      ],
    );
  }
}
