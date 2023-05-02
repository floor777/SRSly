import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:untitled/deck_page.dart';
import 'package:untitled/sign_up_page.dart';

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





    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  MyDeckPage(title: usernameTextController.text.substring(0, usernameTextController.text.indexOf('.')))),
    );
  } on FirebaseAuthException catch (e) {
    // if (e.code == 'user-not-found') {
    //   print('No user found for that email.');
    // } else if (e.code == 'wrong-password') {
    //   print('Wrong password provided for that user.');
    // }
    // else {
    //   print('different error:' + e.message.toString());
    // }
  }

  }


  void createData() async{

    String userName = "users/" + usernameTextController.text;
    String result = userName.substring(0, userName.indexOf('.'));

    DataSnapshot userDataSnapshot = await databaseReference.child(result).get();



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
