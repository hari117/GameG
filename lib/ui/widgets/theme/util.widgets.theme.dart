import 'package:flutter/material.dart';

final double verticalSpace1 = 10;
final double verticalSpace2 = 15;
final double verticalSpace3 = 20;

final double pagePadding = 30;

class VS1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: verticalSpace1);
  }
}

class VS2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: verticalSpace2);
  }
}

class VS3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: verticalSpace3);
  }
}

class MLPS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: pagePadding);
  }
}

class PagePadding extends StatelessWidget {
  Widget child;

  PagePadding({this.child});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: pagePadding),
      child: child,
    );
  }
}

class MB1 extends StatelessWidget {
  Widget child;

  MB1({this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: verticalSpace1),
      child: child,
    );
  }
}

class MB2 extends StatelessWidget {
  Widget child;

  MB2({this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: verticalSpace2),
      child: child,
    );
  }
}

class MB3 extends StatelessWidget {
  Widget child;

  MB3({this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: verticalSpace3),
      child: child,
    );
  }
}

class MT3 extends StatelessWidget {
  Widget child;

  MT3({this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: verticalSpace3),
      child: child,
    );
  }
}

//
//class MarginBottom1PagePadding extends StatelessWidget {
//  static const double marginBottom = 10;
//
//  Widget child;
//
//  MarginBottom1PagePadding({this.child});
//
//  @override
//  Widget build(BuildContext context) {
//    return PagePadding(
//      child: Padding(
//        padding: const EdgeInsets.only(bottom: marginBottom),
//        child: child,
//      ),
//    );
//  }
//}
//
//class MarginBottom2PagePadding extends StatelessWidget {
//  static const double marginBottom = 15;
//
//  Widget child;
//
//  MarginBottom2PagePadding({this.child});
//
//  @override
//  Widget build(BuildContext context) {
//    return PagePadding(
//      child: Padding(
//        padding: const EdgeInsets.only(bottom: marginBottom),
//        child: child,
//      ),
//    );
//  }
//}
//
//class MarginBottom3PagePadding extends StatelessWidget {
//  static const double marginBottom = 20;
//
//  Widget child;
//
//  MarginBottom3PagePadding({this.child});
//
//  @override
//  Widget build(BuildContext context) {
//    return PagePadding(
//      child: Padding(
//        padding: const EdgeInsets.only(bottom: marginBottom),
//        child: child,
//      ),
//    );
//  }
//}
