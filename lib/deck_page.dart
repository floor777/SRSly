import 'package:flutter/material.dart';
import 'package:untitled/login_page.dart';
import 'package:untitled/main.dart';
import 'package:untitled/selected_deck_page.dart';
import 'deck.dart';


class MyDeckPage extends StatefulWidget {
  const MyDeckPage({super.key, required this.title});



  final String title;

  @override
  State<MyDeckPage> createState() => _MyDeckPageState();
}

class _MyDeckPageState extends State<MyDeckPage> {
  int _counter = 0;


  void _incrementCounter() {
    setState(() {

      _counter++;
      print("The counter has been increased to " + _counter.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    // Deck deck = Deck(deckName: 'love', newCount: 0,
    //     learnCount: 0, dueCount: 0);
    // deck.setDeckName('revenge');
    // String test = deck.getDeckName;
    int _selectedIndex;

    List<Deck> decks = [
      Deck(deckName: 'love', newCount: 0, learnCount: 0, dueCount: 0,
          isSelected: true),
      Deck(deckName: 'hate', newCount: 0, learnCount: 0, dueCount: 0,
          isSelected: false),
      Deck(deckName: 'swift', newCount: 0, learnCount: 0, dueCount: 0,
          isSelected: false),
      Deck(deckName: 'kanji', newCount: 0, learnCount: 0, dueCount: 0,
          isSelected: false),
      Deck(deckName: 'kanji', newCount: 0, learnCount: 0, dueCount: 0,
          isSelected: false),
      Deck(deckName: 'kanji', newCount: 0, learnCount: 0, dueCount: 0,
          isSelected: false),
      Deck(deckName: 'kanji', newCount: 0, learnCount: 0, dueCount: 0,
          isSelected: false),
      Deck(deckName: 'kanji', newCount: 0, learnCount: 0, dueCount: 0,
          isSelected: false),
      Deck(deckName: 'meow', newCount: 0, learnCount: 0, dueCount: 0,
          isSelected: false),
      Deck(deckName: 'meow', newCount: 0, learnCount: 0, dueCount: 0,
          isSelected: false),
      Deck(deckName: 'test', newCount: 0, learnCount: 0, dueCount: 0,
          isSelected: false),
      Deck(deckName: 'kanji', newCount: 0, learnCount: 0, dueCount: 0,
          isSelected: false),
      Deck(deckName: 'meow', newCount: 0, learnCount: 0, dueCount: 0,
          isSelected: false),
      Deck(deckName: 'meow', newCount: 0, learnCount: 0, dueCount: 0,
          isSelected: false),
      Deck(deckName: 'test', newCount: 0, learnCount: 0, dueCount: 0,
          isSelected: false),
      

    ];
    // print(decks[0].getDueCount);
    // decks[0].setDueCount(1);
    // print(decks[0].getDueCount);

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),


    body: Column(

      children: [
        Image.asset('assets/images/SRSlyLogo.png', width: 150, height: 150),
        Container(
          height: 500,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: decks.length,
            itemBuilder: (ctx, index) =>
                ListTile(
                  onTap: () {
                    _selectedIndex = index;
                    print('this was the index: ' + _selectedIndex.toString());
                    print(decks[_selectedIndex].deckName);
                    // setState(() {
                    //   decks.removeAt(_selectedIndex);
                    //
                    // });
                    // decks.removeAt(_selectedIndex);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          SelectedDeckPage(title: decks[_selectedIndex].deckName, decks: decks, selectedIndex: _selectedIndex)),
                    );
                  },
                  leading: Icon(Icons.rectangle),
                  title: Text(decks[index].deckName),
                  trailing: Text("New " + decks[index].newCount.toString() +
                  "    Learn " + decks[index].learnCount.toString() + "    Due "
                  + decks[index].dueCount.toString())

                )


          ),
        ),

      Text(

        "Studied x cards in x seconds today (Xs/card)",
        style: TextStyle (
            fontSize: 15,
            fontWeight: FontWeight.bold
        ),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // <-- Radius
             ),
        ),
        onPressed: () {

        },
        child: const Text("Edit Decks",
          style: TextStyle (
              fontSize: 25,
              fontWeight: FontWeight.bold
          ),
        ),
      )
      ],
    ),



    );
  }
}
