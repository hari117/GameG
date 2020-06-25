import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path/path.dart' as p;
import 'package:rawg/modules/future_network_image/my.image.file.helper.dart';

class MyImageResizer {
  /**
   * input source Image Path Eg: /data/data/vip.hari/cache/TEMP/xyz.jpg
   * create temp file with extention from source file. use p.extention(source) to get extention // TODO check returned extention has dot prefix or not
   * pass source and temp file to image resizer with prefered width
   * return temp resized file
   */
  Future<String> resizeImage(String sourceImagePath, int width) async {

    String extension=p.extension(sourceImagePath);

    String tempDestinationPath= await $fileHelper.createFileForResize(extension);

    await FlutterImageCompress.compressAndGetFile(sourceImagePath, tempDestinationPath, minHeight: 720, quality: 88, minWidth: width,);

    return tempDestinationPath;

  }
}

final $myImageResizer = MyImageResizer();
