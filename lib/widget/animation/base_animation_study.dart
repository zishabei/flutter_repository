import 'package:flutter/material.dart';
import 'package:flutter_project/widget/app_debug.dart';

class BaseAnimationStudy extends StatefulWidget {
  const BaseAnimationStudy({Key? key}) : super(key: key);

  static Route get route {
    return MaterialPageRoute(builder: (_) {
      return const BaseAnimationStudy();
    });
  }

  @override
  State<BaseAnimationStudy> createState() => _BaseAnimationStudyState();
}

class _BaseAnimationStudyState extends State<BaseAnimationStudy>
    with SingleTickerProviderStateMixin {
  // AnimationController自带一个从0到1的匀速插值器。
  late AnimationController _animationController;
  late Animation _tweenAnimation;
  double left = 0;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    // AnimationController默认起始值为0，结束值为1。可以通过Tween改变起始值与结束值。
    _animationController.addListener(() {
      AppDebug.log("原始：${_animationController.value}");
    });

    // Tween修改起始终止值
    // CurvedAnimation变速插值
    _tweenAnimation = Tween(begin: 0.0, end: 200.0).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.elasticInOut));
    _tweenAnimation.addListener(() {
      AppDebug.log("修改后：${_tweenAnimation.value}");
      setState(() {
        left = _tweenAnimation.value;
      });
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('动画学习'),
      ),
      body: Stack(
        children: [
          Positioned(
              left: left,
              child: Container(
                width: 30,
                height: 30,
                color: Colors.red,
              )),
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  _animationController.reset();
                  _animationController.forward();
                },
                child: const Text("再执行")),
          )
        ],
      ),
    );
  }
}
