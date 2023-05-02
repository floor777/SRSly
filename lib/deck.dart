import 'card.dart';

class Deck {
  String deckName = '';
  List<FlashCard> cardsArray = [];

  Deck(
      {required this.deckName, required this.cardsArray
      }
      );

  String get getDeckName {
    return deckName;
  }

  void setDeckName(String newName) {
    deckName = newName;
  }
}