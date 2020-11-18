import 'dart:ui';

import 'package:power_widget/serializable/SerializableStatelessWidget.dart';
import 'package:power_widget/widgets/stateless/PowerStateLessCardView.dart';

class NameCard extends PowerStatelessCardView {

  final Color cardColor;
  final Rect cardRect;
  final Size size;
  final List<SerializableStatelessWidget> widgets;

  NameCard(this.widgets, this.size, this.cardRect, this.cardColor);

  @override
  Color getBackgroundColor() {
    return cardColor;
  }

  @override
  Rect getRect() {
    return cardRect;
  }

  @override
  Size getSize() {
    return size;
  }

  @override
  List<SerializableStatelessWidget> getChildWidgets() {
    return widgets;
  }
}