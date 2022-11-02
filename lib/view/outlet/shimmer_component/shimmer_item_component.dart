import 'package:flutter/material.dart';
import 'package:food_app/util/function.dart';
import 'package:shimmer/shimmer.dart';

class OutletCardShimmer extends StatelessWidget {
  OutletCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: getScreenWidth(context),
          height: getScreenHeight(context),
          child: Stack(
            children: [
              Shimmer.fromColors(
                  highlightColor: Colors.white,
                  baseColor: Colors.grey,
                  child: Container(
                    width: getScreenWidth(context),
                    height: getScreenHeight(context) / 4,
                    color: Colors.grey.withOpacity(0.2),
                  )),
              Positioned(
                top: 110,
                right: 10,
                left: 10,
                child: Shimmer.fromColors(
                    highlightColor: Colors.white,
                    baseColor: Colors.grey,
                    child: Container(
                      width: getScreenWidth(context),
                      height: getScreenHeight(context) / 7,
                      color: Colors.grey.withOpacity(0.1),
                    )),
              ),
              Positioned(
                  top: 200,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(
                        height: getScreenHeight(context),
                        width: getScreenWidth(context)),
                    child: ListView.separated(
                      separatorBuilder: (context, i) {
                        return Divider();
                      },
                      itemBuilder: (context, itemindex) {
                        return Row(
                          children: [
                            Shimmer.fromColors(
                                highlightColor: Colors.white,
                                baseColor: Colors.grey,
                                child: Container(
                                  width: getScreenWidth(context),
                                  height: getScreenHeight(context) / 7,
                                  color: Colors.grey.withOpacity(0.1),
                                )),
                          ],
                        );
                      },
                      itemCount: 6,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
