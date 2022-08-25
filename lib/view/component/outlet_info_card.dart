import 'package:flutter/material.dart';

import '../../data/model/outlet_info_model.dart';

class OutletInfoCard extends StatefulWidget {
  OutletInfoModel? outlet;

  OutletInfoCard(this.outlet, {Key? key}) : super(key: key);

  @override
  State<OutletInfoCard> createState() => _OutletInfoCardState();
}

class _OutletInfoCardState extends State<OutletInfoCard> {
  bool isOpen = false;
  String? id;
  String? restaurantName;
  String? outletName;
  String? address;
  String? coverUrl;
  String? logoUrl;
  int? averageFoodPreparationTime;
  String? totalFavorite;
  String? estimatedDeliveryTime;
  dynamic cuisines;

  late bool isFavorite;
  String? deliveryFee;
  var rating;
  int? totalRating;

  List<Widget> ratingWidget(rating, totalRating) {
    var listOfWidget = <Widget>[];
    listOfWidget.add(Container(
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: Icon(
          Icons.star,
          color: Theme.of(context).primaryColor,
          size: 18,
        )));
    if (rating != null && rating != 0) {
      if (totalRating != null && totalRating != 0) {
        listOfWidget.add(Text(" ${rating} (${totalRating})"));
      } else {
        listOfWidget.add(Text(" ${rating} "));
      }
    }
    listOfWidget.add(SizedBox(
      width: 20,
    ));
    listOfWidget.add(Text(getCuisins(cuisines as List<Object?>)));
    return listOfWidget;
  }

  @override
  Widget build(BuildContext context) {
    id = widget.outlet?.id;
    restaurantName = widget.outlet?.restaurantName;
    isOpen = widget.outlet?.isOpen ?? false;
    outletName = widget.outlet?.outletName;
    address = widget.outlet?.address;
    coverUrl = widget.outlet?.coverUrl;
    logoUrl = widget.outlet?.logoUrl;
    cuisines = widget.outlet?.cuisines;
    isFavorite = widget.outlet?.isFavorite ?? false;
    deliveryFee = widget.outlet?.deliveryFee;
    averageFoodPreparationTime = widget.outlet?.averageFoodPreparationTime;
    totalFavorite = widget.outlet?.totalFavorite;
    estimatedDeliveryTime = widget.outlet?.estimatedDeliveryTime;
    rating = widget.outlet?.rating;
    totalRating = widget.outlet?.totalRating;
    return Padding(
      padding: EdgeInsets.all(7.0),
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    "${restaurantName}-${outletName}",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color:
                          isOpen ? Theme.of(context).primaryColor : Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
                    child: isOpen
                        ? Text(
                            "Open",
                            style: TextStyle(color: Colors.white),
                          )
                        : Text("Close"),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: isFavorite
                      ? Icon(
                          Icons.search_sharp,
                          color: Theme.of(context).primaryColor,
                        )
                      : Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: IconButton(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite_outline,
                                color: Theme.of(context).primaryColor,
                              )),
                        ),
                )
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                height: 30,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "See more information",
                      style: TextStyle(),
                    )),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12,
              )
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            children: ratingWidget(rating, totalRating),
          ),
          Row(
            children: [
              Container(
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Icon(
                    Icons.alarm,
                    color: Theme.of(context).primaryColor,
                    size: 18,
                  )),
              Text(
                  " ($averageFoodPreparationTime-${averageFoodPreparationTime! + 5}) min"),
              SizedBox(
                width: 10,
              ),
              Container(
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Icon(
                    Icons.electric_bike_rounded,
                    color: Theme.of(context).primaryColor,
                    size: 18,
                  )),
              Text("  Tk ${widget.outlet?.deliveryFee}."),
            ],
          ),
        ],
      ),
    );
  }

  String getCuisins(List<Object?> cuisines) {
    String cuisinsString = "";
    if (cuisines.length > 3) {
      cuisines = cuisines.sublist(0, 3);
    }
    cuisines.forEach((element) {
      cuisinsString = "${cuisinsString + element!.toString()} . ";
    });
    return cuisinsString;
  }
}
