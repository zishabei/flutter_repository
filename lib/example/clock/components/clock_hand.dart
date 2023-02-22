import 'dart:math';

import 'package:flutter/material.dart';

enum ClockHandType { hour, minute }

const clockHandParams = {
  ClockHandType.hour: {"lengthFactor": 0.32, "width": 5.0},
  ClockHandType.minute: {"lengthFactor": 0.2, "width": 3.0}
};

class ClockHand extends StatelessWidget {
  final Size clockSize;
  final ClockHandType clockHandType;
  final int hour;
  final int minute;
  final int second;

  const ClockHand(
      {Key? key,
      required this.clockSize,
      required this.clockHandType,
      required this.hour,
      required this.minute,
      required this.second})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double endAngle;
    if (clockHandType == ClockHandType.hour) {
      endAngle = 2 * pi / 12 * ((hour * 3600 + minute * 60 + second) / 3600);
    } else {
      endAngle = 2 * pi / 60 * ((minute * 60 + second) / 60);
    }

    // Transform.rotate旋转组件
    return Transform.rotate(
      angle: endAngle,
      child: CustomPaint(
        size: clockSize,
        painter: ClockHandPainter(clockHandType: clockHandType),
      ),
    );
  }
}

class ClockHandPainter extends CustomPainter {
  final ClockHandType clockHandType;

  ClockHandPainter({required this.clockHandType});

  @override
  void paint(Canvas canvas, Size size) {
    final handConfig = clockHandParams[clockHandType];
    final lengthFactor = handConfig!["lengthFactor"];
    final width = handConfig["width"];
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = width!
      ..strokeCap = StrokeCap.round;
    final handStart = Offset(size.width / 2, size.height / 2);
    final handEnd = Offset(size.width / 2, size.height * lengthFactor!);
    canvas.drawLine(handStart, handEnd, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
