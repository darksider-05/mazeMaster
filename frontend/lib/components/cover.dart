import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mazemaster/providers/app_root.dart';

class Cover extends StatelessWidget {
  const Cover({super.key});

  @override
  Widget build(BuildContext context) {
    var root = RootState(context);
    var vh = root.vh();
    var vw = root.vw();
    return Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
        child: Container(
          width: min(vh, vw) * 0.7,
          height: vh * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Colors.blueGrey.withAlpha(180),
            border: Border.all(color: Colors.white54),
          ),
        ),
      ),
    );
  }
}
