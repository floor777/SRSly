import 'package:flutter/material.dart';


class DeckFinishedPage extends StatefulWidget {
  const DeckFinishedPage({super.key, required this.title});

  final String title;

  @override
  State<DeckFinishedPage> createState() => _DeckFinishedPageState();
}

class _DeckFinishedPageState extends State<DeckFinishedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("You have finished this deck for now. Check in later "
            "for future reviews"),
      ),
    );
  }
}
