
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:untitled/deck_page.dart';
import 'package:untitled/sign_up_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  FirebaseDatabase database = FirebaseDatabase.instance;
  final databaseReference = FirebaseDatabase.instance.ref();

  Future<void> login() async {
    try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: usernameTextController.text,
      password: passwordTextController.text,
    );

    // createData();

    print('logged in successfully');

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  MyDeckPage(title: usernameTextController.text.substring(0, usernameTextController.text.indexOf('.')))),
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
    else {
      print('different error:' + e.message.toString());
    }
  }

  }

  // void updateData(){
  //   print('in create data');
  //   databaseReference.child("users/user4/cards").push({
  //   ["front3", "back3", 0]]
  //
  //
  //   });
  // }
  bool treason = false;
  void createData() async{
    print(usernameTextController.text);
    print('in create data');
    String hatred = "users/" + usernameTextController.text;
    String result = hatred.substring(0, hatred.indexOf('.'));

    DataSnapshot userDataSnapshot = await databaseReference.child(result).get();
    print('ds value below');
    // Map<dynamic, dynamic> catDeck = Map<dynamic, dynamic>.from(userDataSnapshot.value as Map);
    // print("'deck1': " + catDeck['deck1'].toString());
    //
    // print(catDeck.values.toString());
    // print(catDeck.runtimeType);



    // if(!treason) {
    //   databaseReference.child(result).set({
    //     'deck1': [
    //       "revenge",
    //       1,
    //       1,
    //       1,
    //       [
    //         ["u1front1", "u1back1", 0],
    //         ["u1front2", "u1back2", 0],
    //         ["u1front3", "u1back3", 0]
    //       ]
    //     ]
    //     ,
    //     'deck2': [
    //       "ledge",
    //       2,
    //       2,
    //       2,
    //       [["u2front1", "u2back1", 0], ["u2front2", "u2back2", 0]]
    //     ],
    //       'deck3': ["deck3name", 3, 3, 3, [["u1front3", "u1back3", 0], ["u1front3", "u1back3", 0]]],
        // //   // 'deck4': ["666", 3, 3, 3, [["u1front3", "u1back3", 0], ["u1front3", "u1back3", 0]]],
        // //   // 'deck5': ["999", 3, 3, 3, [["u1front3", "u1back3", 0], ["u1front3", "u1back3", 0]]],
    //     // //
    //     // //
    //   });
    //   // treason = true;
    // }

  }
//
// void readData(){
//     databaseReference.once().then((DataSnapshot snapshot) {
//       print('Data : ${snapshot.value}');
//     });
//   }

  void deleteData(){
    databaseReference.child('users/user2').remove();
    // databaseReference.child('flutterDevsTeam2').remove();
    //     // databaseReference.child('flutterDevsTeam3').remove();
  }

  void createNewCard(String frontTerm, String backTerm) async {
    // A post entry.
    final postData = {
      '0': frontTerm,
      '1': backTerm,
      '2': 0,
    };

    // Get a key for a new Post.
    final newPostKey =
        FirebaseDatabase.instance.ref().child('users').push().key;

    // Write the new post's data simultaneously in the posts list and the
    // user's post list.
    final Map<String, Map> updates = {};
    updates['/posts/$newPostKey'] = postData;

    return FirebaseDatabase.instance.ref().update(updates);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 40,
              child: Image.asset(
              'assets/images/SRSlyLogo.png')
          ),

          Expanded(
            flex: 50,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: const Text('Login',
                    style: TextStyle (
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30, bottom: 10, top: 10),
                  child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                    controller: usernameTextController,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30, bottom: 10, top: 10),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    controller: passwordTextController,
                  ),
                ),
                Container(

                  margin: EdgeInsets.only(top: 10, bottom: 20),
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: Colors.red
                    ),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Container(
                    margin: EdgeInsets.only(top: 30, bottom: 30),
                    width: 200,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                      onPressed: () {
                          login();
                      },
                      child: Text("Login"),
                    ),
                  )
                  )

              ],
            ),
          ),

          Expanded(
            flex: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUpPage(title: "Selected Deck Name")),
                      );
                    },
                    child: const Text('Sign up',
                      style: TextStyle (
                          color: Colors.red,
                          fontWeight: FontWeight.bold
                      ),
                    ),

                  ),
                ),

              ],
            ),
          )
        ],

      )




    );

  }
}
