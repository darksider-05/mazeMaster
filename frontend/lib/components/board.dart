import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mazemaster/components/cell.dart';
import 'package:mazemaster/providers/app_root.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<(double, double, int, int)> processGrid(
    int gridSize,
    double cellSize,
    double vh,
    double vw,
    double wholeSize,
  ) {
    List<(double, double, int, int)> result = [];
    var topLeftCorner = ((vw - wholeSize) / 2, (vh - wholeSize) * 1 / 4);
    for (int enum1 = 0; enum1 < gridSize; enum1++) {
      for (int enum2 = 0; enum2 < gridSize; enum2++) {
        result.add((
          topLeftCorner.$1 + enum1 * cellSize, // position from left
          topLeftCorner.$2 + enum2 * cellSize, // position from top
          enum1, // the x index of the cell in the visual grid
          enum2, // the y index in the cell in the visual grid
        ));
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    var root = RootState(context);
    var vh = root.vh();
    var vw = root.vw();
    var wholeSize = 0.8 * min(vh, vw);
    const gridSize = 5;
    var cellSize = wholeSize / gridSize;
    List<(double, double, int, int)> processed = processGrid(
      gridSize,
      cellSize,
      vh,
      vw,
      wholeSize,
    );

    List<Widget> children = [];
    for (var index = 0; index < processed.length; index++) {
      double leftPad = processed[index].$1;
      double topPad = processed[index].$2;
      int vx = processed[index].$3;
      int vy = processed[index].$4;

      children.add(
        Cell(
          leftPad: leftPad,
          topPad: topPad,
          vx: vx,
          vy: vy,
          cellSize: cellSize,
          player: (0, 0),
        ),
      );
    }

    return Stack(children: children);
  }
}
