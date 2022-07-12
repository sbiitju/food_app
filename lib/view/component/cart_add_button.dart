import 'package:flutter/material.dart';

class CartUpdateButton extends StatefulWidget {
  const CartUpdateButton({Key? key}) : super(key: key);

  @override
  State<CartUpdateButton> createState() => _CartUpdateButtonState();
}

class _CartUpdateButtonState extends State<CartUpdateButton> {
  int counter = 0;

  void decreement() {
    setState(() {
      if(counter == 0){
        counter =0;
      }else{
        counter--;
      }
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
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: IconButton(
                  onPressed: decreement,
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
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                },
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
