import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_project/gen/assets/assets.gen.dart';
import 'package:flutter_project/widget/widget/custom/circle_view.dart';
import 'package:flutter_project/widget/widget/custom/circle_view_two.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'custom/circle_progress.dart';

class CustomWidgetCircleTwo extends ConsumerStatefulWidget {
  const CustomWidgetCircleTwo({Key? key}) : super(key: key);

  static Route get route {
    return MaterialPageRoute(builder: (_) {
      return const CustomWidgetCircleTwo();
    });
  }

  @override
  ConsumerState<CustomWidgetCircleTwo> createState() =>
      _CustomWidgetCircleTwoState();
}

class _CustomWidgetCircleTwoState extends ConsumerState<CustomWidgetCircleTwo> {
  final progressProvider = StateProvider<double>((ref) => 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFECF5DE),
        appBar: AppBar(
          title: const Text("CustomWidgetCircle"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: CircleViewTwo(
                    progress: ref.watch(progressProvider) / 360,
                    baseColor: Colors.white,
                    progressStartColor: const Color(0xFFF6F2AC),
                    progressEndColor: const Color(0xFFEA9425),
                    size: const Size(200, 200),
                    progressStrokeWidth: 12,
                    baseStrokeWidth: 12,
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
                          Color(0xFFF6F2AC),
                          Color(0xFFF6F2AC),
                          Color(0xFFEA9425),
                          Color(0xFFEA9425),
                        ],
                        stops: <double>[0.0, 0.33, 0.66, 1],
                        transform: GradientRotation(pi / 2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
