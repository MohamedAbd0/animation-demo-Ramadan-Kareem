import 'dart:math';

import 'package:flutter/material.dart';

class StarPainter extends CustomPainter {
  final double radius;
  final Color color;
  final int numPoints;
  final double lineWidth;

  StarPainter({
    required this.radius,
    required this.color,
    this.numPoints = 5,
    this.lineWidth = 2,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth;

    Path path = Path();

    double centerX = size.width / 2;
    double centerY = size.height / 2;

    double deltaAngle = pi / numPoints;
    double angle = -pi / 2;
    double outerRadius = radius;
    double innerRadius = radius / 2;

    for (int i = 0; i < numPoints; i++) {
      double x = centerX + cos(angle) * outerRadius;
      double y = centerY + sin(angle) * outerRadius;
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }

      angle += deltaAngle;
      x = centerX + cos(angle) * innerRadius;
      y = centerY + sin(angle) * innerRadius;
      path.lineTo(x, y);

      angle += deltaAngle;
      outerRadius = radius;
      innerRadius = radius / 2;
    }

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(StarPainter oldDelegate) => false;
}
