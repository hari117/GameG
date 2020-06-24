import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mime_type/mime_type.dart';
import 'package:rawg/helperfiles/file.helper.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as p;

class ImageDownloader {
  final String APP_CACHE_DIR = "/data/data/vip.hari.rawg/cache";
  final Dio dio = Dio();

  Future<String> downloadImage(String url) async {
    String randomName = Uuid().v1();
    String tempPath = await $fileHelper.createTempFile(randomName);

    Response response = await dio.download(url, tempPath);

    String extension = _detectExtentionFromMime(response.headers["content-type"].toString());

    String fullNamePath = p.join(tempPath, ".", extension);
    await File(tempPath).rename(fullNamePath);

    return fullNamePath;
  }

  String _detectExtentionFromMime(String mime) {
    String extention = extensionFromMime(mime);
    if (extention == "jpe") {
      return "jpg";
    } else {
      return extention;
    }
  }
}
