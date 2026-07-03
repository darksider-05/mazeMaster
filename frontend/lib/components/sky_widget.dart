import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mazemaster/components/star.dart';
import 'package:mazemaster/providers/app_root.dart';
import 'package:mazemaster/providers/star_provider.dart';
import 'package:provider/provider.dart';

class SkyWidget extends StatefulWidget {
  const SkyWidget({super.key});

  @override
  State<SkyWidget> createState() => _SkyWidgetState();
}

class _SkyWidgetState extends State<SkyWidget>
    with SingleTickerProviderStateMixin {
  double vh = 0;
  double vw = 0;
  Ticker? _ticker;
  Duration? _lastTime;
  late StarSimulation starSim;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    starSim = context.read<StarSimulation>();
  }

  @override
  void initState() {
    super.initState();
    _ticker = createTicker((elapsed) {
      if (_lastTime == null) {
        _lastTime = elapsed;
        return;
      }

      final dt = (elapsed - _lastTime!).inMicroseconds / 1e6;
      _lastTime = elapsed;
      starSim.update(dt, vw, vh);
    });

    _ticker?.start();
  }

  @override
  void dispose() {
    _ticker?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    starSim = Provider.of<StarSimulation>(context);
    var root = RootState(context);
    vh = root.vh();
    vw = root.vw();
    return Stack(
      children:
          <Widget>[Container(width: vw, height: vh, color: Color(0xFF090909))] +
          [
            for (var star in starSim.stars)
              StarWidget(
                x: star.x,
                y: star.y,
                radius: star.radius,
                opacity: star.opacity,
              ),
          ],
    );
  }
}
