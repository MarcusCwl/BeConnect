import 'package:be_connect/customView/CardView.dart';
import 'package:be_connect/customView/NameCard.dart';
import 'package:be_connect/customView/factory/CardViewFactory.dart';
import 'package:be_connect/model/BusinessCard.dart';
import 'package:flutter/material.dart';

class CardListView extends StatelessWidget {
  List<BusinessCard> cardList;

  CardListView(this.cardList);

  @override
  Widget build(BuildContext context) {
    Rect cardRect = CardViewFactory.getCardRect(context);
    Size cardSize = CardViewFactory.getCardSize(context);

    return ListView.builder(
        itemCount: cardList.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: cardSize.height * 1.1,
            color: Colors.white,
            child: CardViewFactory.getNameCard(cardRect, cardSize),
          );
        });
  }
}
