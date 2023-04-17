import 'package:flutter/material.dart';
import 'package:untitled/login_page.dart';
import 'package:untitled/main.dart';
import 'package:untitled/selected_deck_page.dart';
import 'deck.dart';
import 'package:untitled/card.dart';
import 'package:untitled/edit_decks_page.dart';



class MyDeckPage extends StatefulWidget {
  const MyDeckPage({super.key, required this.title});
  final String title;


  @override
  State<MyDeckPage> createState() => _MyDeckPageState();
}

List<Deck> decks = [
  Deck(deckName: 'law school vocab', newCount: 2, learnCount: 0, dueCount: 6, cardsArray: []),
  Deck(deckName: 'medical school vocab', newCount: 0, learnCount: 0, dueCount: 0, cardsArray: []),
  Deck(deckName: 'swift', newCount: 0, learnCount: 0, dueCount: 0, cardsArray: []),
  Deck(deckName: 'law school vocab', newCount: 2, learnCount: 0, dueCount: 6, cardsArray: []),
  Deck(deckName: 'medical school vocab', newCount: 0, learnCount: 0, dueCount: 0, cardsArray: []),
  Deck(deckName: 'swift', newCount: 0, learnCount: 0, dueCount: 0, cardsArray: []),
  Deck(deckName: 'law school vocab', newCount: 2, learnCount: 0, dueCount: 6, cardsArray: []),
  Deck(deckName: 'medical school vocab', newCount: 0, learnCount: 0, dueCount: 0, cardsArray: []),
  Deck(deckName: 'swift', newCount: 0, learnCount: 0, dueCount: 0, cardsArray: []),
  Deck(deckName: 'law school vocab', newCount: 2, learnCount: 0, dueCount: 6, cardsArray: []),
  Deck(deckName: 'medical school vocab', newCount: 0, learnCount: 0, dueCount: 0, cardsArray: []),
  Deck(deckName: 'swift', newCount: 0, learnCount: 0, dueCount: 0, cardsArray: []),
  Deck(deckName: 'law school vocab', newCount: 2, learnCount: 0, dueCount: 6, cardsArray: []),
  Deck(deckName: 'medical school vocab', newCount: 0, learnCount: 0, dueCount: 0, cardsArray: []),
  Deck(deckName: 'end', newCount: 0, learnCount: 0, dueCount: 0, cardsArray: []),

];

class _MyDeckPageState extends State<MyDeckPage> {
  String testingmethods = '';
  final myController = TextEditingController();
  final renameController = TextEditingController();



  String truncateWithEllipsis(int cutoff, String myString) {
    // print('cutoff is: ' + cutoff.toString());
    int buffer = cutoff - myString.length;
    print('buffer is: ' + buffer.toString());
    return (myString.length <= cutoff)
        ? myString + ' ' * (buffer + 6)
        : '${myString.substring(0, cutoff - 3)}...';
  }


  @override
  Widget build(BuildContext context) {
    Deck deck = Deck(deckName: 'angry', newCount: 0,
        learnCount: 0, dueCount: 0, cardsArray: []);
    // deck.setDeckName('revenge');
    // String test = deck.getDeckName;



    FlashCard card = FlashCard(frontItem: 'frontItem', backItem: 'backItem', intervalValue: 1);



    // print(decks[0].cardsArray.length);
    // decks[0].cardsArray.add(card);
    // print(decks[0].cardsArray.length);
    // print(decks[0].cardsArray[0].backItem);
    // print(decks[0].getDueCount);
    // decks[0].setDueCount(1);
    // // print(decks[0].getDueCount);


    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),


    body: Column(

      children: [
        Expanded(
          flex: 15,
            child: Image.asset('assets/images/SRSlyLogo.png', width: 150, height: 150)
        ),
        Expanded(
          flex: 70,

          child: Column(
            children: [

              Expanded(
                child: ListView.builder(

                  shrinkWrap: true,
                  itemCount: decks.length,
                  itemBuilder: (ctx, index) =>
                      ListTile(
                        leading:  Icon(Icons.square_rounded),
                        title: Text(truncateWithEllipsis(15, decks[index].deckName)  + "  "
                            "New: " + decks[index].newCount.toString() +
                            "    Due: "
                            + decks[index].dueCount.toString()),
                        trailing: PopupMenuButton<String>(
                          onSelected: (value) {
                            if(value == "Delete Deck") {
                              showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: Center(child: Text("Are you sure you want to delete this deck?")),

                                    actions: <Widget> [

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  decks.removeAt(index);
                                                });
                                                Navigator.pop(context);
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

                                  )
                              );
                            }
                            else if(value == "Rename Deck") {
                              print('rename');
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: Center(child: Text("Rename this deck?")),
                                  actions: <Widget> [
                                    Center(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: "New deck name",
                                        ),
                                        controller: renameController,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,

                                      children: [
                                        ElevatedButton(
                                            onPressed: () {
                                              content: Text(renameController.text);
                                              String bark = renameController.text;
                                              setState(() {
                                                decks[index].deckName = bark;

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
                              renameController.text = "";




                              setState(() {

                                // decks[index].deckName = "renamed";

                              });
                            }
                            
                          },
                          onCanceled: () {
                            print("canceled ");
                          },
                          icon: Icon(Icons.settings),

                          itemBuilder: (_) {
                            return const [
                              PopupMenuItem<String>(child: Text("Delete Deck"), value: "Delete Deck",),
                              PopupMenuItem<String>(child: Text("Rename Deck"), value: "Rename Deck",),
                            ];
                          },

                        ),

                        onTap: () {

                          print('this was the index: ' + index.toString());
                          print(decks[index].deckName);
                          // setState(() {
                          //   decks.removeAt(_selectedIndex);
                          //
                          // });
                          // decks.removeAt(_selectedIndex);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                                SelectedDeckPage(title: decks[index].deckName, decks: decks, selectedIndex: index)),
                          );
                        },

                      )


                ),
              ),
            ],
          ),
        ),


      Expanded(

        flex: 15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // FittedBox(
            //   fit: BoxFit.fitWidth,
            //   // child: Text(
            //   //   "Studied x cards in x seconds today (Xs/card)",
            //   //   style: TextStyle (
            //   //       fontWeight: FontWeight.bold
            //   //   ),
            //   // ),
            // ),
            
            ElevatedButton(
                onPressed: () {
                   showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(

                      title: Center(child: Text("Create a deck?")),

                      actions: <Widget>[

                        TextField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Deck Name',
                          ),
                          controller: myController,

                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [

                            ElevatedButton(


                                onPressed: () {
                                  content: Text(myController.text);
                                  String meow = myController.text;
                                  setState(() {
                                    decks.add(new Deck(deckName: meow, newCount: 0,
                                        learnCount: 0, dueCount: 0, cardsArray: []));
                                    myController.text = '';


                                  });
                                  Navigator.pop(context);


                            },
                                child: Text("Create")
                            ),
                            ElevatedButton(

                                onPressed: () {
                                  Navigator.pop(context);


                                },
                                child: Text("Cancel")
                            ),
                          ],
                        ),



                      ],
                    ),
                  );
                   myController.text = "";
                },
                child: Text('Create Deck')

            )

          ],
        ),
      )
      ],
    ),



    );

  }

}
