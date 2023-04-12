import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

double _containerHeight = 20;
double _spaceHeight = 10;
Color _shimmerColor = Colors.grey;
Color _shimmerColorDark = Colors.grey.shade200;

class ShimmerLoading {
  /// to do list
  Widget buildShimmerHomeContent() {
    return SafeArea(
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(20, 20, 19.9, 0),
                child: Shimmer.fromColors(
                  highlightColor: Colors.white,
                  baseColor: _shimmerColor!,
                  period: Duration(milliseconds: 1000),
                  child:  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 12.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: _shimmerColor,
                          ),
                          height: 110,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0)),
                              color: Colors.white,
                            ),
                            child: Container(
                              width: 80,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                padding: EdgeInsets.only(left: 12.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: _shimmerColor,
                                ),
                                height: _containerHeight,
                                child: Container(
                                    decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0)),
                                  color: Colors.white,
                                )),
                              ),
                              SizedBox(
                                height: _spaceHeight,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 12.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: _shimmerColor,
                                ),
                                height: _containerHeight,
                                child: Container(
                                    decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0)),
                                  color: Colors.white,
                                )),
                              ),
                              SizedBox(
                                height: _spaceHeight,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 12.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: _shimmerColor,
                                ),
                                height: _containerHeight,
                                width: 100,
                                child: Container(
                                    decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0)),
                                  color: Colors.white,
                                )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  color: _shimmerColor,
                  height: 1),
            ],
          );
        },
      ),
    );
  }
}
