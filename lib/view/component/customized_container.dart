import 'package:flutter/material.dart';

class CustomizedContainer extends StatelessWidget {
  final double? height;
  final double maxHeight;
  final double? minHeight;
  final double? width;
  final double maxWidth;
  final double? minWidth;
  final double? radius;
  final Color? color;
  final Widget child;

  const CustomizedContainer(
      {Key? key,
      required this.maxHeight,
      required this.maxWidth,
      this.minWidth,
      this.minHeight,
      this.width,
      this.height,
      this.radius,
      this.color,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxWidth: maxWidth,
          maxHeight: maxHeight,
          minHeight: minHeight ?? 30,
          minWidth: minWidth ?? 30),
      child: Container(
          decoration: BoxDecoration(
              color: color ?? Theme.of(context).scaffoldBackgroundColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 10))),
          child: child),
    );
  }
}
