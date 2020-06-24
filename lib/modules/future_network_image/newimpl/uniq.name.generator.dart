import 'dart:convert';
import 'package:crypto/crypto.dart';

class UniqNameGenerator {
  Future<String> uniqNameFor(String url) async {

     return md5.convert(utf8.encode(url)).toString();


  }
}

final $uniqNameGenerator = UniqNameGenerator();