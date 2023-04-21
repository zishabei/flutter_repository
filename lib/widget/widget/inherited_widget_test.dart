import 'package:flutter/material.dart';
import 'package:flutter_project/widget/app_debug.dart';

class _InheritedCounter extends InheritedWidget {
  const _InheritedCounter(
      {Key? key, required Widget child, required this.count})
      : super(key: key, child: child);

  final int count;

  @override
  bool updateShouldNotify(_InheritedCounter old) => true;

  static _InheritedCounter? of(BuildContext context, {required bool listen}) {
    return listen
        ? context.dependOnInheritedWidgetOfExactType<_InheritedCounter>()
        : context
            .getElementForInheritedWidgetOfExactType<_InheritedCounter>()
            ?.widget as _InheritedCounter;
  }
}

class InheritedWidgetTest extends StatefulWidget {
  const InheritedWidgetTest({Key? key}) : super(key: key);

  static Route get route {
      return MaterialPageRoute(builder: (_) {
        return const InheritedWidgetTest();
      });
    }

  @override
  State createState() => _InheritedWidgetTestState();
}

class _InheritedWidgetTestState extends State<InheritedWidgetTest> {
  var _count = 0;

  @override
  Widget build(BuildContext context) {
    AppDebug.log('Built CounterPageState');

    return _InheritedCounter(
      count: _count,
      child: Scaffold(
          appBar: AppBar(title: const Text('Inherited Widget Sample')),
          floatingActionButton: FloatingActionButton(
            onPressed: _increment,
            child: const Icon(Icons.add),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [WidgetA(), WidgetB()],
          )),
    );
  }

  void _increment() {
    setState(() {
      _count++;
    });
  }
}

class WidgetA extends StatelessWidget {
  const WidgetA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppDebug.log('Built WidgetA');

    return Center(
        child: Text(
            'CounterA: ${_InheritedCounter.of(context, listen: true)?.count}',
            style: const TextStyle(fontSize: 20)));
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppDebug.log('Built WidgetB');

    return Center(
        child: Text(
            'CounterA: ${_InheritedCounter.of(context, listen: false)?.count}',
            style: const TextStyle(fontSize: 20)));
  }
}
