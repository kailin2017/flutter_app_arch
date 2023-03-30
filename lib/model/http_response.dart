import 'package:dio/dio.dart';

import 'http_redirect.dart';

class HttpResponse<T> {
  final Response? response;
  final DioError? error;
  T? data;

  HttpResponse({
    this.response,
    this.error,
    this.data,
  });

  bool get isSuccess => (response?.statusCode ?? 500) < 400;

  bool get isRedirect => response?.isRedirect ?? false;

  List<RedirectModel> get redirects => (response?.redirects ?? [])
      .map((c) => RedirectModel(c.statusCode, c.method, c.location))
      .toList();

  int get statusCode => (response?.statusCode ?? 500);

  String get statusMessage => (response?.statusMessage ?? "");
}
