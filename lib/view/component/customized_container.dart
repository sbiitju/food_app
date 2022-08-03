import 'package:flutter/material.dart';

class CustomizedContainer extends StatelessWidget {
  double? height;
  double? width;
  double? radius;
  Color? color;
  Widget child;

  CustomizedContainer(
      {Key? key,
      this.width,
      this.height,
      this.radius,
      this.color,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 48,
      width: width ?? 48,
      decoration: BoxDecoration(
          color: color ?? Theme.of(context).scaffoldBackgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 10))),
      child: child ?? const SizedBox(),
    );
  }
}
