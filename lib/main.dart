import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/example/clock/custom_clock.dart';
import 'package:flutter_project/riverpod/future_provider/future_provider_test.dart';
import 'package:flutter_project/riverpod/hello_riverpod.dart';
import 'package:flutter_project/riverpod/riverpod_consumer.dart';
import 'package:flutter_project/useplugin/web_view_test.dart';
import 'package:flutter_project/value_notifier.dart';
import 'package:flutter_project/widget/animation/animated_builder_study.dart';
import 'package:flutter_project/widget/animation/animation_one_screen.dart';
import 'package:flutter_project/widget/animation/base_animation_study.dart';
import 'package:flutter_project/widget/calendar/custom_calendar.dart';
import 'package:flutter_project/widget/custom_text_field.dart';
import 'package:flutter_project/widget/test_parameter.dart';
import 'package:flutter_project/widget/widget/custom_widget.dart';
import 'package:flutter_project/widget/widget/custom_widget_circle.dart';
import 'package:flutter_project/widget/widget/inherited_widget_test.dart';
import 'package:flutter_project/widget/widget/layout_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import 'change_notifier.dart';
import 'widget/camera/camera_example_home.dart';
import 'widget/widget/audio_players_test.dart';
import 'widget/widget/custom_material_button.dart';
import 'widget/widget/textfield.dart';

List<CameraDescription> cameras = <CameraDescription>[];

Future<void> main() async {
  // Fetch the available cameras before initializing the app.
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {}
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
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 20, bottom: 40),
            alignment: Alignment.topCenter,
            child: Wrap(
              spacing: 12.0,
              runSpacing: 8.0,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(CustomCalendar.route);
                    },
                    child: buttonText("自定义calendar")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(CustomCalendar.route);
                    },
                    child: buttonText("自定义calendar")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(AnimationOneScreen.route);
                    },
                    child: buttonText("animation one")),
                ElevatedButton(
                    onPressed: () async {
                      final List<AssetEntity>? result =
                          await AssetPicker.pickAssets(context);
                    },
                    child: buttonText("选择照片")),
                ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).push(TestParameterScreen.route);
                    },
                    child: buttonText("测试属性")),
                ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).push(CustomTextField.route);
                    },
                    child: buttonText("自定义文本输入框")),
                ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).push(CameraExampleHome.route);
                    },
                    child: buttonText("相机")),
                ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).push(MyTextFormView.route);
                    },
                    child: buttonText("TextField添加【完成】按钮")),
                ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).push(LayoutTest.route);
                    },
                    child: buttonText("test layout")),
                ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).push(CustomWidget.route);
                    },
                    child: buttonText("自定义视图")),
                ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).push(CustomWidgetCircle.route);
                    },
                    child: buttonText("自定义⭕️视图")),
                ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).push(BaseAnimationStudy.route);
                    },
                    child: buttonText("基础动画")),
                ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).push(AnimatedBuilderStudy.route);
                    },
                    child: buttonText("高效动画")),
                ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).push(CustomClock.route);
                    },
                    child: buttonText("自定义钟表")),
                const CustomMaterialButton(),
                ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).push(ChangeNotifierWidget.route);
                    },
                    child: buttonText("change notifier")),
                ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).push(ValueNotifierTest.route);
                    },
                    child: buttonText("value notifier")),
                ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).push(WebViewTest.route);
                    },
                    child: buttonText("web view")),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).push(HelloRiverpod.route);
                  },
                  child: buttonText("riverpod"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).push(RiverpodConsumer.route);
                  },
                  child: buttonText("Consumer"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).push(InheritedWidgetTest.route);
                  },
                  child: buttonText("Inherited Widget Sample"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).push(AudioPayersTest.route);
                  },
                  child: buttonText("audioplayers"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).push(FutureProviderTest.route);
                  },
                  child: buttonText("FutureProvider"),
                ),
              ],
            ),
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
