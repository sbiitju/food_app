import 'package:flutter/material.dart';
import 'package:food_app/view/Splash.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Second Screen"),
              ),
              Hero(
                tag: 'imageHero',
                child: Column(
                  children: [
                    Image.network(
                      'https://picsum.photos/250?image=9',
                    ),
                    MaterialButton(
                        child: Text("Demo Text"),
                        color: Colors.redAccent,
                        onPressed: (){})
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
