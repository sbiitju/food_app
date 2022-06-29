import 'package:flutter/material.dart';
class Test extends StatefulWidget{
  const Test({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TestState();
}
class _TestState extends State<Test>{
  @override
  Widget build(BuildContext context) {
    return const AnotherTest();
  }
  
}
class AnotherTest extends StatelessWidget {
  const AnotherTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Test();
  }
}
