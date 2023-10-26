import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_project/widget/app_debug.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'screen_2.dart';

class Screen1 extends StatefulHookConsumerWidget {
  const Screen1({Key? key}) : super(key: key);

  static Route get route {
    return MaterialPageRoute(
        settings: const RouteSettings(name: "/Screen1"),
        builder: (_) {
          return const Screen1();
        });
  }

  @override
  ConsumerState<Screen1> createState() => _Screen1State();
}

class _Screen1State extends ConsumerState<Screen1> {
  @override
  Widget build(BuildContext context) {
    useOnAppLifecycleStateChange((previous, current) {
      AppDebug.log("Route Name: ${ModalRoute.of(this.context)?.settings.name}");
    });
    return Scaffold(
        appBar: AppBar(
          title: const Text('Screen1'),
        ),
        body: Center(
          child: Column(
            children: [
              Text("${ModalRoute.of(this.context)?.settings.name}"),
              ElevatedButton(
                onPressed: () async {
                  Navigator.of(this.context).push(Screen2.route);
                },
                child: buttonText("To Screen2"),
              ),
            ],
          ),
        ));
  }

  Widget buttonText(String text) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .button
          ?.copyWith(fontSize: 16, color: Colors.white),
    );
  }
}
