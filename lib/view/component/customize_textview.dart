import 'package:flutter/material.dart';

class CustomizedTextView extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? textSize;

  const CustomizedTextView(
      {required this.text, Key? key, this.textSize, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: textColor, fontSize: textSize),
    );
  }
}
