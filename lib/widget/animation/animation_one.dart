import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnimationOne extends StatefulHookConsumerWidget {
  const AnimationOne({
    Key? key,
    required double width,
  })  : _width = width,
        super(key: key);

  final double _width;

  @override
  ConsumerState<AnimationOne> createState() => _AnimationOneState();
}

class _AnimationOneState extends ConsumerState<AnimationOne>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late double _widthTween;
  double _widthTweenEndValue = 0.0;
  late final double _widthTweenBeginValue = widget._width;
  int _todaySteps = 0;
  final int _dailyStepsGoal = 100;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _todaySteps = 20;
      _setGraphPercentage();
      _animationController.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    _widthTween = useAnimation<double>(
      Tween<double>(begin: _widthTweenBeginValue, end: _widthTweenEndValue)
          .animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeInOutCubic,
        ),
      ),
    );
    const height = 40.0;
    const borderRadius = height / 2.0;

    return Container(
      clipBehavior: Clip.hardEdge,
      width: widget._width,
      height: height,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: FractionalOffset.centerLeft,
          end: FractionalOffset.centerRight,
          colors: [Color(0xff8BC84E), Color(0xff229BEC)],
        ),
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: _widthTween,
              height: height,
              color: Colors.white,
            ),
          ),
          Center(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 8),
            ),
          ),
        ],
      ),
    );
  }

  void _setGraphPercentage() {
    final percentage = _todaySteps / _dailyStepsGoal;
    _widthTweenEndValue = percentage.isNaN
        ? _widthTweenBeginValue
        : max(
            _widthTweenBeginValue - (_widthTweenBeginValue * percentage), 0.0);
  }
}
