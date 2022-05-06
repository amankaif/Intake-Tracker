
import 'package:flutter/material.dart';
import '../login_text_style.dart';

class PassTextFeild extends StatelessWidget {
  const PassTextFeild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: Colors.blueGrey[300]?.withOpacity(0.3),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding:EdgeInsets.symmetric(vertical:20),
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),

                      child: Icon(
                        Icons.lock_open_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    hintText: "Password",
                    hintStyle: bodyTextStyle
                ),
                obscureText: true,
                style: inputTextStyle,
                textInputAction: TextInputAction.done,
              ),
            ),
          ),
        ],
      ),
    );
  }
}