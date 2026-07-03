import 'package:flutter/material.dart';

class RootState {
  late BuildContext context;
  late double width;
  late double height;
  late double scw;
  late double sch;
  late bool isver;

  RootState(this.context) {
    scw = MediaQuery.of(context).size.shortestSide;
    sch = MediaQuery.of(context).size.longestSide;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    isver = MediaQuery.of(context).orientation == Orientation.portrait;
  }

  // viewport width
  double vw() {
    return isver ? scw : sch;
  }

  // viewport height
  double vh() {
    return isver ? sch : scw;
  }
}
