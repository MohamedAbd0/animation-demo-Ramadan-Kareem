import 'package:flutter/material.dart';

class WordsCustomPaint extends CustomPainter {
  late double textFirstFraction, textSecondFraction;

  late Paint _paint;

  WordsCustomPaint({
    required this.textFirstFraction,
    required this.textSecondFraction,
  }) {
    _paint = Paint()
      ..color = Colors.amber
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 15;
  }

  @override
  void paint(Canvas canvas, Size size) {
    _drowText(
      text: "RAMADAN",
      canvas: canvas,
      charHight: 100,
      charWidth: 80,
      startPointY: 100,
      color: Colors.indigo,
    );

    _drowText(
      text: "KAREEM",
      canvas: canvas,
      charHight: 80,
      charWidth: 60,
      startPointY: 250,
      color: Colors.brown,
    );
  }

  _drowText({
    canvas,
    required double charHight,
    required double charWidth,
    required double startPointY,
    required String text,
    required Color color,
  }) {
    //double charHight = (100);
    //double charWidth = 80;
    double startPointX = 0;
    //double startPointY = 100;
    _paint.color = color;

    for (int i = 0; i < text.length; i++) {
      if (i > 0) {
        if (i > 0 &&
            !["K", "R", "E", "D"].contains(text[i]) &&
            ["K", "R", "E", "D"].contains(text[i - 1])) {
          startPointX += ((charWidth / 2) * 1.4) + 20;
        } else {
          startPointX += (charWidth * 1.25) + 20;
        }
      }

      //_paint.color = listColor[rng.nextInt(5)];

      if (text[i] == "M") {
        _drawLine(
          canvas: canvas,
          startPointX: startPointX,
          startPointY: startPointY,
          charHight: charHight,
        );
        canvas.drawLine(
          Offset(startPointX, startPointY),
          Offset(startPointX + (charWidth / 2),
              startPointY + ((charWidth * textSecondFraction) / 2)),
          _paint,
        );
        canvas.drawLine(
          Offset(startPointX + (charWidth / 2),
              startPointY + ((charWidth * textSecondFraction) / 2)),
          Offset(startPointX + charWidth, startPointY),
          _paint,
        );

        _drawLine(
            canvas: canvas,
            startPointX: startPointX + charWidth,
            startPointY: startPointY,
            charHight: charHight);
      } else if (text[i] == "N") {
        _drawLine(
          canvas: canvas,
          startPointX: startPointX,
          startPointY: startPointY,
          charHight: charHight,
        );

        canvas.drawLine(
          Offset(startPointX, startPointY),
          Offset(startPointX + charWidth,
              startPointY + (charHight * textSecondFraction)),
          _paint,
        );

        _drawLine(
            canvas: canvas,
            startPointX: startPointX + charWidth,
            startPointY: startPointY,
            charHight: charHight);
      } else if (text[i] == "A") {
        canvas.drawLine(
          Offset(startPointX + (charWidth / 2), startPointY),
          Offset(startPointX, (startPointY + (charHight * textFirstFraction))),
          _paint,
        );
        canvas.drawLine(
          Offset(startPointX + (charWidth / 2), startPointY),
          Offset(startPointX + charWidth,
              startPointY + (charHight * textFirstFraction)),
          _paint,
        );

        canvas.drawLine(
          Offset(startPointX + (charWidth / 3),
              startPointY + ((charHight * textSecondFraction) / 2)),
          Offset(startPointX + (charWidth * (2 / 3)),
              startPointY + ((charHight * textSecondFraction) / 2)),
          _paint,
        );
      } else if (text[i] == "E") {
        _drawLine(
            canvas: canvas,
            startPointX: startPointX,
            startPointY: startPointY,
            charHight: charHight);

        canvas.drawLine(
          Offset(startPointX, startPointY),
          Offset(startPointX + (charWidth / 2), startPointY),
          _paint,
        );

        canvas.drawLine(
          Offset(startPointX, startPointY + (charHight / 2)),
          Offset(startPointX + (charWidth / 2),
              startPointY + ((charHight * textFirstFraction) / 2)),
          _paint,
        );

        canvas.drawLine(
          Offset(startPointX, startPointY + charHight),
          Offset(startPointX + (charWidth / 2),
              startPointY + (charHight * textFirstFraction)),
          _paint,
        );
      } else if (text[i] == "K") {
        _drawLine(
            canvas: canvas,
            startPointX: startPointX,
            startPointY: startPointY,
            charHight: charHight);

        canvas.drawLine(
          Offset(startPointX, startPointY + (charHight / 2)),
          Offset(startPointX + (charWidth / 2), startPointY),
          _paint,
        );

        canvas.drawLine(
          Offset(startPointX, startPointY + (charHight / 2)),
          Offset(startPointX + (charWidth / 2),
              startPointY + (charHight * textFirstFraction)),
          _paint,
        );
      } else if (text[i] == "R") {
        _drawLine(
            canvas: canvas,
            startPointX: startPointX,
            startPointY: startPointY,
            charHight: charHight);

        Path path = Path();
        path.moveTo(startPointX, startPointY);
        path.quadraticBezierTo(
            startPointX + ((charWidth * textSecondFraction)),
            startPointY + ((charWidth * textSecondFraction) / 3),
            startPointX,
            startPointY + ((charWidth * textSecondFraction) / 2));

        path.quadraticBezierTo(
            startPointX + ((charWidth * textSecondFraction) / 2),
            startPointY + ((charWidth * textSecondFraction) / 2),
            startPointX + (charWidth * textSecondFraction) / 2,
            startPointY + (charHight));
        // canvas.drawPath(path, _paint);

        _paint.style = PaintingStyle.stroke; // set style to stroke

        canvas.drawPath(path, _paint);
      } else if (text[i] == "D") {
        _drawLine(
            canvas: canvas,
            startPointX: startPointX,
            startPointY: startPointY,
            charHight: charHight);

        Path path = Path();
        path.moveTo(startPointX, startPointY);
        path.quadraticBezierTo(
            startPointX + ((charWidth * textSecondFraction)),
            startPointY + ((charWidth * textSecondFraction) / 2),
            startPointX,
            startPointY + (charHight));

        // canvas.drawPath(path, _paint);

        _paint.style = PaintingStyle.stroke; // set style to stroke

        canvas.drawPath(path, _paint);
      }
    }
  }

  _drawLine({canvas, startPointX, startPointY, charHight}) {
    canvas.drawLine(
      Offset(startPointX, startPointY),
      Offset(startPointX, (startPointY + (charHight * textFirstFraction))),
      _paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
