import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class ElapsedTime extends StatefulWidget {
  const ElapsedTime({super.key});

  @override
  State<ElapsedTime> createState() => _ElapsedTime();
}

class _ElapsedTime extends State<ElapsedTime> {
  final StopWatchTimer stopWatchTimer = StopWatchTimer();
  @override
  void initState() {
    super.initState();
    stopWatchTimer.onStartTimer();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: stopWatchTimer.minuteTime,
        initialData: 0,
        builder: (context, snapshot) {
          return Text(' ${snapshot.data}m',
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 15,
              ));
        });
  }
}
