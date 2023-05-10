import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_project/gen/assets/assets.gen.dart';
import 'package:flutter_project/widget/widget/custom/circle_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'custom/circle_progress.dart';

class CustomWidgetCircle extends ConsumerStatefulWidget {
  const CustomWidgetCircle({Key? key}) : super(key: key);

  static Route get route {
    return MaterialPageRoute(builder: (_) {
      return const CustomWidgetCircle();
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: const Color(0xFF448E6F),
                  child: Stack(alignment: Alignment.topCenter, children: [
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
                      padding: const EdgeInsets.all(26.0),
                      child: CircleView(
                        progress: ref.watch(progressProvider),
                        baseColor: const Color(0xFF275B43),
                        progressColor: const Color(0xff449070),
                        progressImage: Assets.menuDeleteAccount,
                        size: const Size(400, 400),
                        progressStrokeWidth: 22,
                        baseStrokeWidth: 18,
                        imageSize: 55,
                      ),
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 40,
                ),
                const CircleProgress(),
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: const BoxDecoration(
                      gradient: SweepGradient(
                        center: FractionalOffset.center,
                        colors: <Color>[
                          Color(0xFFFDFF87),
                          Color(0xFF6CCEAE),
                          Color(0xFF6CCEAE),
                          Color(0xFFFDFF87),
                          // blue again to seamlessly transition to the start
                        ],
                        stops: <double>[0.0, 0.33, 0.66, 1],
                        transform: GradientRotation(-pi / 2),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      ref.read(progressProvider.notifier).state = 360;
                    },
                    child: const Text("360")),
                ElevatedButton(
                    onPressed: () async {
                      ref.read(progressProvider.notifier).state = 270;
                    },
                    child: const Text("270")),
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
          ),
        ));
  }
}
