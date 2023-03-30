import 'package:dio/dio.dart';

class RedirectModel extends RedirectRecord {
  RedirectModel(super.statusCode, super.method, super.location);
}
