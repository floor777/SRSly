

import 'card.dart';

class Deck {
  String deckName = '';
  int newCount = 0;
  int learnCount = 0;
  int dueCount = 0;
  List<FlashCard> cardsArray = [];
  // int intervalValue = 1;


  Deck(
      {required this.deckName, required this.newCount,
    required this.learnCount, required this.dueCount, required this.cardsArray
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

  int get getNewCount {
    return this.newCount;
  }

  void setNewCount(int newCountValue) {
    this.newCount = newCountValue;
  }

  int get getLearnCount {
    return this.learnCount;
  }

  void setLearnCount(int newLearnCount) {
    this.learnCount = newLearnCount;
  }

  int get getDueCount {
    return this.dueCount;
  }

  void setDueCount(int newDueCount) {
    this.dueCount = newDueCount;
  }



}