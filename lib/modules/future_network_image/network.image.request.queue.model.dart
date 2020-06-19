import 'package:rawg/modules/future_network_image/network.image.request.model.dart';

class NetworkImageRequestQueue {
  List<NetworkImageRequest> list = [];

  void push(NetworkImageRequest request) {
    this.list.add(request);
  }

  NetworkImageRequest pop() {
    NetworkImageRequest visibleNetworkRequest;
    for (var singleRequest in list) {
      if (singleRequest.isVisible == true) {
        visibleNetworkRequest = singleRequest;
      }
    }
    if (visibleNetworkRequest != null) {
      list.remove(visibleNetworkRequest);
      return visibleNetworkRequest;
    } else {
      return list.removeLast();
    }
  }
}
