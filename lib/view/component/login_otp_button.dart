import 'package:flutter/material.dart';

class LoginOtpButton extends StatelessWidget {
  final String text;
  final Color color;
  VoidCallback? clickEvenListener;

  LoginOtpButton(
      {required this.text,
      required this.clickEvenListener,
      required this.color,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: color,
      width: MediaQuery.of(context).size.width,
      child: MaterialButton(
        onPressed: clickEvenListener,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
