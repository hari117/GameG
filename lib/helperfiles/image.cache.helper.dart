import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:path/path.dart' as p;

class ImageCache {
  final String TEMP_IMG_PATH = "/data/data/vip.hari.rawg/cache/cached_images";
  final String IMG_CACHE_DIR = "/data/data/vip.hari.rawg/cache/cached_reSizeimages";

  String uniqNameFor(String url) {
    return md5.convert(utf8.encode(url)).toString();
  }

  Future<bool> hasFile(String uniqName) async {
    String path = await _getFileFromCache(uniqName);
    if (path == null || path == "") {
      return false;
    } else {
      return true;
    }
  }

  Future<String> getFile(String uniqName) async {
    String path = await _getFileFromCache(uniqName);
    return path;
  }

  /**
   * Inputs => String imageFilePath, String uniqName
   * create file with uniqName with extention in imageCache. get extention from imageFilePath
   */
  Future<String> createImageWithExtention(String uniqName, String extention) async {
    String tempPath = p.join(IMG_CACHE_DIR, uniqName, ".", extention);
    File file = File(tempPath);
    await file.create(recursive: true);
    return tempPath;
  }

  Future<String> _getFileFromCache(String hash) async {
    Directory root = Directory(IMG_CACHE_DIR);
    List<FileSystemEntity> files = await _dirContents(root);
    List<String> paths = files.map((f) => f.path).toList();
    String foundPath =
        paths.firstWhere((path) => p.basenameWithoutExtension(path) == hash, orElse: () => null);
    return foundPath;
  }

  Future<List<FileSystemEntity>> _dirContents(Directory dir) {
    var files = <FileSystemEntity>[];
    var completer = Completer<List<FileSystemEntity>>();
    var lister = dir.list(recursive: false);
    lister.listen((file) => files.add(file),
        // should also register onError
        onDone: () => completer.complete(files));
    return completer.future;
  }
}

final $imageCache = ImageCache();
