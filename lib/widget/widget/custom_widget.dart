import 'package:flutter/material.dart';
import 'package:flutter_project/widget/app_debug.dart';

class CustomWidget extends StatefulWidget {
  const CustomWidget({Key? key}) : super(key: key);

  static Route get route {
    return MaterialPageRoute(builder: (_) {
      return const CustomWidget();
    });
  }

  @override
  State<CustomWidget> createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('自定义视图'),
      ),
      body: Center(
        child: CustomPaint(
          size: const Size(200, 200),
          painter: RedCirclePainter(),
          foregroundPainter: BlueLinePainter(),
          child: Container(
            width: 200,
            height: 200,
            child: LayoutBuilder(
              builder:  (BuildContext context, BoxConstraints constraints) {
                AppDebug.log("---${constraints.heightConstraints()}");
                AppDebug.log("---${constraints.widthConstraints()}");
                return Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.green,
                  ),
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}

class RedCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var center = Offset(size.width / 2, size.height / 2);
    var paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(center, size.height / 2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BlueLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const p1 = Offset(0, 0);
    final p2 = Offset(size.width, size.height);
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
