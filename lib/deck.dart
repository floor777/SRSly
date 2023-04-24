

import 'card.dart';

class Deck {
  String deckName = '';
  List<FlashCard> cardsArray = [];
  // int intervalValuOe = 1;


  Deck(
      {required this.deckName, required this.cardsArray
      }
      );
  // Deck() {
  //   deckName = 'meow';
  //   newCount = 0;
  //   learnCount = 0;
  //   dueCount = 0;
  //
  // }
  String get getDeckName {
    return deckName;
  }

  void setDeckName(String newName) {
    deckName = newName;
  }



}