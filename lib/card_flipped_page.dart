import 'package:flutter/material.dart';

class CardFlippedPage extends StatefulWidget {
  const CardFlippedPage({super.key, required this.title});

  final String title;

  @override
  State<CardFlippedPage> createState() => _CardFlippedPageState();
}

class _CardFlippedPageState extends State<CardFlippedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Term", style: TextStyle (
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),
            ),

            const Text("Answer", style: TextStyle (
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),
            ),

            Container(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonBar(
                    children: [
                      ElevatedButton(onPressed: () {}, child: Text("Again")),
                      ElevatedButton(onPressed: () {}, child: Text("Hard")),
                      ElevatedButton(onPressed: () {}, child: Text("Good")),
                      ElevatedButton(onPressed: () {}, child: Text("Easy"))
                    ],
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
