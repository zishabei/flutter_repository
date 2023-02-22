import 'package:flutter/material.dart';
import 'package:flutter_project/example/clock/components/clock_panel.dart';

class CustomClock extends StatefulWidget {
  const CustomClock({Key? key}) : super(key: key);

  static Route get route {
    return MaterialPageRoute(builder: (_) {
      return const CustomClock();
    });
  }

  @override
  State<CustomClock> createState() => _CustomClockState();
}

class _CustomClockState extends State<CustomClock> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('自定义钟表'),
      ),
      body: Center(
        child: Stack(alignment: Alignment.center, children: [
          ClockPanel(
            size: Size(screenWidth * 0.9, screenWidth * 0.9),
          ),
        ]),
      ),
    );
  }
}
