import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:untitled/deck.dart';
import 'package:untitled/card.dart';
import 'package:untitled/deck_page.dart';

class AddCardPage extends StatefulWidget {
  final String deckTitle;
  final Deck currentDeck;
  final int index;
  final String userName;
  const AddCardPage({super.key, required this.deckTitle, required this.currentDeck, required this.index, required this.userName});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  final frontTextController = TextEditingController();
  final backTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.deckTitle),

      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
                widget.deckTitle,
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 40
              ),
            ),
            Column(
              children: [
                Text(
                  'Front',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: TextField(

                    decoration: InputDecoration(
                      border: OutlineInputBorder(),

                      labelText: "Front term",
                    ),
                    controller: frontTextController,
                  ),
                ),
              ],
            ),

            Column(
              children: [
                Text(
                  'Back',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: TextField(

                    decoration: InputDecoration(
                      border: OutlineInputBorder(),

                      labelText: "Back Term",
                    ),
                    controller: backTextController,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        List<Object?> cards = decks[widget.index].cardsArray;

                        ref.child('users/' + widget.userName + '/').update({
                          'deck' + (widget.index + 1).toString() +
                              '/1/' + decks[widget.index].cardsArray.length.toString():
                          [frontTextController.text, backTextController.text]
                        });
                        decks[widget.index].cardsArray.add(FlashCard(frontItem: frontTextController.text,
                            backItem: backTextController.text));



                      });
                    },
                    child: Text('Add Card')
                ),
                ElevatedButton(
                    onPressed: () {

                      Navigator.pop(context);
                    },
                    child: Text('Cancel')
                )
              ],
            )
          ],
        ),

      ),

    );
  }
}
