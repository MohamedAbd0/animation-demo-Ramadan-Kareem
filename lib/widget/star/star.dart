import 'package:flutter/material.dart';
import 'pointer.dart';

class StarWidget extends StatefulWidget {
  final double radius;
  final Color color;
  final int numPoints;
  final double lineWidth;

  const StarWidget({
    super.key,
    required this.radius,
    required this.color,
    this.numPoints = 5,
    this.lineWidth = 2,
  });

  @override
  State<StarWidget> createState() => _StarWidgetState();
}

class _StarWidgetState extends State<StarWidget> with TickerProviderStateMixin {
  late AnimationController _rotateController;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();

    _rotateController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _rotateAnimation =
        Tween<double>(begin: 0, end: 1).animate(_rotateController);

    _rotateController.forward();

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
    return AnimatedBuilder(
      animation: _rotateController,
      builder: (context, child) {
        return CustomPaint(
          painter: StarPainter(
            radius: widget.radius * _rotateAnimation.value,
            color: widget.color,
            numPoints: widget.numPoints,
            lineWidth: widget.lineWidth * _rotateAnimation.value,
          ),
          size: Size(widget.radius, widget.radius),
        );
      },
    );
  }
}
