import 'dart:io';

import 'file:///C:/Users/Hari/StudioProjects/Rawg.IO/lib/modules/future_network_image/my.image.file.helper.dart';
import 'package:path/path.dart' as p;
import 'package:rawg/helperfiles/logger.helper.dart';
import 'package:rawg/helperfiles/string.util.dart';

class MyImageCache {
  final log=getLogger("MyImageCache");
  Future<bool> hasImage(String uniqName) async {
    String value = await $fileHelper.getFileFromCacheWithoutExtension(uniqName);

    return $stringUtil.isPresent(value);
  }

  Future<String> getImagePathFor(String uniqName) async {
    String value = await $fileHelper.getFileFromCacheWithoutExtension(uniqName);
    return value;
  }

  /**
   * input => source image path Eg: /data/data/vip.hari/cache/TEMP/syz.jpg
   * output => copy or move this file to cache dir Eg: /data/data/vip.hari/cache/CACHED_IMAGES/uniq.jpg
   * find extention from source image path
   * create cachedImagePath with cached dir and uniq name and extention
   * move the source image path to cachedImage path
   * return cached Image path
   */
  Future moveImageToCache(String sourceImagePath, String uniqName) async {
    String sourceExtension = p.extension(sourceImagePath);
  //  log.i("resized image extension $sourceExtension");
    String destinatinPath = await $fileHelper.createFileForCache(uniqName, sourceExtension);
  //  log.i("resized image destinationPath $destinatinPath");
    await File(sourceImagePath).rename(destinatinPath);
    return destinatinPath;
  }
}

final $myImageCache = MyImageCache();