import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;

//import 'package:image_cache_playground/semaphore.util.dart';
import 'package:path/path.dart' as p;
import 'dart:convert';
import 'package:crypto/crypto.dart';

//import 'package:mime/mime.dart';
import 'package:mime_type/mime_type.dart';
import 'package:semaphore/semaphore.dart';

String cacheDirPath = "/data/data/vip.hari.rawg/cache/cached_images";

int queueSize = 0;

var _maxCount = 10;
final $sm = LocalSemaphore(_maxCount);

Future<String> getCachedVersionOfFile(String url) async {
  String hash = generateMd5(url);
  String cachedPath = await getFileFromCache(hash);
  if (cachedPath != null) {
    print("file found from cache. returning cached path: $cachedPath");
    return cachedPath;
  }

  queueSize++;
  print("Image request added to queue: $queueSize");

  print("file not found in cache. going to download from internet");
  var _client = http.Client();
  await $sm.acquire();
  Stopwatch stopwatch = Stopwatch();

  try {
    stopwatch.start();
    var response = await _client.get(Uri.parse(url));
    String extention = detectExtentionFromMime(response.headers["content-type"]);
    String fileName = p.join(cacheDirPath, generateMd5(url));
    print("*************the filane is  $fileName ***********");
    fileName = "$fileName.$extention";
    print("*************the filane is  $fileName ***********");
    var bytes = response.bodyBytes;
    File file = File(fileName);
    await file.create(recursive: true);
    await file.writeAsBytes(bytes);
    return file.path;
  } catch (error, st) {
    // TODO return error image from assets
  } finally {
    queueSize--;
    stopwatch.stop();
    print("Image request finished. queue size: $queueSize time took to download: ${stopwatch.elapsed.inSeconds}");
    await $sm.release();
  }
  return null;
}

Future<String> getFileFromCache(String hash) async {
  Directory root = Directory(cacheDirPath);
  List<FileSystemEntity> files = await dirContents(root);
  List<String> paths = files.map((f) => f.path).toList();
  String foundPath = paths.firstWhere(
      (path) => p.basenameWithoutExtension(path) == hash,
      orElse: () => null);
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
