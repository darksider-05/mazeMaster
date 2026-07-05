import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  List<List<int>> maze = [];
  Offset player = Offset.zero;
  double help = 0;
  bool over = false;
  bool won = false;

  void applyMessage(Map<String, dynamic> msg) {
    switch (msg["type"]) {
      case "maze":
        setMaze(msg["world"]);
        break;

      case "state":
        setPlayer(msg["px"], msg["py"], msg["help"]);
        break;
      case "game_over":
        over = true;
        won = msg["won"] == 1 ? true : false;
    }

    notifyListeners();
  }

  void setMaze(List<List<int>> maze) {
    this.maze = maze;
    notifyListeners();
  }

  void setPlayer(int x, int y, int help) {
    player = Offset(x.toDouble(), y.toDouble());
    this.help = help / 50;
    notifyListeners();
  }
}
