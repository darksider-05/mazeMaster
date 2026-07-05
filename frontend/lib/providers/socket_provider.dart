import 'dart:convert';

import 'package:mazemaster/providers/game_provider.dart';
import "package:web_socket_channel/web_socket_channel.dart";

class SocketProvider {
  late final WebSocketChannel channel;

  SocketProvider(GameProvider game) {
    channel.stream.listen((message) {
      game.applyMessage(jsonDecode(message));
    });
  }
}
