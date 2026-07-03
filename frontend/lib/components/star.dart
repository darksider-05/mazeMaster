import 'package:flutter/material.dart';

class StarWidget extends StatelessWidget {
  const StarWidget({
    super.key,
    required this.x,
    required this.y,
    required this.radius,
    required this.opacity,
  });
  final double x;
  final double y;
  final double radius;
  final double opacity;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      child: Opacity(
        opacity: opacity,
        child: Container(
          width: radius,
          height: radius,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFFF1FFD4),
            boxShadow: [
              BoxShadow(
                blurRadius: radius / 2,
                color: const Color(0xFFF1FFD4).withAlpha(alpha(opacity)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

int alpha(double percent) {
  percent = percent * 100;
  return (percent.floor() * 255 / 100).floor();
}
