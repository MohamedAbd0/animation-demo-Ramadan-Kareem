import 'dart:math';

import 'package:flutter/material.dart';

class MosquePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(0, 0, size.width, size.height);
    const Gradient gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF7AC7F4),
        Color(0xFF4292B8),
      ],
    );
    final Paint paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;
    final Path path = Path()
      ..moveTo(size.width * 0.1, size.height * 0.9)
      ..cubicTo(size.width * 0.2, size.height * 0.8, size.width * 0.35,
          size.height * 0.95, size.width * 0.5, size.height * 0.75)
      ..cubicTo(size.width * 0.6, size.height * 0.65, size.width * 0.7,
          size.height * 0.65, size.width * 0.9, size.height * 0.5)
      ..cubicTo(size.width * 0.7, size.height * 0.35, size.width * 0.6,
          size.height * 0.35, size.width * 0.5, size.height * 0.25)
      ..cubicTo(size.width * 0.35, size.height * 0.05, size.width * 0.2,
          size.height * 0.2, size.width * 0.1, size.height * 0.1)
      ..lineTo(size.width * 0.1, size.height * 0.9)
      ..close();
    canvas.drawPath(path, paint);
    final Path circlePath = Path()
      ..addOval(Rect.fromCircle(
          center: Offset(size.width * 0.5, size.height * 0.5),
          radius: size.width * 0.25));
    canvas.drawPath(circlePath, paint);

    // Draw the handle of the lantern.
    Rect handleRect = Rect.fromCenter(
      center: Offset(size.width, size.width / 2 + 5),
      width: size.width / 8,
      height: size.width / 8,
    );
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5;
    canvas.drawArc(handleRect, pi, pi, false, paint);
  }

  @override
  bool shouldRepaint(MosquePainter oldDelegate) => false;
}

class MosqueWidget extends StatelessWidget {
  final double size;

  const MosqueWidget({super.key, this.size = 100.0});

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..rotateZ(-pi / 2),
      child: CustomPaint(
        size: Size(size, size),
        painter: MosquePainter(),
      ),
    );
  }
}
