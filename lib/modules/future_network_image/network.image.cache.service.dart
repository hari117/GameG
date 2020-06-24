import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'package:path/path.dart' as p;
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import 'package:mime_type/mime_type.dart';
import 'package:rawg/modules/future_network_image/network.image.request.model.dart';
import 'package:rawg/modules/future_network_image/network.image.request.queue.model.dart';
import 'package:semaphore/semaphore.dart';
import 'package:rawg/helperfiles/image.cache.helper.dart';
String cacheDirPath = "/data/data/vip.hari.rawg/cache/cached_images";
String reSizeImageDir = "/data/data/vip.hari.rawg/cache/cached_reSizeimages";
var _maxCount = 7;
final $sm = LocalSemaphore(_maxCount);
NetworkImageRequestQueue requestQueue = NetworkImageRequestQueue();
int requestId = 0;
Dio dio = Dio();

void getCachedVersionOfFile(NetworkImageRequest networkImageRequest) async {

  String uniqName = $imageCache.uniqNameFor(networkImageRequest.url);

  String dioPath = "$cacheDirPath/$uniqName";
  String reSizePath = "$reSizeImageDir/$uniqName";

  bool isCachedPathExists = await $imageCache.hasFile(uniqName);
  if (isCachedPathExists) {
    String returnPath=await $imageCache.getFile(uniqName);
    networkImageRequest.callback(returnPath);
  }

//  int tempRequestId = requestId++;
  requestQueue.push(networkImageRequest);

  await $sm.acquire();

  try {
    NetworkImageRequest networkImageRequest = requestQueue.pop();

    //  print("RequestID: ${tempRequestId} executing url from queue: ${networkImageRequest.url} name: ${networkImageRequest.name} isVisible: ${networkImageRequest.isVisible}");
    //  print("RequestID: ${tempRequestId} executed url from queue: ${networkImageRequest.url} name: ${networkImageRequest.name} isVisible: ${networkImageRequest.isVisible}");


    Response response = await dio.download(networkImageRequest.url, dioPath);

      String extension=detectExtentionFromMime(response.headers["content-type"].toString());
      dioPath +=".$extension";
      reSizePath +=".$extension";


   Directory directory=Directory(reSizeImageDir);
   directory.create(recursive:true);

    await FlutterImageCompress.compressAndGetFile(dioPath, reSizeImageDir, minHeight: 720, quality: 88, minWidth: 300,);
    File(dioPath).delete();
    networkImageRequest.callback(reSizePath);

    //  print("RequestID: ${tempRequestId} writing to file : ${networkImageRequest.url} name: ${networkImageRequest.name} isVisible: ${networkImageRequest.isVisible}");
    //  print("RequestID: ${tempRequestId} writen to file and returning url from queue: ${networkImageRequest.url} name: ${networkImageRequest.name} isVisible: ${networkImageRequest.isVisible}");

  } catch (error, st) {
    // TODO return error image from assets

  } finally {
    //  print("RequestID: ${tempRequestId} releasing lock: ${networkImageRequest.url} name: ${networkImageRequest.name} isVisible: ${networkImageRequest.isVisible}");
    await $sm.release();
    //   print("RequestID: ${tempRequestId} released lock: ${networkImageRequest.url} name: ${networkImageRequest.name} isVisible: ${networkImageRequest.isVisible}");
  }
}

Future<File> testCompressAndGetFile(File file, String targetPath) async {
  var result = await FlutterImageCompress.compressAndGetFile(
    file.absolute.path,
    targetPath,
    quality: 88,
    rotate: 180,
  );
  return result;
}

Future<String> getFileFromCache(String hash) async {
 // Directory root = Directory(cacheDirPath);
  Directory root = Directory(reSizeImageDir);
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

}

String detectExtentionFromMime(String mime) {
  String extention = extensionFromMime(mime);
  if (extention == "jpe") {
    return "jpg";
  } else {
    return extention;
  }
}


