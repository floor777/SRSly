import 'package:flutter/material.dart';
import 'package:untitled/login_page.dart';
import 'package:untitled/main.dart';
import 'package:untitled/selected_deck_page.dart';
import 'deck.dart';
import 'package:untitled/card.dart';
import 'package:untitled/edit_decks_page.dart';
import 'package:firebase_database/firebase_database.dart';

class MyDeckPage extends StatefulWidget{
  const MyDeckPage({super.key, required this.title});
  final String title;


  @override
  State<MyDeckPage> createState() => _MyDeckPageState();
}


List<Deck> decks = [


];

final ref = FirebaseDatabase.instance.ref();


readDeckFromDatabase(String lovely) async {
  decks = [];
  List<Deck> tempdecks = [];
  print('lovely below');
  print(lovely);



  DataSnapshot snapshot  = await ref.child('users/$lovely').get();

  if (snapshot.exists) {
    Map<dynamic, dynamic> newDeck = Map<dynamic, dynamic>.from(snapshot.value as Map);
    newDeck.forEach((k,v) => {
      print('${k}: ${v}')
    });

    for(int i = 1; i <= newDeck.length; i++) {
      Deck duck = Deck(deckName: newDeck['deck' + i.toString()][0],
          cardsArray: []);
      print(i);


      for(int j = 0; j < newDeck['deck' + i.toString()][4].length; j++) {

        FlashCard card = FlashCard(frontItem: newDeck['deck' + i.toString()][4][j][0],
            backItem: newDeck['deck1'][4][j][1]);
        duck.cardsArray.add(card);


      }

      tempdecks.add(duck);

      decks = tempdecks;
    //
    //
    }



    return decks;
}
  else {
    print('No data available.');
  }
}




class _MyDeckPageState extends State<MyDeckPage> {
  Key key = UniqueKey();


  String testingmethods = '';
  final myController = TextEditingController();
  final renameController = TextEditingController();


  String truncateWithEllipsis(int cutoff, String myString) {
    // print('cutoff is: ' + cutoff.toString());
    int buffer = cutoff - myString.length;

    return (myString.length <= cutoff)
        ? myString + ' ' * (buffer + 6)
        : '${myString.substring(0, cutoff - 3)}...';
  }

  @override
  Widget build(BuildContext context) {


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
              FutureBuilder(

                  future: readDeckFromDatabase(widget.title),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: decks.length,
                        itemBuilder: (ctx, index) =>
                            ListTile(
                              leading:  Icon(Icons.square_rounded),
                              title: Text(truncateWithEllipsis(15, decks[index].deckName)),
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

                                                      // deleting the deck from the database
                                                      ref.child('users/' + widget.title + '/deck${index + 1}').remove();
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
                                                    onPressed: () async {
                                                      content: Text(renameController.text);
                                                      String bark = renameController.text;
                                                      setState(() {
//
                                                      ref.child('users/${widget.title}').update({
                                                        'deck${index + 1}/0': bark
                                                      });



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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      SelectedDeckPage(title: decks[index].deckName, decks: decks, selectedIndex: index)),
                                );
                                },
                            )
                    );
                  }),

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
                                    ref.child('users/' + widget.title).update({
                                      'deck' + ((decks.length + 1).toString()): [meow, 3, 3, 3, [["u1front3", "u1back3", 0], ["u1front3", "u1back3", 0]]],
                                    }


                                    );

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
