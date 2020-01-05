import 'package:be_connect/customView/CardView.dart';
import 'package:be_connect/model/BusinessCard.dart';
import 'package:flutter/material.dart';

class CardListView extends StatelessWidget {
  List<BusinessCard> cardList;

  CardListView(this.cardList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cardList.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.4,
            color: Colors.white,
            child: CardView(),
          );
        });
  }
}
