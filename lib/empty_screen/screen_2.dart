import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Screen2 extends ConsumerStatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  static Route get route {
    return MaterialPageRoute(
        // settings: const RouteSettings(name: "/Screen2"),
        builder: (_) {
          return const Screen2();
        });
  }

  @override
  ConsumerState<Screen2> createState() => _Screen2State();
}

class _Screen2State extends ConsumerState<Screen2> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Screen2'),
        ),
        body: Center(
          child: Text("${ModalRoute.of(this.context)?.settings.name}"),
        ));
  }
}
