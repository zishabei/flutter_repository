import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/widget/animation/animation_one_screen.dart';
import 'package:flutter_project/widget/calendar/custom_calendar.dart';
import 'package:flutter_project/widget/custom_text_field.dart';
import 'package:flutter_project/widget/test_parameter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
  );
  AssetPicker.registerObserve();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(CustomCalendar.route);
                  },
                  child: const Text("custom calendar")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(AnimationOneScreen.route);
                  },
                  child: const Text("animation one")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(CustomCalendar.route);
                  },
                  child: const Text("custom calendar")),
              ElevatedButton(
                  onPressed: () async {
                    final List<AssetEntity>? result =
                        await AssetPicker.pickAssets(context);
                  },
                  child: const Text("选择照片")),
              ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).push(TestParameterScreen.route);
                  },
                  child: const Text("测试属性")),
              ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).push(CustomTextField.route);
                  },
                  child: const Text("自定义文本输入框"))
            ],
          ),
        ));
  }
}
