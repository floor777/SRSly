import 'package:flutter/material.dart';
import 'package:untitled/add_card_page.dart';
import 'package:untitled/deck.dart';
import 'package:untitled/study_card_page.dart';
import 'deck_page.dart';

class SelectedDeckPage extends StatefulWidget {
  final String title;
  final List<Deck> decks;
  final int selectedIndex;
  final String userName;
  const SelectedDeckPage({super.key, required this.title, required this.decks, required this.selectedIndex, required this.userName});
  @override
  State<SelectedDeckPage> createState() => _SelectedDeckPageState();
}

class _SelectedDeckPageState extends State<SelectedDeckPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.decks[widget.selectedIndex].deckName),
      ),
      body:
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                 Text(widget.decks[widget.selectedIndex].deckName,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StudyCardPage(title: "Selected Deck Name x")),
                  );

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


                        Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    AddCardPage(userName: widget.userName, deckTitle: widget.title,
                                    currentDeck: widget.decks[widget.selectedIndex],
                                        index: widget.selectedIndex))
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
                    GestureDetector(
                      onTap: () {
                        print('delete card clicked');
                      },
                      child: const Text('Delete Card',
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
                    GestureDetector(
                      onTap: () {
                        print('edit card clicked');
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
