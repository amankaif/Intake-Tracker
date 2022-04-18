import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
          centerTitle: true,
          backgroundColor: Colors.red[500],
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("lmao"),
            TextButton(
              onPressed: () {},
              child: Text("Row button"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.amber[400])
              ),
            ),
            Container(
              color: Colors.blue[300],
              padding: EdgeInsets.all(30),
              child: Text("inside container"),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Text("clicker"),
          backgroundColor: Colors.green[300],
        ));
  }
}

