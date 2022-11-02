import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app/util/function.dart';

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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                shape: BoxShape.rectangle,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Placeholder(
                        color: Theme.of(context).backgroundColor,
                        strokeWidth: 1,
                        fallbackHeight: 200,
                        child: CachedNetworkImage(
                          alignment: Alignment.center,
                          fit: BoxFit.fill,
                          imageUrl: widget.outlet.coverImages.toString(),
                        ),
                      ),
                      Positioned(
                        width: 40,
                        top: 15,
                        left: MediaQuery.of(context).size.width - 70,
                        height: 40,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              shape: BoxShape.circle),
                          width: double.infinity,
                          child: widget.outlet.isFavourite
                              ? IconButton(
                                  color: Theme.of(context).backgroundColor,
                                  onPressed: () {
                                    setState(() {
                                      widget.outlet.isFavourite =
                                          !widget.outlet.isFavourite;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    color: Theme.of(context).primaryColor,
                                  ))
                              : IconButton(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  onPressed: () {
                                    setState(() {
                                      widget.outlet.isFavourite =
                                          !widget.outlet.isFavourite;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.favorite_outline,
                                    color: Theme.of(context).primaryColor,
                                  )),
                        ),
                      )
                    ],
                  ),
                  Container(
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
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0, left: 5, right: 10),
                                              child: Text(
                                                  widget.outlet.rating
                                                      .toString(),
                                                  style: const TextStyle(
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
                                    width:
                                        MediaQuery.of(context).size.width - 100,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                                "${widget.outlet.averageFoodPreparationTime}min")
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.directions_bike_outlined,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                                "${widget.outlet.deliveryFee}Tk")
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
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: 0,
                    minWidth: 0,
                    maxWidth: getScreenWidth(context) / 2),
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.outlet.listOfCusins.toString(),
                      style: const TextStyle(color: Colors.white),
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
