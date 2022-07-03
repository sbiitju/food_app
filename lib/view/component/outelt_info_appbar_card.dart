import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../data/model/outlet_model.dart';

class OutletInfoAppBar extends StatefulWidget {
  Outlet outlet;

  OutletInfoAppBar(this.outlet, {Key? key}) : super(key: key);

  @override
  State<OutletInfoAppBar> createState() => _OutletInfoAppBarState();
}

class _OutletInfoAppBarState extends State<OutletInfoAppBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              shape: BoxShape.rectangle,
              color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    placeholder: (context, url) =>
                        Center(child: const CircularProgressIndicator()),
                    imageUrl: widget.outlet.coverImages.toString(),
                  ),
                  Positioned(
                    top: 120,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: HexColor("D3272323"),
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
                                          imageUrl: widget.outlet.logoImages
                                              .toString())),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                100,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                widget.outlet.name.toString(),
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: HexColor("F26F31"),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5.0,
                                                          left: 5,
                                                          right: 10),
                                                  child: Text(
                                                      widget.outlet.rating
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      textAlign:
                                                          TextAlign.start),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                100,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.access_time,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                    "${widget.outlet.averageFoodPreparationTime}min",style: TextStyle(
                                                  color: Colors.white
                                                ),)
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons
                                                      .directions_bike_outlined,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                    "${widget.outlet.deliveryFee}Tk",style: TextStyle(
                                                  color: Colors.white
                                                ),)
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
                    ),
                  ),
                  Positioned(
                    width: 40,
                    top: 30,
                    left: MediaQuery.of(context).size.width - 60,
                    height: 40,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white60, shape: BoxShape.circle),
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
                              icon: const Icon(Icons.favorite_outline)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
            top: 30,
            child: Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: Container(
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              ),
            )),
      ],
    );
  }
}
