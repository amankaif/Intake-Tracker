import 'package:flutter/material.dart';
import '../login_text_style.dart';

class EmailTextFeild extends StatelessWidget {
  const EmailTextFeild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
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
                  Icons.email_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              hintText: "Email",
              hintStyle: bodyTextStyle
          ),
          style: inputTextStyle,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
        ),
      ),
    );
  }
}