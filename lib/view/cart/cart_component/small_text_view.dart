import 'package:flutter/material.dart';

class SmallTextView extends StatelessWidget {
  final String text;
  final Function()? onPressed;

  const SmallTextView({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
