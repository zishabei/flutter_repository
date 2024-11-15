import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/empty_screen/screen_1.dart';
import 'package:flutter_project/example/clock/custom_clock.dart';
import 'package:flutter_project/riverpod/future_provider/future_provider_test.dart';
import 'package:flutter_project/riverpod/hello_riverpod.dart';
import 'package:flutter_project/riverpod/riverpod_consumer.dart';
import 'package:flutter_project/useplugin/web_view_test.dart';
import 'package:flutter_project/value_notifier.dart';
import 'package:flutter_project/widget/animation/animated_builder_study.dart';
import 'package:flutter_project/widget/animation/animation_one_screen.dart';
import 'package:flutter_project/widget/animation/base_animation_study.dart';
import 'package:flutter_project/widget/animation/logo_rotate.dart';
import 'package:flutter_project/widget/buttons_screen.dart';
import 'package:flutter_project/widget/calendar/custom_calendar.dart';
import 'package:flutter_project/widget/custom_text_field.dart';
import 'package:flutter_project/widget/test_parameter.dart';
import 'package:flutter_project/widget/widget/bottom_navigation.dart';
import 'package:flutter_project/widget/widget/custom_widget.dart';
import 'package:flutter_project/widget/widget/custom_widget_circle.dart';
import 'package:flutter_project/widget/widget/custom_widget_circle_three.dart';
import 'package:flutter_project/widget/widget/custom_widget_circle_two.dart';
import 'package:flutter_project/widget/widget/inherited_widget_test.dart';
import 'package:flutter_project/widget/widget/layout_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'change_notifier.dart';
import 'my_route_observer.dart';
import 'useplugin/fl_chart/fl_bar_chart_example.dart';
import 'useplugin/fl_chart/fl_bar_chart_example_2.dart';
import 'useplugin/fl_chart/fl_liner_chart_example.dart';
import 'useplugin/fl_chart/fl_liner_chart_sapporo.dart';
import 'widget/widget/audio_players_test.dart';
import 'widget/widget/custom_material_button.dart';
import 'widget/widget/textfield.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  // Fetch the available cameras before initializing the app.
  WidgetsFlutterBinding.ensureInitialized();
  Intl.defaultLocale = 'ja_JP';
  await initializeDateFormatting("ja_JP");
  runApp(const ProviderScope(child: MyApp()));
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorObservers: [MyRouteObserver()],
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
                      Navigator.of(context).push(CustomWidgetCircleTwo.route);
                    },
                    child: buttonText("自定义半圆⭕️视图")),
                ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).push(CustomWidgetCircleThree.route);
                    },
                    child: buttonText("自定义分段⭕️视图")),
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
                ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).push(ButtonsScreen.route);
                    },
                    child: buttonText("Buttons")),
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
                ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context)
                        .push(BottomNavigationBarExampleApp.route);
                  },
                  child: buttonText("BottomNavigationBar"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).push(FlBarChartExample.route);
                  },
                  child: buttonText("FlBarChartExample"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).push(BarChartSample1.route);
                  },
                  child: buttonText("BarChartSample1"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).push(FlLineChartExample.route);
                  },
                  child: buttonText("FlLineChartExample"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).push(FlLineChartSapporo.route);
                  },
                  child: buttonText("FlLineChartSapporo"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.of(this.context).push(Screen1.route);
                  },
                  child: buttonText("current route name"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.of(this.context).push(LogoRotate.route);
                  },
                  child: buttonText("AnimatedRotation"),
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
          ?.copyWith(fontSize: 16, color: Colors.black),
    );
  }
}
