import 'package:flutter/material.dart';
import 'package:food_app/model/screenarguments.dart';
import 'package:food_app/view/thirdpage.dart';
import 'package:get/get.dart';

import 'Home.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Future<void> returningData(BuildContext context) async{
      final result = await Navigator.pushNamed(context, ThirdClass.routeName,arguments: ScreenArguments("Shahin bashar", "This is a message"));
      ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(SnackBar(content: Text("$result")));
    }
    return SafeArea(child: Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                color: Colors.amber,
                onPressed: (){
                 Navigator.pushNamed(context, '/second');
                },
                child: Text("First Screen"),
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
                        color: Colors.white,
                        onPressed: (){
                        returningData(context);
                        })
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
