import 'package:flutter/material.dart';

import 'pointer.dart';

class WordWidget extends StatefulWidget {
  final String word;
  const WordWidget({super.key, required this.word});

  @override
  State<WordWidget> createState() => _WordWidgetState();
}

class _WordWidgetState extends State<WordWidget> with TickerProviderStateMixin {
  double _lineOneFraction = 0;
  double _lineTwoFraction = 0.0;

  late Animation<double> lineOneAnimation, lineTwoAnimation;

  late AnimationController controller;
  late AnimationController controller2;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    lineOneAnimation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          _lineOneFraction = lineOneAnimation.value;
        });
      });

    lineTwoAnimation = Tween(begin: 0.0, end: 1.0).animate(controller2)
      ..addListener(() {
        setState(() {
          _lineTwoFraction = lineTwoAnimation.value;
        });
      });

    controller.forward();
    controller2.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.reset();
    controller.stop();
    controller2.reset();
    controller2.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: 20,
            width: MediaQuery.of(context).size.width,
            child: Text(
              "$_lineTwoFraction",
              style: const TextStyle(color: Colors.transparent),
            )),
        CustomPaint(
          painter: WordsCustomPaint(
            textFirstFraction: _lineOneFraction,
            textSecondFraction: _lineTwoFraction,
          ),
        ),
      ],
    );
  }
}
