import 'package:flutter/material.dart';

import 'widget/app_debug.dart';

class ValueNotifierTest extends StatefulWidget {
  const ValueNotifierTest({Key? key}) : super(key: key);

  static Route get route {
    return MaterialPageRoute(builder: (_) {
      return const ValueNotifierTest();
    });
  }

  @override
  State<ValueNotifierTest> createState() => _ValueNotifierTestState();
}

class _ValueNotifierTestState extends State<ValueNotifierTest> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: const Text('AnimatedBuilder example')),
        body: CounterBody(counterValueNotifier: _counter),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _counter.value = 0,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class CounterBody extends StatelessWidget {
  const CounterBody({super.key, required this.counterValueNotifier});

  final ValueNotifier<int> counterValueNotifier;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Current counter value:'),

          // TODO:AnimatedBuilder和ValueListenableBuilder之所以可以监听ValueNotifier，是因为这两个组件都持有Listenable属性。

          // Thanks to the [AnimatedBuilder], only the widget displaying the
          // current count is rebuilt when `counterValueNotifier` notifies its
          // listeners. The [Text] widget above and [CounterBody] itself aren't
          // rebuilt.
          AnimatedBuilder(
            // [AnimatedBuilder] accepts any [Listenable] subtype.
            animation: counterValueNotifier,
            builder: (BuildContext context, Widget? child) {
              AppDebug.log(
                  "AnimatedBuilder counterValueNotifier.value:${counterValueNotifier.value}");
              return Text('${counterValueNotifier.value}');
            },
          ),

          ValueListenableBuilder<int>(
            builder: (BuildContext context, int value, Widget? child) {
              // This builder will only get called when the counterValueNotifier
              // is updated.
              AppDebug.log(
                  "ValueListenableBuilder counterValueNotifier.value:${counterValueNotifier.value}");
              return Text('$value');
            },
            valueListenable: counterValueNotifier,
          )
        ],
      ),
    );
  }
}
