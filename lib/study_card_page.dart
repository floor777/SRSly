import 'package:flutter/material.dart';

import 'card_flipped_page.dart';
class StudyCardPage extends StatefulWidget {
  const StudyCardPage({super.key, required this.title});

  final String title;

  @override
  State<StudyCardPage> createState() => _StudyCardPageState();
}

class _StudyCardPageState extends State<StudyCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Term", style: TextStyle (
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),
            ),

            Container(
              child: Column(
                children: [
                  const Text("X + X + X",
                    style: TextStyle (
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),),
                  ElevatedButton(onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CardFlippedPage(title: "Selected Deck Name")),
                    );
                  },
                      child: const Text("Show Answer",
                        style: TextStyle (
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        ),))
                ],
              ),


            )
            
            
          ],
        ),
      ),


    );
  }
}
