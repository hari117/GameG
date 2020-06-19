import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_widgets/flutter_widgets.dart';
import 'package:rawg/modules/future_network_image/network.image.cache.service.dart';
import 'package:rawg/modules/future_network_image/network.image.request.model.dart';
import 'package:rawg/pages/homepagewidgets/black.progress.indicator.widget.dart';

class FutureNetworkImage extends StatefulWidget {
  String name;
  String url;

  FutureNetworkImage(this.name, this.url);

  @override
  _FutureNetworkImageState createState() => _FutureNetworkImageState();
}

class _FutureNetworkImageState extends State<FutureNetworkImage> {
  String imageLocation;
  NetworkImageRequest _networkImageRequest = NetworkImageRequest();

  @override
  void initState() {
    super.initState();
    _networkImageRequest.url = widget.url;
    _networkImageRequest.isVisible = false;
    _networkImageRequest.name = widget.name;
    _networkImageRequest.callback = onImageLocation;

    getCachedVersionOfFile(_networkImageRequest);
  }

  void onImageLocation(String fileLocation){
    print(
        "Got cached version of image: ${widget.name} isMounted: $mounted isVisible: ${_networkImageRequest.isVisible}");
    this.imageLocation = fileLocation;

    if (mounted == true) {
      print("calling set state for image: ${widget.name}");
      setState(() {});
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget child = _buildWidget(context);
    return VisibilityDetector(
      key: Key(widget.url),
      onVisibilityChanged: (info) {
        print("Visibility for: ${widget.name} = ${info.visibleFraction}");
        if (info.visibleFraction > 0.0) {
          _networkImageRequest.isVisible = true;
        } else {
          _networkImageRequest.isVisible = false;
        }
      },
      child: child,
    );
  }

  @override
  Widget _buildWidget(BuildContext context) {
    if (imageLocation == null || imageLocation == "") {
      return Center(child: BlackProgressIndicatorWidget());
    } else {
//      print("sucessfully retrived image");
      return Image.file(
        File(imageLocation),
        fit: BoxFit.cover,
      );
    }
  }
}
