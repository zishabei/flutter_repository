import 'package:flutter/material.dart';
import 'package:flutter_project/example/clock/components/clock_center.dart';
import 'package:flutter_project/example/clock/components/clock_hand.dart';
import 'package:flutter_project/example/clock/components/clock_hand_second.dart';

class ClockPanel extends StatelessWidget {
  final DateTime now;

  const ClockPanel({Key? key, required this.size, required this.now})
      : super(key: key);

  final Size size;

  Widget get outerPanel {
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
          color: Colors.grey[300],
          shape: BoxShape.circle,
          boxShadow: [
            const BoxShadow(
                color: Colors.white,
                offset: Offset(-5.0, -5.0),
                blurRadius: 15.0),
            BoxShadow(
                color: Colors.grey[400]!,
                offset: const Offset(5.0, 5.0),
                blurRadius: 15.0)
          ]),
    );
  }

  Widget get innerPanel {
    return Stack(
      children: [
        Container(
          width: size.width * 0.9,
          height: size.width * 0.9,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
              gradient: RadialGradient(
                  colors: [Colors.white.withOpacity(0.0), Colors.grey[400]!],
                  center: const AlignmentDirectional(0.1, 0.1),
                  focal: const AlignmentDirectional(0.0, 0.0),
                  radius: 0.65,
                  focalRadius: 0.001,
                  stops: const [0.3, 1.0])),
        ),
        Container(
          width: size.width * 0.9,
          height: size.width * 0.9,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
              gradient: RadialGradient(
                  colors: [Colors.white.withOpacity(0.0), Colors.white],
                  center: const AlignmentDirectional(-0.1, -0.1),
                  focal: const AlignmentDirectional(0.0, 0.0),
                  radius: 0.65,
                  focalRadius: 0.001,
                  stops: const [0.75, 1.0])),
        )
      ],
    );
  }

  Widget get scale {
    return CustomPaint(
      size: size,
      painter: ClockScalePainter(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        outerPanel,
        innerPanel,
        scale,
        ClockHand(
            clockSize: size,
            clockHandType: ClockHandType.hour,
            hour: now.hour,
            minute: now.minute,
            second: now.second),
        ClockHand(
            clockSize: size,
            clockHandType: ClockHandType.minute,
            hour: now.hour,
            minute: now.minute,
            second: now.second),
        ClockHandSecond(clockSize: size, second: now.second),
        const ClockCenter()
      ],
    );
  }
}

class ClockScalePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;
    canvas.drawLine(Offset(size.width / 2, size.height * 0.12),
        Offset(size.width / 2, size.height * 0.06), paint);
    canvas.drawLine(Offset(size.width * 0.88, size.height / 2),
        Offset(size.width * 0.94, size.height / 2), paint);
    canvas.drawLine(Offset(size.width / 2, size.height * 0.88),
        Offset(size.width / 2, size.height * 0.94), paint);
    canvas.drawLine(Offset(size.width * 0.12, size.height / 2),
        Offset(size.width * 0.06, size.height / 2), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
