import 'package:flutter/services.dart';

class FileHelper {

  static Future<String> loadConfig(String fileName) async{
     return await rootBundle.loadString("assets/config/$fileName");
  }
}