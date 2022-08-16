import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderPlacePopUp extends StatelessWidget {
  const OrderPlacePopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assest/img_login.png"),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Thank You For Ordering!",
              style: TextStyle(
                  fontSize: 25,
                  color: CupertinoColors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Your order will be at your \n doorstep soon",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Theme
                      .of(context)
                      .primaryColor,
                  borderRadius:
                  const BorderRadius.all(const Radius.circular(10))),
              child: MaterialButton(
                onPressed: () {
                  
                },
                child: const Text("Track Order"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
