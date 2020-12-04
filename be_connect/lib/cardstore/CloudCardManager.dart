import 'package:be_connect/model/network/CloudBusinessCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CloudCardManager {
  static const String CLOUD_CARD_COLLECTION = "cards";

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addCard(CloudBusinessCard card) {
    return firestore
        .collection(CLOUD_CARD_COLLECTION)
        .add(card.toSnapShot())
        .then((value) => print("Card added"))
        .catchError((error) => print("Fail to add card :$error"));
  }

  Future<void> updateCards(List<CloudBusinessCard> cards) {
    WriteBatch batch = firestore.batch();
    cards.forEach((card) {
      batch.set(firestore.collection(CLOUD_CARD_COLLECTION).doc(card.cardId), card.toSnapShot());
    });
    return batch.commit();
  }
}
