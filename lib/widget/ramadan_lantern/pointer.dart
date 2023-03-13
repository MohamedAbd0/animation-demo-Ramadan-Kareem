import 'dart:math';
import 'package:flutter/material.dart';

class RamadanLanternPainter extends CustomPainter {
  final double width;
  final double height;
  final double strokeWidth;
  final Color color;

  RamadanLanternPainter({
    required this.width,
    required this.height,
    required this.strokeWidth,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double centerX = size.width / 2;
    double centerY = size.height / 2;

    // Draw the top of the lantern.
    Path topPath = Path()
      ..moveTo(centerX - width / 3, centerY - height / 2)
      ..lineTo(centerX + width / 3, centerY - height / 2)
      ..lineTo(centerX, centerY - height)
      ..close();
    canvas.drawPath(topPath, paint);

    paint.style = PaintingStyle.fill;

    // Draw the handle of the lantern.
    Rect handleRect = Rect.fromCenter(
      center: Offset(size.width / 2, size.width / 4),
      width: width / 6,
      height: height / 6,
    );

    Rect handleRect2 = Rect.fromCenter(
      center: Offset(size.width / 2, -size.width / 4),
      width: size.width / 4,
      height: size.width / 4,
    );
    paint.strokeWidth = 5;
    canvas.drawArc(handleRect2, pi, pi * 2, false, paint);

    canvas.drawArc(handleRect, pi, pi, false, paint);
    paint.style = PaintingStyle.stroke;

    // Draw the main body of the lantern.
    paint.style = PaintingStyle.fill;
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(centerX, centerY / 2),
        width: width,
        height: height / 6,
      ),
      paint,
    );
    paint.style = PaintingStyle.stroke;

    // Draw the top of the lantern.
    Path medPath1 = Path()
      ..moveTo(centerX - width / 3, centerY - height / 2)
      ..lineTo(centerX * 2 - width * 0.7 + strokeWidth, centerY + height / 2)
      ..close();
    canvas.drawPath(medPath1, paint);

    // Draw the top of the lantern.
    Path medPath2 = Path()
      ..moveTo(centerX + width / 3, centerY - height / 2)
      ..lineTo(centerX * 2 - width * 0.3 - strokeWidth, centerY + height / 2)
      ..close();
    canvas.drawPath(medPath2, paint);
    paint.style = PaintingStyle.fill;

    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(centerX, centerY * 1.6),
        width: width / 3,
        height: height / 8,
      ),
      paint,
    );
    paint.style = PaintingStyle.stroke;

    Path bottomPath1 = Path()
      ..moveTo(centerX * 2 - width * 0.1 - strokeWidth, centerY * 2)
      ..lineTo(centerX * 2 - width * 0.3 - strokeWidth, centerY + height / 2)
      ..close();
    canvas.drawPath(bottomPath1, paint);

    Path bottomPath2 = Path()
      ..moveTo(width * 0.1 + strokeWidth, centerY * 2)
      ..lineTo(centerX * 2 - width * 0.7 + strokeWidth, centerY + height / 2)
      ..close();
    canvas.drawPath(bottomPath2, paint);
    paint.style = PaintingStyle.fill;

    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(centerX, centerY * 2),
        width: width * 0.7,
        height: height / 10,
      ),
      paint,
    );

    /*
    Rect handleRect2 = Rect.fromCenter(
      center: Offset(size.width / 2, -size.width / 3),
      width: size.width / 4,
      height: size.width / 4,
    );
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5;
    canvas.drawArc(handleRect2, pi / 2, pi, false, paint);

    */
  }

  @override
  bool shouldRepaint(RamadanLanternPainter oldDelegate) => false;
}
