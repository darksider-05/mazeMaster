import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mazemaster/providers/app_root.dart';
import 'package:mazemaster/providers/game_provider.dart';
import 'package:provider/provider.dart';

class HelpProgressIndicator extends StatelessWidget {
  const HelpProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    var game = Provider.of<GameProvider>(context);
    var root = RootState(context);
    var vh = root.vh();
    var vw = root.vw();
    var wholeSize = min(vh, vw) * 0.7;
    var width = min(vw, vh) / 2;
    double height = 10;
    return Positioned(
      top: (vh - wholeSize) / 4 + wholeSize + vh * 0.05,
      left: (vw - width) / 2,
      child: SizedBox(
        width: width,
        height: height,
        child: LinearProgressIndicator(
          value: game.help,
          color: Colors.yellow[600],
          backgroundColor: Colors.deepPurpleAccent[400],
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),
    );
  }
}
