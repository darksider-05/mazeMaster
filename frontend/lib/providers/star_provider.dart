import 'dart:math';

import 'package:flutter/material.dart';

class StarSimulation extends ChangeNotifier {
  final List<Star> stars = [];

  void update(double dt, double vw, double vh) {
    final random = Random();
    for (final star in stars) {
      star.update(dt);
    }
    stars.removeWhere((star) => star.x >= vw || star.y <= 0);

    if (stars.length <= 200) {
      if (Random().nextInt(101) < 20) {
        stars.add(Star(vw, vh, random));
      }
    }

    notifyListeners();
  }
}

class Star {
  late double x;
  late double y;
  late double opacity;
  late final double radius;
  late final double speed;
  late final double targetx;
  int opacityChange = 1;
  late final double dx;
  late final double dy;

  Star(double vw, double vh, Random random) {
    bool startMode = random.nextBool();

    x = startMode ? 0 : (random.nextDouble() * vw);

    y = startMode ? (random.nextDouble() * vh) : vh;

    double straightLength = sqrt(y * y + vw * vw);

    dx = vw / straightLength;
    dy = y / straightLength;

    opacity = 1;
    int radProb = random.nextInt(101);
    radius = radProb <= 70
        ? 5
        : radProb <= 90
        ? 7
        : 11;

    switch (radius) {
      case 5:
        speed = 30;
        break;
      case 7:
        speed = 37;
        break;
      default:
        speed = 45;
    }
  }

  void update(double dt) {
    x += 1 * dt * speed;
    y -= 1 * dt * speed;

    opacity += opacityChange * dt * 0.35;

    if (opacity <= 0.2) {
      opacity = 0.2;
      opacityChange = 1;
    } else if (opacity >= 0.7) {
      opacity = 0.7;
      opacityChange = -1;
    }
  }
}
