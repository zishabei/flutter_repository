import 'package:flutter/material.dart';
import 'package:flutter_project/widget/animation/animation_one.dart';
import 'package:flutter_project/widget/app_appbar.dart';
import 'package:flutter_project/widget/app_scaffold.dart';

class AnimationOneScreen extends StatefulWidget {
  const AnimationOneScreen({Key? key}) : super(key: key);

  static Route get route {
    return MaterialPageRoute(builder: (_) {
      return const AnimationOneScreen();
    });
  }

  @override
  State<AnimationOneScreen> createState() => _AnimationOneScreenState();
}

class _AnimationOneScreenState extends State<AnimationOneScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appBar: AppAppBar(
          context: context,
          title: const Text(
            "animation",
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          child: const AnimationOne(
            width: 200,
            renderPercentage: 0.9,
          ),
        ));
  }
}
