import 'dart:convert';

import 'package:mazemaster/providers/game_provider.dart';
import "package:web_socket_channel/web_socket_channel.dart";

class SocketProvider {
  final WebSocketChannel channel;

  SocketProvider(GameProvider game)
    : channel = WebSocketChannel.connect(Uri.parse("ws://127.0.0.1:8765")) {
    channel.stream.listen((message) {
      game.applyMessage(jsonDecode(message));
    });
  }
}
