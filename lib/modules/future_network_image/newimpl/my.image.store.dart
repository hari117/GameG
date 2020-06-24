import 'package:rawg/modules/future_network_image/newimpl/my.image.cache.dart';
import 'package:rawg/modules/future_network_image/newimpl/my.image.downloader.dart';
import 'package:rawg/modules/future_network_image/newimpl/my.image.resizer.dart';
import 'package:rawg/modules/future_network_image/newimpl/uniq.name.generator.dart';

class MyImageStore {
  final int RESIZE_MIN_WIDTH = 600;


  Future<String> getLocalImagePathForUrl(String url) async
  {

    final uniqName = await $uniqNameGenerator.uniqNameFor(url);

    bool isImageExists = await $myImageCache.hasImage(uniqName);

    if(isImageExists)
    {

      return await $myImageCache.getImagePathFor(uniqName);

    }

    String downloadedImagePath = await $myImageDownloader.downloadImage(url);

    String resizedImagePath = await $myImageResizer.resizeImage(downloadedImagePath, RESIZE_MIN_WIDTH);


    await $myImageCache.moveImageToCache(resizedImagePath, uniqName);


  }

}
final $myImageStore = MyImageStore();
