import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BigTextView extends StatelessWidget {
  String text;
  Function? onPressed;

  BigTextView({Key? key, required this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
