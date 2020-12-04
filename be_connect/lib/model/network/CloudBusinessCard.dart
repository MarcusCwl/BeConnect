import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';

class CloudBusinessCard {
  static const String KEY_USER_NAME = "userName";
  static const String KEY_CARD_ID = "cardId";

  String userName;
  String cardId;

  CloudBusinessCard(this.userName, this.cardId);

  CloudBusinessCard.fromSnapShot(DocumentSnapshot snapshot) {
    userName = snapshot['userName'];
    cardId = snapshot.id;
  }

  Map<String, dynamic> toSnapShot() {
    Map map = HashMap();
    map[KEY_USER_NAME] = userName;
    map[KEY_CARD_ID] = cardId;
  }
}
