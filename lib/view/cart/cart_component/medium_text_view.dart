import 'package:flutter/material.dart';

class MediumTextView extends StatelessWidget {
  final String text;
  final Function? onPressed;

  const MediumTextView({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
