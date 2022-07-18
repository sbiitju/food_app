import 'package:flutter/material.dart';
import 'package:food_app/util/function.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CartUpdateButton extends StatefulWidget {
  const CartUpdateButton({Key? key}) : super(key: key);

  @override
  State<CartUpdateButton> createState() => _CartUpdateButtonState();
}

class _CartUpdateButtonState extends State<CartUpdateButton> {
  int counter = 0;
  var isCounterZero = true;

  void decrement() {
    setState(() {
      if (counter == 1) {
        counter = 0;
        isCounterZero = true;
      } else {
        counter--;
      }
    });
  }

  void increment() {
    setState(() {
      counter++;
      isCounterZero = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 45,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.deepOrangeAccent, width: 2)),
        child: isCounterZero
            ? Center(
                child: MaterialButton(onPressed: (){
                  if(checkLoginStatus()){
                    increment();
                  }else{
                    showDialog(context: context, builder: (context){
                      return loginCheckingDialog(context);
                    });
                  }

                }, child: Text("Add",style: TextStyle(
                  color: Colors.deepOrangeAccent,fontSize: 20
                ),)))
            : Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: IconButton(
                        onPressed: decrement,
                        icon: Icon(
                          Icons.minimize_rounded,
                          size: 20,
                          color: Colors.black,
                        )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    counter.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  ),
                  IconButton(
                      onPressed: increment,
                      icon: Icon(
                        Icons.add,
                        color: Colors.black,
                      )),
                ],
              ),
      ),
    );
  }
}
