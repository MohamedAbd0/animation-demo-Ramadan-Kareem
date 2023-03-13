import 'dart:math';

import 'package:flutter/material.dart';

import 'pointer.dart';

class RamadanLanternWidget extends StatefulWidget {
  final RamadanLanternPosition ramadanLanternPosition;
  const RamadanLanternWidget({super.key, required this.ramadanLanternPosition});

  @override
  State<RamadanLanternWidget> createState() => _RamadanLanternWidgetState();
}

class _RamadanLanternWidgetState extends State<RamadanLanternWidget>
    with TickerProviderStateMixin {
  late AnimationController _rotateController;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();

    late double startAngle = 0;
    late double endAngle = 0;
    if (widget.ramadanLanternPosition == RamadanLanternPosition.right) {
      startAngle = -pi / 8;
      endAngle = pi / 8;
    } else {
      startAngle = pi / 8;
      endAngle = -pi / 8;
    }
    _rotateController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _rotateAnimation = Tween<double>(begin: startAngle, end: endAngle)
        .animate(_rotateController);

    Future.delayed(const Duration(seconds: 1), () {
      _rotateController.forward();
    });

    _rotateController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _rotateAnimation = Tween<double>(
          begin: _rotateAnimation.value,
          end: -_rotateAnimation.value, // to be end angle + 180 degrees
        ).animate(_rotateController);

        // reset the flip controller and start the animation
        _rotateController
          ..reset()
          ..forward();
      }
    });
  }

  @override
  void dispose() {
    _rotateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AnimatedBuilder(
        animation: _rotateController,
        builder: (context, child) {
          return Transform(
            alignment: Alignment.topCenter,
            transform: Matrix4.identity()..rotateZ(_rotateAnimation.value),
            child: CustomPaint(
              painter: RamadanLanternPainter(
                width: 100,
                height: 120,
                strokeWidth: 5,
                color: Colors.blue,
              ),
              size: const Size(100, 200),
            ),
          );
        },
      ),
    );
  }
}

enum RamadanLanternPosition { left, right }
