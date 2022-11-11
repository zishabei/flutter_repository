import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const _defaultLeftColor = Color(0xff8BC84E);
const _defaultRightColor = Color(0xff229BEC);

class AnimationOne extends StatefulHookConsumerWidget {
  const AnimationOne({
    Key? key,
    required double width,
    double height = 40,
    double borderRadius = 20,
    required double renderPercentage,
    Color leftColor = _defaultLeftColor,
    Color rightColor = _defaultRightColor,
  })  : _width = width,
        _renderPercentage = renderPercentage,
        _height = height,
        _borderRadius = borderRadius,
        _leftColor = leftColor,
        _rightColor = rightColor,
        super(key: key);

  final double _width;
  final double _renderPercentage;
  final double _height;
  final double _borderRadius;
  final Color _leftColor;
  final Color _rightColor;

  @override
  ConsumerState<AnimationOne> createState() => _AnimationOneState();
}

class _AnimationOneState extends ConsumerState<AnimationOne>
    with SingleTickerProviderStateMixin {
  final int animationDuration = 1000;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: animationDuration),
      vsync: this,
    );
    _animationController.forward(from: 0.0);
  }

  @override
  void didUpdateWidget(AnimationOne oldWidget) {
    super.didUpdateWidget(oldWidget);
    _animationController.duration = Duration(milliseconds: animationDuration);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widthTween = useAnimation<double>(
      Tween<double>(
              begin: widget._width,
              end: max(
                  widget._width - (widget._width * widget._renderPercentage),
                  0.0))
          .animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeInOutCubic,
        ),
      ),
    );

    return Container(
      clipBehavior: Clip.hardEdge,
      width: widget._width,
      height: widget._height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.centerLeft,
          end: FractionalOffset.centerRight,
          colors: [widget._leftColor, widget._rightColor],
        ),
        borderRadius: BorderRadius.circular(widget._borderRadius),
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
              width: widthTween,
              height: widget._height,
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
}
