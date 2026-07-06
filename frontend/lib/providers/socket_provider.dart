import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:mazemaster/providers/game_provider.dart';
import "package:web_socket_channel/web_socket_channel.dart";

class SocketProvider extends ChangeNotifier {
  late WebSocketChannel channel;
  late GameProvider game;
  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  SocketProvider(this.game) {
    channel = WebSocketChannel.connect(Uri.parse("ws://127.0.0.1:8765"));

    channel.stream.listen((message) {
      game.applyMessage(jsonDecode(message));
    });
  }
}
