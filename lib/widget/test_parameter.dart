import 'package:flutter/material.dart';
import 'package:flutter_project/widget/animation/animation_one.dart';
import 'package:flutter_project/widget/app_appbar.dart';
import 'package:flutter_project/widget/app_scaffold.dart';

class TestParameterScreen extends StatefulWidget {
  const TestParameterScreen({Key? key}) : super(key: key);

  static Route get route {
    return MaterialPageRoute(builder: (_) {
      return const TestParameterScreen();
    });
  }

  @override
  State<TestParameterScreen> createState() => _TestParameterScreenState();
}

class _TestParameterScreenState extends State<TestParameterScreen> {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final textTheme = Theme.of(context).textTheme;
    final closeButton = Material(
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          shape: BoxShape.circle,
        ),
        child: IconButton(
            padding: const EdgeInsets.all(0),
            iconSize: 32,
            onPressed: () {},
            icon: const Icon(
              Icons.clear,
              color: Colors.white,
            )),
      ),
    );
    return AppScaffold(
      appBar: AppAppBar(
        context: context,
        title: const Text(
          "测试属性",
        ),
      ),
      body: Container(
        width: 220,
        height: 20,
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 0.5)),
        child: TextField(
          maxLines: 1,
          scrollPadding: EdgeInsets.all(0),
          controller: TextEditingController(),
          style: Theme.of(context).textTheme.bodyText2,
          enabled: false,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(0),
            fillColor: Colors.red,
            hintText: "選択してください",
            border: OutlineInputBorder(), // TODO:重点
          ),
        ),
      ),
    );
  }
}
