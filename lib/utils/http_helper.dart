import 'package:dio/dio.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:flutter_app_arch/app/app_env_helper.dart';
import 'package:flutter_app_arch/model/http_response.dart';


class HttpHelper {
  HttpHelper._() {
    _dio.interceptors.add(dioLoggerInterceptor);
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        String token = "";
        if (token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
      onResponse: (response, handler) {
        handler.next(response);
      },
    ));
  }

  factory HttpHelper() => _instance;

  static final _instance = HttpHelper._();

  final Dio _dio = Dio(BaseOptions(
    baseUrl: AppEnvHelper().env.baseUrl,
    connectTimeout: 30000,
    receiveTimeout: 30000,
    responseType: ResponseType.json,
  ));

  Future<HttpResponse<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      var response = await _dio.get(path, queryParameters: queryParameters);
      return HttpResponse(response: response, data: response.data);
    } on DioError catch (e) {
      return HttpResponse(response: e.response, error: e);
    }
  }

  Future<HttpResponse<T>> post<T>(String path, {data}) async {
    try {
      var response = await _dio.post(path, data: data);
      return HttpResponse(response: response);
    } on DioError catch (e) {
      return HttpResponse(response: e.response, error: e);
    }
  }
}
