import 'package:flutter/material.dart';
import 'dart:math' as math;

//https://bartvwezel.nl/flutter/drawing-and-rotating-arcs-in-flutter/
class CircleViewThree extends StatelessWidget {
  const CircleViewThree({Key? key, required this.progress, required this.size})
      : super(key: key);
  final double progress;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        key: UniqueKey(),
        tween: Tween<double>(begin: 0, end: progress),
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCubic,
        builder: (context, anim, child) {
          return CustomPaint(
            size: size,
            painter: ArcPainter(radius: size.width, progress: anim),
          );
        });
  }
}

const double _progressStrokeWidth = 18;
const double _baseStrokeWidth = 18;

Paint _createPaintForColor(Color color, double strokeWidth) {
  return Paint()
    ..color = color
    ..style = PaintingStyle.stroke
    ..strokeWidth = strokeWidth;
}

class ArcPainter extends CustomPainter {
  final double radius;
  final double progress;

  final Paint red = _createPaintForColor(Colors.red, _progressStrokeWidth);
  final Paint blue = _createPaintForColor(Colors.blue, _progressStrokeWidth);
  final Paint green = _createPaintForColor(Colors.green, _progressStrokeWidth);
  final Paint amber = _createPaintForColor(Colors.amber, _progressStrokeWidth);
  final Paint pink = _createPaintForColor(Colors.pink, _progressStrokeWidth);
  final Paint basePaint = _createPaintForColor(Colors.grey, _baseStrokeWidth);

  ArcPainter({required this.radius, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: radius);
    canvas.drawArc(rect, -math.pi / 2, 2 * math.pi, false, basePaint);
    if (progress >= 0) {
      canvas.drawArc(
          rect, -math.pi / 2, sweepAngle() * (progress / 72), false, blue);
    }
    if (progress >= 72) {
      canvas.drawArc(rect, -math.pi / 2 + 2 / 5 * math.pi,
          sweepAngle() * ((progress - 72) / 72), false, red);
    }
    if (progress >= 144) {
      canvas.drawArc(rect, -math.pi / 2 + 4 / 5 * math.pi,
          sweepAngle() * ((progress - 144) / 72), false, green);
    }
    if (progress >= 216) {
      canvas.drawArc(rect, -math.pi / 2 + 6 / 5 * math.pi,
          sweepAngle() * ((progress - 216) / 72), false, amber);
    }
    if (progress >= 288) {
      canvas.drawArc(rect, -math.pi / 2 + 8 / 5 * math.pi,
          sweepAngle() * ((progress - 288) / 72), false, pink);
    }
    final strokeWidth = math.max(_baseStrokeWidth, _progressStrokeWidth) / 2;
    final center = Offset(size.width / 2, size.height / 2);
    final Paint backgroundCirclePaint = Paint()..color = Colors.white;
    canvas.drawCircle(
        center, size.width / 2 - strokeWidth, backgroundCirclePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  double sweepAngle() => 2 / 5 * math.pi;
}
