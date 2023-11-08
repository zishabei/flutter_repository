import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_project/gen/assets/assets.gen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'custom/circle_progress.dart';
import 'custom/circle_view_three.dart';

class CustomWidgetCircleThree extends ConsumerStatefulWidget {
  const CustomWidgetCircleThree({Key? key}) : super(key: key);

  static Route get route {
    return MaterialPageRoute(builder: (_) {
      return const CustomWidgetCircleThree();
    });
  }

  @override
  ConsumerState<CustomWidgetCircleThree> createState() =>
      _CustomWidgetCircleState();
}

class _CustomWidgetCircleState extends ConsumerState<CustomWidgetCircleThree> {
  final progressProvider = StateProvider<double>((ref) => 0);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
                  width: screenWidth,
                  height: screenWidth,
                  child: Stack(
                    children: [
                      Center(
                        child: FractionallySizedBox(
                          widthFactor: 0.5,
                          heightFactor: 0.5,
                          child: CircleViewThree(
                            progress: ref.watch(progressProvider),
                            size: Size(screenWidth / 4, screenWidth / 4),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(-0.9, 0),
                        child:
                            Assets.menuAccount.image(width: screenWidth / 10),
                      ),
                      Align(
                        alignment: Alignment(-0.85, 0.5),
                        child:
                            Assets.menuContact.image(width: screenWidth / 10),
                      ),
                      Align(
                        alignment: Alignment(-0.9, 0.9),
                        child: Assets.menuDeleteAccount
                            .image(width: screenWidth / 10),
                      ),
                      Align(
                        alignment: Alignment(0.6, 0.7),
                        child: Assets.menuFaq.image(width: screenWidth / 10),
                      ),
                      Align(
                        alignment: Alignment(0.6, -0.6),
                        child: Assets.menuHowTo.image(width: screenWidth / 10),
                      ),
                    ],
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
              ],
            ),
          ),
        ));
  }
}
