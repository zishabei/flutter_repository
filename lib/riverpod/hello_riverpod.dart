import 'package:flutter/material.dart';
import 'package:flutter_project/riverpod/provider/riverpod_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

/// part很关键，配置好riverpod后，控制台执行flutter pub run build_runner watch，
/// 此命令将在修改并保存dart文件时自动生成hello_riverpod.g.dart文件。
part 'hello_riverpod.g.dart';

// We create a "provider", which will store a value (here "Hello world").
// By using a provider, this allows us to mock/override the value exposed.
@riverpod
String helloWorld(HelloWorldRef ref) {
  return 'Hello world';
}

class HelloRiverpod extends ConsumerStatefulWidget {
  const HelloRiverpod({Key? key}) : super(key: key);

  static Route get route {
    return MaterialPageRoute(builder: (_) {
      return const HelloRiverpod();
    });
  }

  @override
  ConsumerState<HelloRiverpod> createState() => _HelloRiverpodState();
}

class _HelloRiverpodState extends ConsumerState<HelloRiverpod> {
  @override
  Widget build(BuildContext context) {
    final String value = ref.watch(helloWorldProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(value),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          spacing: 8.0, // gap between adjacent chips
          runSpacing: 4.0, // gap between lines
          children: <Widget>[
            MaterialButton(
                color: Colors.blue[300],
                child: const Text("Provider"),
                onPressed: () {
                  Navigator.of(context).push(RiverpodProvider.route);
                })
          ],
        ),
      ),
    );
  }
}
