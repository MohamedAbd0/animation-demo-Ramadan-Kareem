import 'dart:math';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class CharWidget extends StatefulWidget {
  final String char;
  final double widthAndHeight;

  const CharWidget({Key? key, required this.char, required this.widthAndHeight})
      : super(key: key);

  @override
  State<CharWidget> createState() => _CharWidgetState();
}

class _CharWidgetState extends State<CharWidget> with TickerProviderStateMixin {
  late AnimationController _xController;
  late AnimationController _yController;
  late AnimationController _zController;
  late Animation<double> _xAnimation;
  late Animation<double> _yAnimation;
  late Animation<double> _zAnimation;

  late double widthAndHeight = widget.widthAndHeight;

  @override
  void initState() {
    super.initState();

    _xController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _yController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _zController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _xAnimation = Tween<double>(
      begin: -pi / 8,
      end: pi / 8,
    ).animate(_xController);

    _yAnimation = Tween<double>(
      begin: -pi / 16,
      end: pi / 16,
    ).animate(_yController);

    _zAnimation = Tween<double>(
      begin: -pi / 16,
      end: pi / 16,
    ).animate(_zController);

    Future.delayed(const Duration(seconds: 1), () {
      _xController.forward();
      _yController.forward();
      _zController.forward();
    });

    _yController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _xAnimation = Tween<double>(
          begin: _xAnimation.value,
          end: -_xAnimation.value,
        ).animate(_xController);

        _yAnimation = Tween<double>(
          begin: _yAnimation.value,
          end: -_yAnimation.value,
        ).animate(_yController);

        _zAnimation = Tween<double>(
          begin: _zAnimation.value,
          end: -_zAnimation.value,
        ).animate(_zController);

        _xController
          ..reset()
          ..forward();

        _yController
          ..reset()
          ..forward();

        _zController
          ..reset()
          ..forward();
      }
    });
  }

  @override
  void dispose() {
    _xController.dispose();
    _yController.dispose();
    _zController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _xController
      ..reset()
      ..repeat();

    _yController
      ..reset()
      ..repeat();

    _zController
      ..reset()
      ..repeat();

    return SizedBox(
      width: widthAndHeight * 1.15,
      height: widthAndHeight,
      child: AnimatedBuilder(
        animation: Listenable.merge([
          _xController,
          _yController,
          _zController,
        ]),
        builder: (context, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..rotateX(_xAnimation.value)
              ..rotateY(_yAnimation.value)
              ..rotateZ(_zAnimation.value),
            child: Stack(
              children: [
                // back
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..translate(Vector3(0, 0, -widthAndHeight)),
                  child: Container(
                    color: Colors.green[200],
                    width: widthAndHeight,
                    height: widthAndHeight,
                  ),
                ),
                // left side
                Transform(
                  alignment: Alignment.centerLeft,
                  transform: Matrix4.identity()..rotateY(pi / 2.0),
                  child: Container(
                    color: Colors.green[200],
                    width: widthAndHeight,
                    height: widthAndHeight,
                  ),
                ),
                // right side
                Transform(
                  alignment: Alignment.centerRight,
                  transform: Matrix4.identity()..rotateY(-pi / 2.0),
                  child: Container(
                    color: Colors.green[200],
                    width: widthAndHeight,
                    height: widthAndHeight,
                  ),
                ),
                // front
                Container(
                  color: Colors.green[500],
                  width: widthAndHeight,
                  height: widthAndHeight,
                  child: FittedBox(
                      child: Text(
                    widget.char,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  )),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
