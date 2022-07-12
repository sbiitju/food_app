import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app/view/outlet_info.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../data/model/outlet_model.dart';

class OutletInfoAppBar extends StatefulWidget {
  OutletInfoModel outlet;

  OutletInfoAppBar(this.outlet, {Key?    key}) : super(key: key);

  @override
  State<OutletInfoAppBar> createState() => _OutletInfoAppBarState();
}

class _OutletInfoAppBarState extends State<OutletInfoAppBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              shape: BoxShape.rectangle,
              color: Colors.white),
          child: Stack(
            children: [
              CachedNetworkImage(
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                imageUrl: widget.outlet.coverUrl.toString(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
