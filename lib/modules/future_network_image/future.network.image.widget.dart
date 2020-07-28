import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/flutter_widgets.dart';
import 'package:gameg/helperfiles/logger.helper.dart';
import 'package:gameg/modules/future_network_image/my.image.store.dart';
import 'package:gameg/modules/future_network_image/network.image.request.model.dart';
import 'package:gameg/pages/homepagewidgets/black.progress.indicator.widget.dart';

class FutureNetworkImage extends StatefulWidget {
  String name;
  String url;

  FutureNetworkImage(this.name, this.url);

  @override
  _FutureNetworkImageState createState() => _FutureNetworkImageState();
}

class _FutureNetworkImageState extends State<FutureNetworkImage> {
  final log = getLogger("_FutureNetworkImageState");
  bool isVisible = false;

  String diskImagePath;
  NetworkImageRequest _networkImageRequest = NetworkImageRequest();

  @override
  void initState() {
    super.initState();
    createNetworkImageRequest();
  }

  setVisibility(bool isVisible) {
    this.isVisible = isVisible;
    _networkImageRequest.isVisible = isVisible;
  }

  void createNetworkImageRequest() {
    if (widget.url == _networkImageRequest.url) {
      return;
    }

    _networkImageRequest.url = widget.url;
    _networkImageRequest.name = widget.name;
    _networkImageRequest.isVisible = isVisible;
    _networkImageRequest.callback = onImageLocation;
    $myImageStore.getLocalImagePathForUrl(_networkImageRequest);
  }

  void onImageLocation(String fileLocation) {
    this.diskImagePath = fileLocation;
    log.i("${widget.name}: cache file: $fileLocation");
    if (mounted == true) {
      log.i("${widget.name}: Got cached version of image:  isMounted: $mounted isVisible: ${_networkImageRequest.isVisible} going to call set state");
      print("calling set state for image: ${widget.name}");
      setState(() {});
    } else {
      log.i("${widget.name}: Got cached version of image:  isMounted: $mounted isVisible: ${_networkImageRequest.isVisible} not calling set state");
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    createNetworkImageRequest();
    log.i("called FutureNetworkImage class to retrive image ${widget.url}");
    log.i("called FutureNetworkImage class to network url ${_networkImageRequest.url}");
    Widget child = _buildWidget(context);
    return VisibilityDetector(
      key: Key(widget.url),
      onVisibilityChanged: (info) {
        print("Visibility for: ${widget.name} = ${info.visibleFraction}");
        if (info.visibleFraction > 0.0) {
          setVisibility(true);
        } else {
          setVisibility(false);
        }
      },
      child: child,
    );
  }

  @override
  Widget _buildWidget(BuildContext context) {
    if (diskImagePath == null || diskImagePath == "") {
      return Center(
        child: BlueProgressIndicatorWidget(),
      );
    } else {
      return Image.file(
        File(diskImagePath),
        fit: BoxFit.cover,
      );
    }
  }
}
