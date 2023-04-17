import 'package:flutter/material.dart';
import 'package:untitled/deck_page.dart';


class EditPage extends StatefulWidget {
  const EditPage({Key? key, required String title}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
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
                    child: const TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30, bottom: 10, top: 10),
                    child: const TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const MyDeckPage(title: "Decks")),
                            );

                          },
                          child: Text("Login"),
                        ),
                      )
                  )

                ],
              ),
            ),

            Expanded(
              flex: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Text(
                        'App logo'
                    ),
                  ),
                  IconButton(
                      onPressed: () {

                      },
                      icon: Icon(Icons.abc)
                  ),
                  IconButton(
                      onPressed: () {

                      },
                      icon: Icon(Icons.access_time )
                  ),

                ],
              ),
            )
          ],
        )


    );
  }
}
