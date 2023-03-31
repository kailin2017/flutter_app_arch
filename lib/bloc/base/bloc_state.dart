import '../../model/http_response.dart';
import '../../model/http_redirect.dart';

abstract class BlocBaseState {}

enum BlocHttpType {
  success, //200
  redirect, //300
  badRequest, //400
  unauthorized, //401
  forbidden, //403
  notFound, //404
  serverError //500
}

abstract class BlocHttpState extends BlocBaseState {
  HttpResponse get response;
  int get code;
  BlocHttpType get type;
  String get message;
}

mixin BlocHttpSuccess implements BlocHttpState {
  static const String tag = 'BlocHttpSuccess';

  @override
  int get code => response.statusCode;

  @override
  BlocHttpType get type => BlocHttpType.success;

  @override
  String get message => response.statusMessage;
}

mixin BlocHttpFailure implements BlocHttpState {
  static const String tag = 'BlocHttpFailure';

  @override
  int get code => response.statusCode;

  @override
  BlocHttpType get type {
    switch (response.statusCode) {
      case 400:
        return BlocHttpType.badRequest;
      case 401:
        return BlocHttpType.unauthorized;
      case 403:
        return BlocHttpType.forbidden;
      case 404:
        return BlocHttpType.notFound;
      default:
        return BlocHttpType.serverError;
    }
  }

  @override
  String get message => response.statusMessage;
}

mixin BlocHttpRedirect implements BlocHttpState {
  static const String tag = 'BlocHttpRedirect';

  @override
  int get code => response.statusCode;

  @override
  BlocHttpType get type => BlocHttpType.redirect;

  @override
  String get message => response.statusMessage;

  List<RedirectModel> get redirects => response.redirects;
}
