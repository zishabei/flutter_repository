import 'package:flutter/material.dart';
import 'package:flutter_project/gen/assets/assets.gen.dart';
import 'package:flutter_project/widget/widget/custom/circle_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
                  padding: const EdgeInsets.all(26.0),
                  child: CircleView(
                    progress: ref.watch(progressProvider),
                    baseColor: const Color(0xFFD1EFE3),
                    progressColor: const Color(0xff449070),
                    progressImage: Assets.menuDeleteAccount,
                    size: const Size(400, 400),
                    progressStrokeWidth: 22,
                    baseStrokeWidth: 18,
                    imageSize: 55,
                  ),
                ),
              ]),
              ElevatedButton(
                  onPressed: () async {
                    ref.read(progressProvider.notifier).state = 360;
                  },
                  child: const Text("360")),
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
}
