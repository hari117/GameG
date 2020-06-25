class NetworkImageRequest {
  String name;
  String url;
  bool isVisible;
  Function callback;

  @override
  String toString() {
    return 'NetworkImageRequest{name: $name, isVisible: $isVisible}';
  }
}
