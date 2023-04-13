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

class _MyDeckPageState extends State<MyDeckPage> {
  String testingmethods = '';

  List<Deck> decks = [
    Deck(deckName: 'love', newCount: 0, learnCount: 0, dueCount: 0,
      isSelected: true, ),
    Deck(deckName: 'hate', newCount: 0, learnCount: 0, dueCount: 0,
        isSelected: false),
    Deck(deckName: 'swift', newCount: 0, learnCount: 0, dueCount: 0,
        isSelected: false),
    Deck(deckName: 'kanji', newCount: 0, learnCount: 0, dueCount: 0,
        isSelected: false),
    Deck(deckName: 'hate', newCount: 0, learnCount: 0, dueCount: 0,
        isSelected: false),
    Deck(deckName: 'swift', newCount: 0, learnCount: 0, dueCount: 0,
        isSelected: false),
    Deck(deckName: 'kanji', newCount: 0, learnCount: 0, dueCount: 0,
        isSelected: false),
    Deck(deckName: 'hate', newCount: 0, learnCount: 0, dueCount: 0,
        isSelected: false),
    Deck(deckName: 'swift', newCount: 0, learnCount: 0, dueCount: 0,
        isSelected: false),
    Deck(deckName: 'kanji', newCount: 0, learnCount: 0, dueCount: 0,
        isSelected: false),
    Deck(deckName: 'hate', newCount: 0, learnCount: 0, dueCount: 0,
        isSelected: false),
    Deck(deckName: 'swift', newCount: 0, learnCount: 0, dueCount: 0,
        isSelected: false),
    Deck(deckName: 'kanji', newCount: 0, learnCount: 0, dueCount: 0,
        isSelected: false),
    Deck(deckName: 'hate', newCount: 0, learnCount: 0, dueCount: 0,
        isSelected: false),
    Deck(deckName: 'swift', newCount: 0, learnCount: 0, dueCount: 0,
        isSelected: false),
    Deck(deckName: 'end', newCount: 0, learnCount: 0, dueCount: 0,
        isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    Deck deck = Deck(deckName: 'angry', newCount: 0,
        learnCount: 0, dueCount: 0, isSelected: true);
    // deck.setDeckName('revenge');
    // String test = deck.getDeckName;
    int _selectedIndex;


    FlashCard card = FlashCard(frontItem: 'frontItem', backItem: 'backItem', intervalValue: 1);



    print(decks[0].cardsArray.length);
    decks[0].cardsArray.add(card);
    print(decks[0].cardsArray.length);
    print(decks[0].cardsArray[0].backItem);
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
            ],
          ),
        ),


      Expanded(

        flex: 15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.fitWidth,
              // child: Text(
              //   "Studied x cards in x seconds today (Xs/card)",
              //   style: TextStyle (
              //       fontWeight: FontWeight.bold
              //   ),
              // ),
            ),

            PopupMenuButton<String>(
              initialValue: 'hello',
              onCanceled: () {
                testingmethods = 'canceled';
                print(testingmethods);
              },

              onSelected: (value) {
                if(value == 'add') {
                  print('add deck pressed');

                }
                else if(value == 'delete') {
                  print('delete deck pressed');
                }
                else if(value == 'rename') {
                  print('rename deck pressed');
                }




              },

              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),

                ),
              ),


              itemBuilder: (_) {
                return const [
                  PopupMenuItem<String>(child: Text("Add Deck"), value: "add",),
                  PopupMenuItem<String>(child: Text("Delete Deck"), value: "delete",),
                  PopupMenuItem<String>(child: Text("Rename Deck"), value: "rename",),
                  PopupMenuItem<String>(child: Text("Cancel")),
                ];
              },
              child: Container(

                decoration: BoxDecoration(
                    border: Border.all(
                      width: 10,
                      color: const Color.fromARGB(200, 139, 57, 81),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10)
                    )
                ),
                child: const Text(
                  'Edit Decks',
                  style: TextStyle (
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                  ),
                ),
              ),

            ),


          ],
        ),
      )
      ],
    ),



    );
  }
}

class PopUpMenu extends StatelessWidget {
  final List<PopupMenuEntry> menuList;

  const PopUpMenu({Key? key, required this.menuList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: ((context) => menuList),
    );
  }

}