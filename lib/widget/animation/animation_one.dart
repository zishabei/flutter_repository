import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnimationOne extends StatefulHookConsumerWidget {
  const AnimationOne({
    Key? key,
    required double width,
    required double renderPercentage,
  })  : _width = width,
        _renderPercentage = renderPercentage,
        super(key: key);

  final double _width;
  final double _renderPercentage;

  @override
  ConsumerState<AnimationOne> createState() => _AnimationOneState();
}

class _AnimationOneState extends ConsumerState<AnimationOne>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward(from: 0.0);
    });
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
              width: widthTween,
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
}
