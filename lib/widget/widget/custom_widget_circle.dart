import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/gen/assets/assets.gen.dart';
import 'package:flutter_project/widget/app_debug.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;
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
                  child: FutureBuilder<ui.Image>(
                    future: _loadImage("assets/menu_faq.png"),
                    builder: (BuildContext context,
                        AsyncSnapshot<ui.Image> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return const Text('Image loading...');
                        default:
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return TweenAnimationBuilder<double>(
                                key: UniqueKey(),
                                tween: Tween<double>(
                                    begin: 0, end: ref.watch(progressProvider)),
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeInOutCubic,
                                builder: (context, anim, child) {
                                  return CustomPaint(
                                    size: const Size(250, 250),
                                    painter:
                                        CirclePainter(anim, snapshot.data!),
                                  );
                                });
                          }
                      }
                    },
                  ),
                ),
              ]),
              ElevatedButton(
                  onPressed: () async {
                    ref.read(progressProvider.notifier).state = 340;
                  },
                  child: const Text("340")),
              ElevatedButton(
                  onPressed: () async {
                    ref.read(progressProvider.notifier).state = 200;
                  },
                  child: const Text("200")),
              ElevatedButton(
                  onPressed: () async {
                    ref.read(progressProvider.notifier).state = 180;
                  },
                  child: const Text("180")),
              ElevatedButton(
                  onPressed: () async {
                    ref.read(progressProvider.notifier).state = 150;
                  },
                  child: const Text("150")),
              ElevatedButton(
                  onPressed: () async {
                    ref.read(progressProvider.notifier).state = 90;
                  },
                  child: const Text("90")),
              ElevatedButton(
                  onPressed: () async {
                    ref.read(progressProvider.notifier).state = 10;
                  },
                  child: const Text("10")),
              ElevatedButton(
                  onPressed: () async {
                    ref.read(progressProvider.notifier).state = 500;
                  },
                  child: const Text("500")),
              ElevatedButton(
                  onPressed: () async {
                    ref.read(progressProvider.notifier).state = -10;
                  },
                  child: const Text("-10")),
            ],
          ),
        ));
  }

  Future<ui.Image> _loadImage(String imageAssetPath) async {
    final ByteData data = await rootBundle.load(imageAssetPath);
    final codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetHeight: 30,
      targetWidth: 30,
    );
    var frame = await codec.getNextFrame();
    return frame.image;
  }
}

class CirclePainter extends CustomPainter {
  final double sweepAngle; // 黄色ゲージの進行度 360°
  final ui.Image image;

  CirclePainter(this.sweepAngle, this.image);

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
    final imagePaint = Paint();
    final x0 = size.width / 2;
    final y0 = size.height / 2;
    final r = size.width / 2;
    final ao = sweepAngle;

    final x1 = x0 + r * cos((ao - 90) * 3.14 / 180);
    final y1 = y0 + r * sin((ao - 90) * 3.14 / 180);
    AppDebug.log(
        "cos(sweepAngle * 3.14 / 180):${cos(sweepAngle * 3.14 / 180)}");
    AppDebug.log(
        "sin(sweepAngle * 3.14 / 180):${sin(sweepAngle * 3.14 / 180)}");
    AppDebug.log("size.width:${size.width},size.height:${size.height}");
    AppDebug.log("sweepAngle:$sweepAngle,x1:$x1,y1:$y1");
    canvas.drawImage(image, Offset(x1 - 15, y1 - 15), imagePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
