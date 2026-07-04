import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  const Cell({
    super.key,
    required this.leftPad,
    required this.topPad,
    required this.vx,
    required this.vy,
    required this.cellSize,
    required this.player,
  });
  final double leftPad;
  final double topPad;
  final int vx;
  final int vy;
  final double cellSize;
  final (int, int) player;

  /// notice! the correct way to call an item in the grid is to use `grid[vy][vx]` or `grid[relativeL.$2][relativeL.$1]`
  static const List<List<int>> grid = [
    [0, 1, 0, 1, 1],
    [0, 1, 0, 1, 1],
    [0, 0, 0, 0, 0],
    [1, 1, 0, 1, 0],
    [1, 1, 1, 1, 0],
  ];

  @override
  Widget build(BuildContext context) {
    final (int, int) index = (vx, vy);
    (int, int) relativeL = (player.$1 + index.$1 - 2, player.$2 + index.$2 - 2);
    bool isInWorld =
        relativeL.$1 < grid.length &&
        relativeL.$1 >= 0 &&
        relativeL.$2 >= 0 &&
        relativeL.$2 < grid[0].length;

    if (!isInWorld) return Container();
    return Positioned(
      left: leftPad,
      top: topPad,
      child: Container(
        width: cellSize,
        height: cellSize,
        color: grid[relativeL.$2][relativeL.$1] == 1
            ? Colors.black
            : Colors.white,
        child: grid[relativeL.$2][relativeL.$1] == 4
            ? Container(
                width: cellSize,
                height: cellSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              )
            : null,
      ),
    );
  }
}
