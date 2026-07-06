import 'dart:io';

import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({super.key, required this.win});
  final bool win;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            win ? "You win!" : "You lose...",
            style: TextStyle(fontSize: 20),
          ),
          FloatingActionButton(
            onPressed: () {
              exit(0);
            },
            child: Center(child: Text("exit")),
          ),
        ],
      ),
    );
  }
}
