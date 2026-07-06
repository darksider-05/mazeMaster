import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mazemaster/providers/app_root.dart';
import 'package:mazemaster/providers/game_provider.dart';
import 'package:provider/provider.dart';

class Hints extends StatelessWidget {
  const Hints({super.key});

  @override
  Widget build(BuildContext context) {
    var game = Provider.of<GameProvider>(context);
    var root = RootState(context);
    var vh = root.vh();
    var vw = root.vw();
    var wholeSize = min(vh, vw) * 0.7;
    var width = min(vw, vh) / 2;

    return Positioned(
      top: (vh - wholeSize) / 4 + wholeSize,
      left: (vw - width) / 2,
      child: SizedBox(
        child: Row(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("movement: W A S D"),
            Text("hint: H"),
            Text("hints left: ${game.hints}"),
          ],
        ),
      ),
    );
  }
}
