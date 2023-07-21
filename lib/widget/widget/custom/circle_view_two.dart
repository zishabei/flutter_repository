import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_project/widget/app_debug.dart';
import 'dart:math' as math;

class CircleViewTwo extends StatelessWidget {
  const CircleViewTwo({
    Key? key,
    required this.progress,
    required this.baseColor,
    this.progressStartColor = const Color(0xFFFDFF87),
    this.progressEndColor = const Color(0xFF6CCEAE),
    this.backgroundColor,
    required this.size,
    required this.baseStrokeWidth,
    required this.progressStrokeWidth,
  })  : assert(progress >= 0 && progress <= 1),
        super(key: key);
  final double progress;
  final Color baseColor;
  final Color progressStartColor;
  final Color progressEndColor;
  final Color? backgroundColor;
  final Size size;
  final double baseStrokeWidth;
  final double progressStrokeWidth;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        key: UniqueKey(),
        tween: Tween<double>(begin: 0, end: progress),
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCubic,
        builder: (context, anim, child) {
          AppDebug.log("anim:$anim");
          return CustomPaint(
            size: size,
            painter: CirclePainter(
              anim,
              baseColor,
              baseStrokeWidth,
              progressStrokeWidth,
              progressStartColor,
              progressEndColor,
              backgroundColor,
            ),
          );
        });
  }
}

class CirclePainter extends CustomPainter {
  final double sweepAngle;
  final Color baseColor;
  final Color progressStartColor;
  final Color progressEndColor;
  final Color? backgroundColor;
  final double baseStrokeWidth;
  final double progressStrokeWidth;

  CirclePainter(
      this.sweepAngle,
      this.baseColor,
      this.baseStrokeWidth,
      this.progressStrokeWidth,
      this.progressStartColor,
      this.progressEndColor,
      this.backgroundColor);

  @override
  void paint(Canvas canvas, Size size) {
    double degToRad(double deg) => deg * (math.pi / 180.0);
    final center = Offset(size.width / 2, size.height / 2);
    final Paint basePaint = Paint()
      ..strokeWidth = baseStrokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = baseColor;

    final Paint shadowPaint = Paint()
      ..strokeWidth = baseStrokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 7)
      ..color = Colors.grey[350]!;

    Gradient gradient = SweepGradient(
      center: FractionalOffset.center,
      colors: <Color>[
        progressStartColor,
        progressStartColor,
        progressEndColor,
        progressEndColor,
      ],
      stops: const <double>[0.0, 0.33, 0.66, 1],
      transform: const GradientRotation(pi / 2),
    );
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    final Paint progressPaint = Paint()
      ..strokeWidth = progressStrokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..shader = gradient.createShader(rect);

    final basePath = Path()
      ..arcTo(
        Rect.fromCenter(
          center: center,
          height: size.height,
          width: size.height,
        ),
        degToRad(150),
        degToRad(240),
        false,
      );
    final progressPath = Path()
      ..arcTo(
        Rect.fromCenter(
          center: center,
          height: size.height,
          width: size.height,
        ),
        degToRad(150),
        degToRad(sweepAngle * 240),
        false,
      );

    if (backgroundColor != null) {
      final Paint backgroundCirclePaint = Paint()..color = backgroundColor!;
      canvas.drawCircle(center, size.height / 2, backgroundCirclePaint);
    }

    canvas.drawPath(basePath, shadowPaint);
    canvas.drawPath(basePath, basePaint);
    canvas.drawPath(progressPath, progressPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
