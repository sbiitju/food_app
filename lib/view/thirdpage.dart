import 'package:flutter/material.dart';
import 'package:food_app/model/screenarguments.dart';
class ThirdClass extends StatefulWidget {
  const ThirdClass({Key? key}) : super(key: key);
  static const routeName='/ThirdScreen';
  @override
  State<ThirdClass> createState() => _ThirdClassState();
}

class _ThirdClassState extends State<ThirdClass> {
  @override
  Widget build(BuildContext context) {
    final args= ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(args.title+"\n"+args.message),
              MaterialButton(
                  color: Colors.redAccent,
                  child: Text("GO Back"),
                  onPressed: (){
                Navigator.pop(context,"Got The Data");
              })
            ],
          ),
        ),
      ),
    );
  }
}
