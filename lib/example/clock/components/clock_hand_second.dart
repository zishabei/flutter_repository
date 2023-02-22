import 'dart:math';

import 'package:flutter/material.dart';

class ClockHandSecond extends StatelessWidget {
  final Size clockSize;
  final int second;

  const ClockHandSecond(
      {Key? key, required this.clockSize, required this.second})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final beginAngle = 2 * pi / 60 * (second - 1);
    final endAngle = 2 * pi / 60 * second;

    // if (second == 0) {
    //   return TweenAnimationBuilder<double>(
    //     key: const ValueKey("prevent overlap"),
    //     duration: const Duration(milliseconds: 300),
    //     curve: Curves.easeInQuint,
    //     tween: Tween<double>(begin: beginAngle, end: endAngle),
    //     builder: (context, anim, child) {
    //       return Transform.rotate(
    //         angle: anim,
    //         child: CustomPaint(
    //           size: clockSize,
    //           painter: SecondHandPainter(),
    //         ),
    //       );
    //     },
    //   );
    // }

    return TweenAnimationBuilder<double>(
      key: UniqueKey(),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInQuint,
      tween: Tween<double>(begin: beginAngle, end: endAngle),
      builder: (context, anim, child) {
        return Transform.rotate(
          angle: anim,
          child: CustomPaint(
            size: clockSize,
            painter: SecondHandPainter(),
          ),
        );
      },
    );
  }
}

class SecondHandPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(size.width / 2, size.height * 0.65),
        Offset(size.width / 2, size.height * 0.1), paint);

    final circlePaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
        Offset(size.width / 2, size.height * 0.65), 6.0, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
