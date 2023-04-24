import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/login_page.dart';
import 'package:firebase_database/firebase_database.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key, required String title}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final ref = FirebaseDatabase.instance.ref();





  Future<void> signUp() async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: usernameTextController.text,
        password: passwordTextController.text,
      );
      print(testing());
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> testing() async {
    final snapshot  = await ref.child('users/user1').get();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print('No data available.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Text('Sign up'),
        ),
        body: Column(
          children: [
            Expanded(
                flex: 35,
                child: Image.asset(
                    'assets/images/SRSlyLogo.png')
            ),

            Expanded(
              flex: 50,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: const Text('Sign up',
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
                      obscureText: false,
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
                            signUp();


                          },
                          child: Text("Sign up"),
                        ),
                      )
                  )

                ],
              ),
            ),
          ],

        )




    );
  }
}
