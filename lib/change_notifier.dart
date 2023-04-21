import 'dart:math';

import 'package:flutter/material.dart';

import 'widget/app_debug.dart';

@immutable
class Person {
  final String name;
  final int age;

  const Person({required this.name, required this.age});

  Person copyWith({String? name, int? age}) {
    return Person(name: name ?? this.name, age: this.age);
  }

  @override
  String toString() => 'my name is $name, age is $age';
}

class ChangeNotifierTest extends ChangeNotifier {
  Person person;

  ChangeNotifierTest({required this.person});

  Person get value => person;

  void setValueImmutable({required Person person}) {
    if (this.person.hashCode == person.hashCode) return;
    this.person = person;
    notifyListeners();
  }

  void setValueMutable({required Person person}) {
    this.person = person;
    notifyListeners();
  }
}

const _basePerson = Person(name: "王强", age: 31);

class ChangeNotifierWidget extends StatelessWidget {
  ChangeNotifierWidget({Key? key}) : super(key: key);

  static Route get route {
    return MaterialPageRoute(builder: (_) {
      return ChangeNotifierWidget();
    });
  }

  final personChangeNotifier = ChangeNotifierTest(person: _basePerson);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChangeNotifier'),
      ),
      body: Center(
        child: Column(
          children: [
            /// 初始化时用的是_basePerson，此处重新设值还是用的_basePerson。
            /// setValueImmutable不会触发notifier。
            ElevatedButton(
                onPressed: () {
                  personChangeNotifier.setValueImmutable(person: _basePerson);
                },
                child: const Text("修改不变的数据")),

            /// 初始化时用的是_basePerson，此处重新设值还是用的_basePerson。
            /// setValueMutable会触发notifier。
            ElevatedButton(
                onPressed: () {
                  personChangeNotifier.setValueMutable(person: _basePerson);
                },
                child: const Text("修改可变的数据①")),

            /// 初始化时用的是_basePerson，此处重新设值时使用_basePerson的copyWith方法。
            /// 此时不管使用setValueImmutable还是setValueMutable都会触发notifier。
            ElevatedButton(
                onPressed: () {
                  personChangeNotifier.setValueImmutable(
                      person: _basePerson.copyWith(name: "王志强"));
                },
                child: const Text("修改可变的数据②")),
            AnimatedBuilder(
              // [AnimatedBuilder] accepts any [Listenable] subtype.
              animation: personChangeNotifier,
              builder: (BuildContext context, Widget? child) {
                AppDebug.log(
                    "--------:${personChangeNotifier.value.toString()}");
                return Text(
                  personChangeNotifier.value.toString(),
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(
                        (Random().nextDouble() * 0xFFFFFF).toInt() << 0,
                      ).withOpacity(1.0)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
