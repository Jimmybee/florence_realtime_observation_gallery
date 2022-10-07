import 'package:flutter/material.dart';

class UserMarker extends StatelessWidget {
  final double seconds;
  final IconData icon;
  final Color color;

  const UserMarker({Key? key, required this.seconds, required this.icon, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 600),
      duration: const Duration(seconds: 60),
      builder: (context, double value, child) {
        final sizeM = opacity(seconds, value);
        final sizeL = sizeM * 12;
        return Opacity(
          opacity: sizeM,
          child: Icon(
            icon,
            color: color,
            size: sizeL,
          ),
        );
      },
      onEnd: () {
        print("end");
      },
    );
  }

  // seconds 34
  // value 345
  final secondsDiff = 2;
  double opacity(double seconds, double tick) {
    if (tick < (seconds - secondsDiff) * 10) return 0; // 345 < 330
    if (tick > (seconds + secondsDiff) * 10) return 0; // 345 > 350
    // return (tick - (seconds * 10)).abs() / 10;
    if (tick < (seconds * 10))
      return (tick - (seconds * 10)).abs() / (secondsDiff * 10); // 345 < 340 then (345 - 330) / 10 = 0.5
    if (tick > (seconds * 10))
      return (tick - (seconds * 10)).abs() / (secondsDiff * 10); // 345 > 340 then (345 - 340) / 10 = 0.5
    return 0;
  }
}
