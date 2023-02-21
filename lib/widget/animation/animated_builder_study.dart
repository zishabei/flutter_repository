import 'package:flutter/material.dart';

class AnimatedBuilderStudy extends StatefulWidget {
  const AnimatedBuilderStudy({Key? key}) : super(key: key);

  static Route get route {
    return MaterialPageRoute(builder: (_) {
      return const AnimatedBuilderStudy();
    });
  }

  @override
  State<AnimatedBuilderStudy> createState() => _AnimatedBuilderStudyState();
}

class _AnimatedBuilderStudyState extends State<AnimatedBuilderStudy> {
  double beginValue = 88.0;
  double targetValue = 88.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('高效动画'),
      ),
      body: Center(
        child: TweenAnimationBuilder(
            tween: Tween(begin: beginValue, end: targetValue),
            // curve: Curves.elasticInOut,
            duration: const Duration(seconds: 1),
            child: const Icon(Icons.aspect_ratio),
            builder: (BuildContext context, double size, Widget? child) {
              return IconButton(
                iconSize: size,
                color: Colors.blue,
                icon: child!,
                onPressed: () {
                  setState(() {
                    beginValue = beginValue == 44.0 ? 44.0 : 88.0;
                    targetValue = targetValue == 44.0 ? 88.0 : 44.0;
                  });
                },
              );
            }),
      ),
    );
  }
}
