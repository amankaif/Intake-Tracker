// ignore_for_file: prefer_const_constructors
import 'package:calorie_tracker/screens/login_page/login_widgets/login_widgets.dart';
import 'package:calorie_tracker/screens/login_page/login_text_style.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Background(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 200,
                  child: Center(
                    child: Text('Login', style: headingStyle),
                  ),
                ),
                SizedBox(height: 100),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Center(
                            child: EmailTextFeild(),
                          ),
                          PassTextFeild(),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 25.0),
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextButton(
                                onPressed: () {},
                                child: Text("Login", style: inputTextStyle),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
