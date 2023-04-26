import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomWidgetCircle extends StatefulWidget {
  const CustomWidgetCircle({Key? key}) : super(key: key);

  static Route get route {
    return MaterialPageRoute(builder: (_) {
      return CustomWidgetCircle();
    });
  }

  @override
  State<CustomWidgetCircle> createState() => _CustomWidgetCircleState();
}

class _CustomWidgetCircleState extends State<CustomWidgetCircle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CustomWidgetCircle"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: 200,
        child: CustomPaint(
          painter: CirclePainter(120),
          child: SizedBox(
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                color: const Color(0xFFD1EFE3),
                width: 30,
                height: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final double sweepAngle; // 黄色ゲージの進行度 360°
  CirclePainter(this.sweepAngle);

  @override
  void paint(Canvas canvas, Size size) {
    double degToRad(double deg) => deg * (math.pi / 180.0);
    final center = Offset(size.width / 2, size.height / 2);
    final Paint backgroundCirclePaint = Paint()..color = Colors.white;
    final Paint basePaint = Paint()
      ..strokeWidth = 14.0
      ..style = PaintingStyle.stroke
      ..color = const Color(0xFFD1EFE3);
    final Paint progressPaint = Paint()
      ..strokeWidth = 16.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = const Color(0xff449070);

    final basePath = Path()
      ..arcTo(
        Rect.fromCenter(
          center: center,
          height: size.height,
          width: size.height,
        ),
        degToRad(-90 + 1),
        degToRad(360),
        false,
      );
    final progressPath = Path()
      ..arcTo(
        Rect.fromCenter(
          center: center,
          height: size.height,
          width: size.height,
        ),
        degToRad(-90 + 1),
        degToRad(sweepAngle),
        false,
      );
    canvas.drawCircle(center, size.height / 2, backgroundCirclePaint);
    canvas.drawPath(basePath, basePaint);
    canvas.drawPath(progressPath, progressPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
