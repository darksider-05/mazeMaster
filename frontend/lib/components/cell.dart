import 'package:flutter/material.dart';
import 'package:mazemaster/providers/game_provider.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    var game = Provider.of<GameProvider>(context);

    /// Grid indexing uses [y][x], not [x][y].
    List<List<int>> grid = game.maze;

    final (int, int) index = (vx, vy);
    (int, int) relativeL = (player.$1 + index.$1 - 2, player.$2 + index.$2 - 2);
    bool isInWorld =
        relativeL.$1 < grid.length &&
        relativeL.$1 >= 0 &&
        relativeL.$2 >= 0 &&
        relativeL.$2 < grid[0].length;
    const double borderRoundness = 30;
    if (!isInWorld) {
      return Positioned(
        left: leftPad,
        top: topPad,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: vx == 0
                ? vy == 0
                      ? BorderRadius.only(
                          topLeft: Radius.circular(borderRoundness),
                        )
                      : vy == 4
                      ? BorderRadius.only(
                          bottomLeft: Radius.circular(borderRoundness),
                        )
                      : BorderRadius.all(Radius.zero)
                : vx == 4
                ? vy == 0
                      ? BorderRadius.only(
                          topRight: Radius.circular(borderRoundness),
                        )
                      : vy == 4
                      ? BorderRadius.only(
                          bottomRight: Radius.circular(borderRoundness),
                        )
                      : BorderRadius.all(Radius.zero)
                : BorderRadius.all(Radius.zero),
          ),
          width: cellSize,
          height: cellSize,
        ),
      );
    }
    return Positioned(
      left: leftPad,
      top: topPad,
      child: Container(
        width: cellSize,
        height: cellSize,
        decoration: BoxDecoration(
          borderRadius: vx == 0
              ? vy == 0
                    ? BorderRadius.only(
                        topLeft: Radius.circular(borderRoundness),
                      )
                    : vy == 4
                    ? BorderRadius.only(
                        bottomLeft: Radius.circular(borderRoundness),
                      )
                    : BorderRadius.all(Radius.zero)
              : vx == 4
              ? vy == 0
                    ? BorderRadius.only(
                        topRight: Radius.circular(borderRoundness),
                      )
                    : vy == 4
                    ? BorderRadius.only(
                        bottomRight: Radius.circular(borderRoundness),
                      )
                    : BorderRadius.all(Radius.zero)
              : BorderRadius.all(Radius.zero),
          border: Border.all(color: Colors.blue, width: 0.5),
          color: grid[relativeL.$2][relativeL.$1] == 1
              ? Colors.black
              : Colors.white,
        ),
        child: (relativeL.$1, relativeL.$2) == player
            ? Container(
                width: cellSize / 2,
                height: cellSize / 2,
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
