import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/model/outlet_model.dart';

class OutletInfoAppBar extends StatefulWidget {
  OutletInfoModel outlet;

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
          height: 200,
          decoration: const BoxDecoration(
              shape: BoxShape.rectangle, color: Colors.white),
          child: Stack(
            children: [
              CachedNetworkImage(
                height: 250,
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
