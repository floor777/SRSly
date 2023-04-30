import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:untitled/deck.dart';

import 'card_flipped_page.dart';
class StudyCardPage extends StatefulWidget {
  const StudyCardPage({super.key, required this.title, required this.deck});
  final Deck deck;
  final String title;

  @override
  State<StudyCardPage> createState() => _StudyCardPageState();
}


//
class _StudyCardPageState extends State<StudyCardPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    print(widget.deck.deckName);

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              height: MediaQuery.of(context).size.width * 1.25,
              width: MediaQuery.of(context).size.height * 0.50,
              child: FlipCard(
                fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
                direction: FlipDirection.HORIZONTAL, // default
                side: CardSide.FRONT, // The side to initially display.
          front: Container(
            alignment: Alignment.center,
              child: Text(widget.deck.cardsArray[index].frontItem,
              style: TextStyle(fontSize: 40),),
          ),
          back: Container(
            alignment: Alignment.center,
              child: Text(widget.deck.cardsArray[index].backItem,
                style: TextStyle(fontSize: 40),),
          ),
        ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: () {
                  print('in previous index: ' + index.toString());
                  if(index - 1 >= 0) {
                    setState(() {
                      index--;
                      print(index);

                    });
                  }


                }, child: Text('previous')),
                ElevatedButton(onPressed: () {
                  print('in next: ' + index.toString());
                  if(index + 1 < widget.deck.cardsArray.length) {

                    setState(() {
                      index++;
                      print(index);

                    });
                  }

                }, child: Text('next')),



                
              ],
            )
            //AA


            
          ],
        ),
      ),


    );
  }
}
