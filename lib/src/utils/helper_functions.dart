import 'package:flutter/services.dart';

class Helpers {
  Helpers._();

  static Future loadFromAsset<T>(String path) async {
    ByteData data = await rootBundle.load(path);

    if (T is Uint8List) {
      Uint8List list = data.buffer.asUint8List();
      return list;
    }
    return data;
  }
}
