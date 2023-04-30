import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'deck.dart';

class EditCardsPage extends StatefulWidget {
  final List<Deck> decks;
  final int selectedIndex;
  final String title;
  const EditCardsPage({super.key, required this.title, required this.decks, required this.selectedIndex});
//
  @override
  State<EditCardsPage> createState() => _EditCardsPageState();
}

class _EditCardsPageState extends State<EditCardsPage> {
  final myController = TextEditingController();
  final frontSideTextController = TextEditingController();
  final backSideTextController = TextEditingController();
  final ref = FirebaseDatabase.instance.ref();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
//a
        title: Text(widget.decks[widget.selectedIndex].deckName),
        ),
      body: Column(
        children: [
          Text(widget.decks[widget.selectedIndex].deckName,
          style: TextStyle(fontSize: 50),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: widget.decks[widget.selectedIndex].cardsArray.length,
              itemBuilder: (ctx, index) =>
                  ListTile(
                    leading:  Icon(Icons.square_rounded),
                    title: Text(widget.decks[widget.selectedIndex].cardsArray[index].frontItem),
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) {
                        if(value == "Delete Card") {
                          showDialog(
                            //
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: Center(child: Text("Are you sure you want to delete this card?")),
                                actions: <Widget> [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {

                                            setState(() {
                                              // if(widget.decks[widget.selectedIndex].cardsArray.length == 1) {
                                              //   showDialog(context: context, builder: (ctx) => AlertDialog(
                                              //     title: Center(child: Text("Deleting the last card of the deck will delete the deck. "
                                              //         "Are you sure you want to do this?")),
                                              //   )
                                              //   );
                                              // }

                                              //
                                              //TRY TO FIX TO WHERE CARD AT INDEX GETS FINAL CARD INDEX
                                              //aaxxx
                                              // print(widget.decks[widget.selectedIndex - 1].cardsArray.length);

                                              // get information of last item


                                              ref.child('users/' + widget.title +
                                                  '/deck' + (widget.selectedIndex + 1).toString() + '/1/' + (widget.decks[widget.selectedIndex].cardsArray.length - 1).toString()).get()
                                                  .then((value) =>
                                                  ref.child('users/' + widget.title).update({

                                                    '/deck' + (widget.selectedIndex + 1).toString() + '/1/' + (index).toString()
                                                        : value.value, // replace value of selected item with last item's value

                                            //
                                                  }),



                                              );
                                                ref.child('users/' + widget.title + '/deck' + (widget.selectedIndex + 1).toString() + '/1/').update({

                                                  (widget.decks[widget.selectedIndex].cardsArray.length - 1).toString(): null
                                                });


                                              // change frontitem of selected card to last onez
                                              // widget.decks[widget.selectedIndex].cardsArray[index].frontItem = widget.decks[widget.selectedIndex].cardsArray[widget.decks[widget.selectedIndex].cardsArray.length - 1].frontItem;
                                              // set last item to null(delete last item from database)as
                                              //
                                              print('lala below');
                                              print(widget.decks[widget.selectedIndex].toString());
                                              print('value to remove from database: ' + (widget.decks[widget.selectedIndex].cardsArray.length - 1).toString());
                                              // ref.child('users/' + widget.title + '/deck' + (widget.selectedIndex + 1).toString() + '/1/').update({
                                              //
                                              //   (widget.decks[widget.selectedIndex].cardsArray.length - 1).toString(): null
                                              // });

                                              // remove last item from deck
                                              print('last item to fremove from deck index: ' + (widget.decks[widget.selectedIndex].cardsArray.length - 1).toString());
                                              widget.decks[widget.selectedIndex].cardsArray.removeAt(widget.decks[widget.selectedIndex].cardsArray.length - 1);


//
                                            });
                                            Navigator.pop(context);

                                            //aa
                                          },
                                          child: Text("Delete")),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Cancel")
                                      ),
                                    ],
                                  )
                                ],

                                //
                              )
                          );
                        }
                        else if(value == "Rename Card") {
                          print('rename');
                          showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: Center(child: Text("Rename this card?")),
                                actions: <Widget> [
                                  Center(
                                    child: TextField(
                                      
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: "Front",
                                      ),
                                      controller: frontSideTextController,
                                    ),
                                    //
                                  ),
                                  Center(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: "Back",
                                        ),
                                        controller: backSideTextController,
                                      ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () async {
                                            content: Text(frontSideTextController.text);
                                            String frontSide = frontSideTextController.text;
                                            String backSide = backSideTextController.text;
                                            setState(() {

                                              ref.child('users/' + widget.title).update({
                                                'deck' + (widget.selectedIndex + 1).toString() + '/1/' + index.toString() + '/0': frontSide,
                                                'deck' + (widget.selectedIndex + 1).toString() + '/1/' + index.toString() + '/1': backSide
                                              });

                                              widget.decks[widget.selectedIndex].cardsArray[index].frontItem = frontSide;
                                              widget.decks[widget.selectedIndex].cardsArray[index].backItem = backSide;
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Text("Rename")),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Cancel")
                                      ),
                                    ],
                                  )
                                ],
                              )
                          );
                          frontSideTextController.text = "";
                          backSideTextController.text = "";

                        }
                      },
                      onCanceled: () {
                        print("canceled ");
                      },
                      icon: Icon(Icons.settings),
                      itemBuilder: (_) {
                        return const [
                          PopupMenuItem<String>(child: Text("Delete Card"), value: "Delete Card",),
                          PopupMenuItem<String>(child: Text("Rename Card"), value: "Rename Card",),
                        ];
                      },
                    ),
                    onTap: () {
                      // print('this was the index: ' + index.toString());
                      // print('widget.title: ' + widget.title);
                      //
                      // print('decks[index].deckname: ' +  widget.decks[index].deckName);
                      //
                      // print('decks: ' + widget.decks.toString());
                      //
                      // print('index: ' + index.toString());
                      //asa
                      try {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) =>
                        //       SelectedDeckPage(userName:  widget.title,  decks: decks.isNotEmpty ? decks : [], selectedIndex: index)),
                        // );
                        // //saaasdadddaAsaaaaazzz1zsza

                      }
                      catch(e) {
                        print('error found');
                        print(e);

                      }


                    },
                  )
          )
        ],

      )
    );



  }
}
