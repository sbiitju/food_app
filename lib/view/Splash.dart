import 'package:flutter/material.dart';
import 'package:food_app/view/Home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                  child: Text("Form"),
                  color: Colors.redAccent,
                  onPressed: () => {
                    Navigator.pushNamed(context, Home.routeName)
                  })
            ],
          ),
        ),
      ),
    );
  }
}
