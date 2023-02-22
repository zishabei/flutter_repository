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
  double width = 200;

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
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SmartAnimation(
                key: UniqueKey(),
                size: Size(width, 40),
              ),
              const SizedBox(
                height: 20,
              ),
              // AnimationOne这种方式不推荐，持有状态值太多。使用TweenAnimationBuilder最合适
              AnimationOne(
                key: UniqueKey(),
                width: width,
                renderPercentage: 0.9,
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), //角の丸み
                  side: const BorderSide(color: Colors.red), //枠線の設定
                ),
                color: Colors.blue,
                child: const Text(
                  'restart animation',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    width = 200;
                  });
                },
              )
            ],
          ),
        ));
  }
}

class SmartAnimation extends StatelessWidget {
  final Size size;

  const SmartAnimation({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: size.width - 50),
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCubic,
        builder: (context, anim, child) {
          return SizedBox(
            width: size.width,
            child: Stack(
              children: [
                Container(
                  width: size.width,
                  height: size.height,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: FractionalOffset.centerLeft,
                        end: FractionalOffset.centerRight,
                        colors: [Color(0xff8BC84E), Color(0xff229BEC)],
                      ),
                      color: Colors.red,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[400]!,
                            blurRadius: 2,
                            offset: const Offset(0, 2))
                      ],
                      borderRadius: BorderRadius.circular(20)),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: size.width - anim,
                    height: size.height,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: anim == 0
                            ? BorderRadius.circular(20)
                            : const BorderRadius.horizontal(
                                right: Radius.circular(20))),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
