import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8, top: 2),
          child: Card(
            elevation: 1,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  shape: BoxShape.rectangle,
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Placeholder(
                        strokeWidth: 1,
                        fallbackHeight: 250,
                        color: Colors.white,
                        child: CachedNetworkImage(
                          alignment: Alignment.center,
                          imageUrl: widget.outlet.coverImages.toString(),
                        ),
                      ),
                      Positioned(
                        width: 40,
                        top: 15,
                        left: MediaQuery.of(context).size.width - 70,
                        height: 40,
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          width: double.infinity,
                          child: widget.outlet.isFavourite
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      widget.outlet.isFavourite =
                                          !widget.outlet.isFavourite;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ))
                              : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      widget.outlet.isFavourite =
                                          !widget.outlet.isFavourite;
                                    });
                                  },
                                  icon: const Icon(Icons.favorite_outline,color: Colors.red,)),
                        ),
                      )
                    ],
                  ),
                  Container(
                    color: Colors.white60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  child: CachedNetworkImage(
                                      fit: BoxFit.fill,
                                      imageUrl:
                                          widget.outlet.logoImages.toString())),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 100,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            widget.outlet.name.toString(),
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: HexColor("F26F31"),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0, left: 5, right: 10),
                                              child: Text(
                                                  widget.outlet.rating
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.start),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width - 100,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                       Row(
                                         children: [
                                           const Icon(Icons.access_time,color: Colors.red,),
                                           const SizedBox(width: 10,),
                                           Text("${widget.outlet.averageFoodPreparationTime}min")
                                         ],
                                       ),
                                       Row(
                                         children: [
                                           const Icon(Icons.directions_bike_outlined,color: Colors.red,),
                                           const SizedBox(width: 10,),
                                           Text("${widget.outlet.deliveryFee}Tk")
                                         ],
                                       ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: 20,
            child: Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height/2,
                    maxWidth: MediaQuery.of(context).size.width / 2),
                decoration:const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8)),
                    color: Colors.deepOrangeAccent),
                child: Padding(
                  padding:  const EdgeInsets.all(8.0),
                  child: Expanded(
                    child: Text(
                      widget.outlet.listOfCusins.toString(),style: const TextStyle(
                      color: Colors.white
                    ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
