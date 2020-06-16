import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rawg/helperfiles/imagerequesthandeler.dart';
import 'package:rawg/pages/homepagewidgets/black.progress.indicator.widget.dart';

class FutureNetworkImage extends StatefulWidget {
  String url;

  FutureNetworkImage(this.url);

  @override
  _FutureNetworkImageState createState() => _FutureNetworkImageState();
}

class _FutureNetworkImageState extends State<FutureNetworkImage> {
  String imageLocation;

  @override
  void initState() {
    super.initState();
    print("calling getcachedversionofFile funtion");
    getCachedVersionOfFile(widget.url).then((value) {
      this.imageLocation = value;
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (imageLocation == null || imageLocation == "") {
      return Center(child: BlackProgressIndicatorWidget());
    } else {
      return Image.file(
        File(imageLocation),
        fit: BoxFit.cover,
      );
    }
  }
}
