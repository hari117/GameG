import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:path/path.dart' as p;
import 'dart:convert';
import 'package:crypto/crypto.dart';

import 'package:mime_type/mime_type.dart';
import 'package:rawg/modules/future_network_image/network.image.request.model.dart';
import 'package:rawg/modules/future_network_image/network.image.request.queue.model.dart';
import 'package:semaphore/semaphore.dart';

String cacheDirPath = "/data/data/vip.hari.rawg/cache/cached_images";

var _maxCount = 7;
final $sm = LocalSemaphore(_maxCount);
NetworkImageRequestQueue requestQueue = NetworkImageRequestQueue();
int requestId = 0;

void getCachedVersionOfFile(NetworkImageRequest networkImageRequest) async {
  String baseFileNameWithoutExtension = generateMd5(networkImageRequest.url);
  //String baseFileNameWithoutExtension = Uuid().v1();
  String cachedPath = await getFileFromCache(baseFileNameWithoutExtension);
  if (cachedPath != null) {
    networkImageRequest.callback(cachedPath);
  }

  int tempRequestId = requestId++;
  requestQueue.push(networkImageRequest);
  var _client = http.Client();

  await $sm.acquire();
  Stopwatch stopwatch = Stopwatch();

  try {
    stopwatch.start();
    NetworkImageRequest networkImageRequest = requestQueue.pop();
    print(
        "RequestID: ${tempRequestId} executing url from queue: ${networkImageRequest.url} name: ${networkImageRequest.name} isVisible: ${networkImageRequest.isVisible}");
    var response = await _client.get(Uri.parse(networkImageRequest.url));
    print(
        "RequestID: ${tempRequestId} executed url from queue: ${networkImageRequest.url} name: ${networkImageRequest.name} isVisible: ${networkImageRequest.isVisible}");

    String extention = detectExtentionFromMime(response.headers["content-type"]);
    String fileName = p.join(cacheDirPath, baseFileNameWithoutExtension);
    fileName = "$fileName.$extention";
    var bytes = response.bodyBytes;
    File file = File(fileName);
    print(
        "RequestID: ${tempRequestId} writing to file : ${networkImageRequest.url} name: ${networkImageRequest.name} isVisible: ${networkImageRequest.isVisible}");
    await file.createSync(recursive: true);
    await file.writeAsBytes(bytes);
    print(
        "RequestID: ${tempRequestId} writen to file and returning url from queue: ${networkImageRequest.url} name: ${networkImageRequest.name} isVisible: ${networkImageRequest.isVisible}");

    networkImageRequest.callback(file.path);
  } catch (error, st) {
    // TODO return error image from assets

  } finally {
    stopwatch.stop();
    print(
        "RequestID: ${tempRequestId} releasing lock: ${networkImageRequest.url} name: ${networkImageRequest.name} isVisible: ${networkImageRequest.isVisible}");
    await $sm.release();
    print(
        "RequestID: ${tempRequestId} released lock: ${networkImageRequest.url} name: ${networkImageRequest.name} isVisible: ${networkImageRequest.isVisible}");
  }
}

Future<String> getFileFromCache(String hash) async {
  Directory root = Directory(cacheDirPath);
  List<FileSystemEntity> files = await dirContents(root);
  List<String> paths = files.map((f) => f.path).toList();
  String foundPath = paths.firstWhere((path) => p.basenameWithoutExtension(path) == hash, orElse: () => null);
  return foundPath;
}

Future<List<FileSystemEntity>> dirContents(Directory dir) {
  var files = <FileSystemEntity>[];
  var completer = Completer<List<FileSystemEntity>>();
  var lister = dir.list(recursive: false);
  lister.listen((file) => files.add(file),
      // should also register onError
      onDone: () => completer.complete(files));
  return completer.future;
}

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}

String detectExtentionFromMime(String mime) {
  String extention = extensionFromMime(mime);
  if (extention == "jpe") {
    return "jpg";
  } else {
    return extention;
  }
}
