import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:rawg/helperfiles/logger.helper.dart';
import 'package:rawg/modules/future_network_image/my.image.cache.dart';
import 'package:rawg/modules/future_network_image/my.image.downloader.dart';
import 'package:rawg/modules/future_network_image/my.image.resizer.dart';
import 'package:rawg/modules/future_network_image/network.image.request.model.dart';
import 'package:rawg/modules/future_network_image/network.image.request.queue.model.dart';
import 'package:rawg/modules/future_network_image/uniq.name.generator.dart';
import 'package:semaphore/semaphore.dart';

class MyImageStore {
  final log = getLogger("MyImageStore");
  final int RESIZE_MIN_WIDTH = 600;
  static int _maxCount = 7;
  final $sm = LocalSemaphore(_maxCount);

  getLocalImagePathForUrl(NetworkImageRequest networkImageRequest) async {


    //  log.i("Request received for image: ${_networkImageRequest.url}");
    String url = networkImageRequest.url;
    final uniqName = await $uniqNameGenerator.uniqNameFor(url);
    //  log.i("Uniq name: ${networkImageRequest.name} for url: ${_networkImageRequest.url}");

    //  log.i("${networkImageRequest.name}: looking into cache for cached download");

    bool isImageExists = await $myImageCache.hasImage(uniqName);
    if (isImageExists) {
      // log.i("${networkImageRequest.name}: image file found in cache");
      String cachedImagePath = await $myImageCache.getImagePathFor(uniqName);
      networkImageRequest.callback(cachedImagePath);
      return;
    }

    $networkRequestQueue.push(networkImageRequest);
//    log.i("url added to list");
    downloadInBackground();
  }

  void downloadInBackground() async {
    try {
      await $sm.acquire();
      NetworkImageRequest selectedNetworkImageRequest = $networkRequestQueue.pop();
      final uniqName = await $uniqNameGenerator.uniqNameFor(selectedNetworkImageRequest.url);

      //    log.i("url poped from list");
      log.i(
          "${selectedNetworkImageRequest.name}: image file not found in cache. going to download $selectedNetworkImageRequest");
      String downloadedImagePath = await $myImageDownloader.downloadImage(selectedNetworkImageRequest.url);
      // log.i("${networkImageRequest.name}: downloaded image path: $downloadedImagePath");

      // log.i("${networkImageRequest.name}: going to resize downloaded image");
      String resizedImagePath = await $myImageResizer.resizeImage(downloadedImagePath, RESIZE_MIN_WIDTH);
      log.i("${selectedNetworkImageRequest.name}: resized image path: $resizedImagePath");

      //   log.i("${networkImageRequest.name}: going to cache resized image");
      String cachedImagePath = await $myImageCache.moveImageToCache(resizedImagePath, uniqName);
      log.i("${selectedNetworkImageRequest.name}: cached image path: $cachedImagePath");

//      $fileHelper.deleteFile(downloadedImagePath);

      log.i("${selectedNetworkImageRequest.name}: Going to call callback $selectedNetworkImageRequest");
      selectedNetworkImageRequest.callback(cachedImagePath);
    } catch (e) {} finally {
      $sm.release();
    }
  }
// TODO return error image from assets
}

final $myImageStore = MyImageStore();
