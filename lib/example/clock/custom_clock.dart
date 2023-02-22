import 'dart:async';

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
  DateTime now = DateTime.now();
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        now = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('自定义钟表'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClockPanel(
              now: now,
              size: Size(screenWidth * 0.4, screenWidth * 0.4),
            ),
            const SizedBox(
              height: 18,
            ),
            ClockPanel(
              now: now,
              size: Size(screenWidth * 0.9, screenWidth * 0.9),
            ),
          ],
        ),
      ),
    );
  }
}
