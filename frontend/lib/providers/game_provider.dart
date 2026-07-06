import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  List<List<int>> maze = [];
  (int, int) player = (0, 0);
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

  void setMaze(List maze) {
    this.maze = (maze).map((row) => List<int>.from(row)).toList();
    notifyListeners();
  }

  void setPlayer(int x, int y, double help) {
    player = (x, y);
    this.help = help / 50;
    notifyListeners();
  }
}
