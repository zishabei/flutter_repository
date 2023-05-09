import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/gen/assets/assets.gen.dart';
import 'package:flutter_project/widget/app_debug.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;

class CircleView extends StatelessWidget {
  const CircleView(
      {Key? key,
      required this.progress,
      required this.baseColor,
      required this.progressColor,
      required this.progressImage,
      required this.size,
      required this.baseStrokeWidth,
      required this.progressStrokeWidth,
      required this.imageSize})
      : super(key: key);
  final double progress;
  final Color baseColor;
  final Color progressColor;
  final AssetGenImage progressImage;
  final Size size;
  final int imageSize;
  final double baseStrokeWidth;
  final double progressStrokeWidth;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ui.Image>(
      future: _loadImage(progressImage.path),
      builder: (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Text('Image loading...');
          default:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return TweenAnimationBuilder<double>(
                  key: UniqueKey(),
                  tween: Tween<double>(begin: 0, end: progress),
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOutCubic,
                  builder: (context, anim, child) {
                    return CustomPaint(
                      size: size,
                      painter: CirclePainter(
                          anim,
                          snapshot.data!,
                          baseColor,
                          progressColor,
                          baseStrokeWidth,
                          progressStrokeWidth,
                          imageSize),
                    );
                  });
            }
        }
      },
    );
  }

  Future<ui.Image> _loadImage(String imageAssetPath) async {
    final ByteData data = await rootBundle.load(imageAssetPath);
    final codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetHeight: imageSize,
      targetWidth: imageSize,
    );
    var frame = await codec.getNextFrame();
    return frame.image;
  }
}

class CirclePainter extends CustomPainter {
  final double sweepAngle;
  final Color baseColor;
  final Color progressColor;
  final ui.Image image;
  final double baseStrokeWidth;
  final double progressStrokeWidth;
  final int imageSize;

  CirclePainter(this.sweepAngle, this.image, this.baseColor, this.progressColor,
      this.baseStrokeWidth, this.progressStrokeWidth, this.imageSize);

  @override
  void paint(Canvas canvas, Size size) {
    double degToRad(double deg) => deg * (math.pi / 180.0);
    final center = Offset(size.width / 2, size.height / 2);
    final Paint backgroundCirclePaint = Paint()..color = Colors.white;
    final Paint basePaint = Paint()
      ..strokeWidth = baseStrokeWidth
      ..style = PaintingStyle.stroke
      ..color = baseColor;
    final Paint progressPaint = Paint()
      ..strokeWidth = progressStrokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = progressColor;

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
    canvas.drawImage(
        image, Offset(x1 - imageSize / 2, y1 - imageSize / 2), imagePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
