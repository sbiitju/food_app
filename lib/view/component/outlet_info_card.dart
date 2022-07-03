import 'package:flutter/material.dart';

class OutletInfoCard extends StatefulWidget {
  const OutletInfoCard({Key? key}) : super(key: key);

  @override
  State<OutletInfoCard> createState() => _OutletInfoCardState();
}

class _OutletInfoCardState extends State<OutletInfoCard> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Flexible(
                child: Text(
                  "Burger King Banani",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Padding(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
                  child: Text("Open"),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: isFavourite
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              isFavourite = !isFavourite;
                            });
                          },
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ))
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              isFavourite = !isFavourite;
                            });
                          },
                          icon: const Icon(Icons.favorite_outline)),
                ),
              )
            ],
          ),
          Row(
            children: [
              Text("See more information"),
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
            children: [
              Container(
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 18,
                  )),
              Text(" 4.5"),
            ],
          ),
          Row(
            children: [
              Container(
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.alarm,
                    color: Colors.orange,
                    size: 18,
                  )),
              Text(" 25-30 min"),
              SizedBox(width: 10,),
              Container(
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.electric_bike_rounded,
                    color: Colors.orange,
                    size: 18,
                  )),
              Text(" Tk 20."),
            ],
          ),
        ],
      ),
    );
  }
}
