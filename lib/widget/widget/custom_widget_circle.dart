import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomWidgetCircle extends ConsumerStatefulWidget {
  const CustomWidgetCircle({Key? key}) : super(key: key);

  static Route get route {
    return MaterialPageRoute(builder: (_) {
      return CustomWidgetCircle();
    });
  }

  @override
  ConsumerState<CustomWidgetCircle> createState() => _CustomWidgetCircleState();
}

class _CustomWidgetCircleState extends ConsumerState<CustomWidgetCircle> {
  final progressProvider = StateProvider<double>((ref) => 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("CustomWidgetCircle"),
        ),
        body: Center(
          child: Column(
            children: [
              Stack(alignment: Alignment.topCenter, children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      color: const Color(0xFFD15553),
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TweenAnimationBuilder<double>(
                      key: UniqueKey(),
                      tween: Tween<double>(
                          begin: 0, end: ref.watch(progressProvider)),
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOutCubic,
                      builder: (context, anim, child) {
                        return CustomPaint(
                          size: const Size(250, 250),
                          painter: CirclePainter(anim),
                        );
                      }),
                ),
              ]),
              ElevatedButton(
                  onPressed: () async {
                    ref.read(progressProvider.notifier).state = 270;
                  },
                  child: const Text("270")),
              ElevatedButton(
                  onPressed: () async {
                    ref.read(progressProvider.notifier).state = 80;
                  },
                  child: const Text("80")),
            ],
          ),
        ));
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
