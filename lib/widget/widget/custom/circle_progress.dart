import 'dart:math';

import 'package:flutter/material.dart';

class CircleProgress extends StatelessWidget {
  const CircleProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: CustomPaint(
        painter: _CircleProgressPainter(1),
      ),
    );
  }
}

class _CircleProgressPainter extends CustomPainter {
  final double progress;

  _CircleProgressPainter(this.progress);

  final Paint _paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 10
    ..color = Colors.blue;

  @override
  void paint(Canvas canvas, Size size) {
    double radius = min(size.width, size.height) / 2;
    Gradient gradient = const SweepGradient(
      center: FractionalOffset.center,
      colors: <Color>[
        Color(0xFFFDFF87),
        Color(0xFF6CCEAE),
        Color(0xFF6CCEAE),
        Color(0xFFFDFF87),
      ],
      stops: <double>[0.0, 0.44, 0.55, 1],
      // transform: GradientRotation(-pi / 2),
    );
    final rect = Rect.fromLTWH(0, 0, radius * 2, radius * 2);

    _paint.shader = gradient.createShader(rect);

    canvas.save();
    canvas.translate(0.0, size.height);
    canvas.rotate(-pi / 2);

    canvas.drawArc(rect, 0, pi * 2 * progress, false, _paint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
