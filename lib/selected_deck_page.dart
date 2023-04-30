import 'package:flutter/material.dart';
import 'package:untitled/add_card_page.dart';
import 'package:untitled/deck.dart';
import 'package:untitled/edit_card_page.dart';
import 'package:untitled/study_card_page.dart';
import 'deck_page.dart';
//a
class SelectedDeckPage extends StatefulWidget {
  final List<Deck> decks;
  final int selectedIndex;
  final String userName;
  const SelectedDeckPage({super.key,
    required this.decks, required this.selectedIndex, required this.userName}
      );
  @override
  State<SelectedDeckPage> createState() => _SelectedDeckPageState();
}

class _SelectedDeckPageState extends State<SelectedDeckPage> {
  List<Deck> storedDecks = decks;

//za
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(

            widget.decks[widget.selectedIndex].deckName
        ),
      ),
      body:
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,


              children: [
                 Text(

                   widget.decks[widget.selectedIndex].deckName
                   ,
                  style: TextStyle (
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Column(

                  children: [

                  ],
                ),
                ElevatedButton(onPressed: () {
                  // print('widget.decks[widget.selectedIndex].deckName: ' + widget.decks[widget.selectedIndex].deckName);

                  //aa
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StudyCardPage(title: widget.decks[widget.selectedIndex].deckName, deck: widget.decks[widget.selectedIndex]),
                  ));

                },
                    child: Text("Study Now", style: TextStyle (
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ), )
                ),


                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('add card clicked');
//
                        print('widget.userName: ' + widget.userName);
                        print('widget.username in selected deck page: ' + widget.userName );
                        print('widget.decks[widget.selectedIndex: ' + widget.decks[widget.selectedIndex].toString());
                        print('widget.selectedIndex: ' + widget.selectedIndex.toString());


                        Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    AddCardPage(
                                        userName: widget.userName,
                                        deckTitle: widget.decks[widget.selectedIndex].deckName,
                                        currentDeck: widget.decks[widget.selectedIndex],
                                        index: widget.selectedIndex,
                              )
                                )
                        );
                      },
                      child: const Text('Add Card',
                        style: TextStyle (
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      // onTap: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => const SelectedDeckPage(title: "Selected Deck Name")),
                      //   );
                      //   },
                    ),

                    //aa
                    GestureDetector(
                      onTap: () {
                        print('edit card clicked');

                        Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  EditCardsPage(title: widget.userName, decks: widget.decks, selectedIndex: widget.selectedIndex),
                              ));
                      },
                      child: const Text('Edit Card',
                        style: TextStyle (
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      // onTap: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => const SelectedDeckPage(title: "Selected Deck Name")),
                      //   );
                      //   },
                    ),
                  ],
                ),
              ],
            ),
          )
    );
  }
}
