

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:gameg/helperfiles/logger.helper.dart';
import 'package:gameg/modules/future_network_image/my.image.file.helper.dart';
import 'package:path/path.dart' as p;



class MyImageDownloader {
  Dio dio = Dio();
  final log=getLogger("MyImageDownloader");
  /**
   * input => url
   * create temp file with $fileHepler. this temp file may not have extention
   * pass url and temp file to dio to download
   * once file is downloaded  detect extention
   * append extention to temp file
   * return temp file
   */
  Future<String> downloadImage(String url) async {
    String pathWithOutExtension = await $fileHelper.createFileForDownload();
  //  log.i("temp path for downloadin image without extension: $pathWithOutExtension");
    Response response = await dio.download(url, pathWithOutExtension);
    String imageExtension = $fileHelper.detectExtentionFromMime(response.headers["content-type"][0]);
   // log.i("the detected Image extension :$imageExtension");
    String pathWithExtension=p.setExtension(pathWithOutExtension,imageExtension);
    File(pathWithOutExtension).rename(pathWithExtension);
//    log.i("temp path for downloaded image with extension: $pathWithOutExtension");
    return pathWithExtension;
  }
}

final $myImageDownloader = MyImageDownloader();
