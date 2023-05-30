import 'package:flutter/material.dart';
import 'package:flutter_project/widget/app_debug.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


/// Consumer组件可实现局部刷新！！！！！！！！
class RiverpodConsumer extends ConsumerWidget {
  RiverpodConsumer({Key? key}) : super(key: key);

  static Route get route {
    return MaterialPageRoute(builder: (_) {
      return RiverpodConsumer();
    });
  }

  final counterProvider = StateProvider((ref) => 0);
  final selfCounterProvider = StateProvider((ref) => 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppDebug.log("RiverpodConsumer build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Riverpod Consumer"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          ElevatedButton(
            onPressed: () async {
              ref.read(counterProvider.notifier).state++;
            },
            child: const Text("全局ref +1"),
          ),
          const SizedBox(
            height: 60,
          ),
          Text("counter:${ref.watch(counterProvider)}"),
          const SizedBox(
            height: 60,
          ),
          ElevatedButton(
            onPressed: () async {
              ref.read(selfCounterProvider.notifier).state++;
            },
            child: const Text("consumer ref +1"),
          ),
          const SizedBox(
            height: 60,
          ),
          Consumer(
            builder: (context, ref, child) {
              return Text("counter:${ref.watch(selfCounterProvider)}");
            },
          ),
          const SizedBox(
            height: 60,
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}
