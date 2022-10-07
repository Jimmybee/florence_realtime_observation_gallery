import 'package:flutter/material.dart';

class ShiftMarker extends StatelessWidget {
  final double seconds;

  const ShiftMarker({Key? key, required this.seconds}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 600),
      duration: Duration(seconds: 60),
      builder: (context, double value, child) {
        return Opacity(
          opacity: opacity(seconds, value),
          child: const Icon(
            Icons.ac_unit,
            color: Colors.yellowAccent,
            size: 12,
          ),
        );
      },
    );
  }

  // seconds 34
  // value 345
  double opacity(double seconds, double tick) {
    if (tick < (seconds - 1) * 10) return 0; // 345 < 330
    if (tick > (seconds + 1) * 10) return 0; // 345 > 350
    // return (tick - (seconds * 10)).abs() / 10;
    if (tick < (seconds * 10)) return (tick - (seconds * 10)).abs() / 10; // 345 < 340 then (345 - 330) / 10 = 0.5
    if (tick > (seconds * 10)) return (tick - (seconds * 10)).abs() / 10; // 345 > 340 then (345 - 340) / 10 = 0.5
    return 0;
  }
}
