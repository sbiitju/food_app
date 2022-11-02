import 'package:flutter/material.dart';
import 'package:food_app/util/function.dart';
import 'package:shimmer/shimmer.dart';

class HomeCardShimmer extends StatelessWidget {
  HomeCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: getScreenWidth(context),
          height: getScreenHeight(context),
          child: ListView.separated(
            separatorBuilder: (context, i) {
              return Divider();
            },
            itemBuilder: (context, itemindex) {
              return Shimmer.fromColors(
                highlightColor: Colors.white,
                baseColor: Colors.grey.withOpacity(0.04),
                child: Row(
                  children: [
                    Container(
                      width: getScreenWidth(context),
                      height: getScreenHeight(context) / 4,
                      color: Colors.black26,
                    ),
                  ],
                ),
              );
            },
            itemCount: 10,
          ),
        ),
      ),
    );
  }
}
