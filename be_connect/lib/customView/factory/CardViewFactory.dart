import 'dart:ui';

import 'package:be_connect/customView/NameCard.dart';
import 'package:flutter/material.dart';
import 'package:power_widget/serializable/SerializableStatelessWidget.dart';

class CardViewFactory {
  static Size getCardSize(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double cardWidth = width * 0.7;
    double cardHeight = cardWidth * 0.25 * 3;
    return Size(cardWidth, cardHeight);
  }

  static Rect getCardRect(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double cardWidth = width * 0.7;
    double cardHeight = cardWidth * 0.25 * 3;
    double startX = (width - cardWidth) * 0.5;
    double startY = 0;
    return Rect.fromLTRB(startX, startY, startX + cardWidth, startY + cardHeight);
  }

  static NameCard getNameCard(Rect rect, Size size) {
    Color color = Colors.indigo;
    List<SerializableStatelessWidget> list = [];
    return NameCard(list, size, rect, color);
  }
}
