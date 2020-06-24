import 'dart:io';

import 'package:path/path.dart' as p;

class FileHelper {
  String APP_CACHE_DIR = "/data/data/vip.hari.rawg/cache";
  String TEMP_DIR = "/TEMP";

  Future<String> createTempFile(String uniqName) async {
    String tempPath =
        p.join(APP_CACHE_DIR, TEMP_DIR, uniqName); // /storage/vip.hari/cache/cached_images/fdskjkjdf
    await File(tempPath).create(recursive: true);
    return tempPath;
  }

  Future deleteTempFile(String uniqName) async {
    String tempPath = p.join(APP_CACHE_DIR, TEMP_DIR, uniqName);
    await File(tempPath).delete();
  }

//  Future delete(String );
}

final $fileHelper = FileHelper();
