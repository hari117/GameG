import 'dart:async';
import 'dart:io';

import 'package:gameg/helperfiles/logger.helper.dart';
import 'package:mime_type/mime_type.dart';
import 'package:path/path.dart' as p;

import 'package:uuid/uuid.dart';

class MyImageFileHelper {
  final log = getLogger("FileHelper");
  String APP_CACHE_DIR = "/data/data/vip.hari.gameg/cache";

  String CACHE_IMAGES_DIR = "CACHED_IMAGES_DIR";
  String RESIZED_IMAGES_DIR = "RESIZED_IMAGES_DIR";
  String DOWNLOADED_IMAGES_DIR = "DOWNLOADED_IMAGES_DIR";

  Future<String> createFileForDownload({String extension}) async {
    String randomName = Uuid().v1();
    var tempFilePath = p.join(APP_CACHE_DIR, DOWNLOADED_IMAGES_DIR, randomName);
    return await _createFile(tempFilePath, extension);
  }

  Future<String> createFileForCache(String uniqName, String extension) async {
    var tempFilePath = p.join(APP_CACHE_DIR, CACHE_IMAGES_DIR, uniqName);
    return await _createFile(tempFilePath, extension);
  }

  Future<String> createFileForResize(String extension) async {
    String randomName = Uuid().v1();
    var tempFilePath = p.join(APP_CACHE_DIR, RESIZED_IMAGES_DIR, randomName);
    return await _createFile(tempFilePath, extension);
  }

  Future<String> _createFile(String filePath, String extension) async {
    if (extension != null && extension != "") {
      filePath = p.setExtension(filePath, extension);
    }
  //  log.i("creating file for $filePath");
    await File(filePath).create(recursive: true);
    return filePath;
  }

  Future deleteFile(String filePath) async {
    bool isExists = await File(filePath).exists();
    if (isExists) {
      await File(filePath).delete();
    }
  }

  Future<String> appendExtension(String filePath, String extension) async {
    String renamedPath = p.join(filePath, ".", extension);
    await File(filePath).rename(renamedPath);
    return renamedPath;
  }

  String detectExtentionFromMime(String mime) {
 //   log.i("mime extensio recived :$mime");
    String extention = extensionFromMime(mime);
    if (extention == "jpe") {
      return ".jpg";
    } else {
      return ".$extention";
    }
  }

  Future<String> getFileFromCacheWithoutExtension(String uniqName) async {
    String path = p.join(APP_CACHE_DIR, CACHE_IMAGES_DIR);
    print("the cache directory path $path");
    Directory root = Directory(path);
    List<FileSystemEntity> files = await dirContents(root);
    List<String> paths = files.map((f) => f.path).toList();
    String foundPath =
        paths.firstWhere((path) => p.basenameWithoutExtension(path) == uniqName, orElse: () => null);
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

/**
 * if file path already has extention => create new path without extention
 * if extention has dot appended remove dot Ex substring
 * join file path with extention
 * return extention
 */
//  Future<String> setExtensionToFile(String filePath, String extension) {
//    String sourceExtension = p.extension(filePath);
//    if (sourceExtension == null && sourceExtension == "") {
//      //do nothing
//    } else {
//        p.setExtension(path, extension)
//    }
//  }
}

final $fileHelper = MyImageFileHelper();
