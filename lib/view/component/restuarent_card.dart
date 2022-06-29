import 'package:flutter/material.dart';

import '../../data/model/outlet_model.dart';

class ResturentCard extends StatefulWidget {
  Outlet outlet;

  ResturentCard(this.outlet, {Key? key}) : super(key: key);

  @override
  State<ResturentCard> createState() => _ResturentCardState();
}

class _ResturentCardState extends State<ResturentCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            shape: BoxShape.rectangle,
            color: Color(0x9ABEBABA)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(widget.outlet.coverImages.toString()),
                Positioned(
                  width: 40,
                  top: 15,
                  left: MediaQuery.of(context).size.width - 60,
                  height: 40,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white60, shape: BoxShape.circle),
                    width: double.infinity,
                    child: widget.outlet.isFavourite
                        ? IconButton(
                            onPressed: () {
                              setState((){
                                widget.outlet.isFavourite = !widget.outlet.isFavourite;
                              });
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ))
                        : IconButton(
                            onPressed: () {
                              setState((){
                                widget.outlet.isFavourite = !widget.outlet.isFavourite;
                              });
                            },
                            icon: Icon(Icons.favorite_outline)),
                  ),
                )
              ],
            ),
            Container(
              color: Colors.white60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.network(
                                widget.outlet.logoImages.toString())),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Text(
                          widget.outlet.name.toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        )),
                        Text(
                            "Delivery Fee \n${widget.outlet.deliveryFee.toString()}Tk.",
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
