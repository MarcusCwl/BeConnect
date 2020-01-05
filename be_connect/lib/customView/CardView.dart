import 'package:flutter/material.dart';
import 'dart:math';

class CardView extends StatelessWidget {
  Size size;

  @override
  Widget build(BuildContext context) {
    if (size == null) {
      double height = MediaQuery.of(context).size.height;
      double width = MediaQuery.of(context).size.width;
      size = Size(width, height);
    }
    return Center(
      child: CustomPaint(
        //指定画布大小
        size: size,
        painter: CardViewPainter(),
      ),
    );
  }
}

class CardViewPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double cardWidth = size.width * 0.7;
    double cardHeight = cardWidth * 0.25 * 3;
    double startX = (size.width - cardWidth) * 0.5;
    double startY = 0;

    Size drawingSize = Size(cardWidth, cardHeight);
    Rect rect = Offset(startX, startY) & drawingSize;

    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = Color(0x77cdb175);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
