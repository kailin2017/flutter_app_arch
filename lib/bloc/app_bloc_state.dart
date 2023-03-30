

import '../model/http_response.dart';
import '../model/http_redirect.dart';

abstract class BlocState {}

enum BlocHttpType {
  success, //200
  redirect, //300
  badRequest, //400
  unauthorized, //401
  forbidden, //403
  notFound, //404
  serverError //500
}

abstract class BlocHttpState extends BlocState {
  int get code;

  BlocHttpType get type;

  String get message;

  void setHttpModel(HttpResponse httpModel);
  //
  // bool isNotError(BuildContext context) {
  //   if (this is BlocHttpFailure) {
  //     RouteHelper().replace(context, RouteHelper.routeError,
  //         arguments: {BlocHttpFailure.tag: this});
  //     return false;
  //   } else {
  //     return true;
  //   }
  // }
}

mixin BlocHttpSuccess implements BlocHttpState {
  static const String tag = 'BlocHttpSuccess';

  late final HttpResponse _model;

  @override
  void setHttpModel(HttpResponse httpModel) {
    _model = httpModel;
  }

  @override
  int get code => _model.statusCode;

  @override
  BlocHttpType get type => BlocHttpType.success;

  @override
  String get message => _model.statusMessage;
}

mixin BlocHttpFailure implements BlocHttpState {
  static const String tag = 'BlocHttpFailure';

  late final HttpResponse _model;
  late final BlocHttpType _type;

  @override
  void setHttpModel(HttpResponse httpModel) {
    _model = httpModel;
    switch (_model.statusCode) {
      case 400:
        _type = BlocHttpType.badRequest;
        break;
      case 401:
        _type = BlocHttpType.unauthorized;
        break;
      case 403:
        _type = BlocHttpType.forbidden;
        break;
      case 404:
        _type = BlocHttpType.notFound;
        break;
      default:
        _type = BlocHttpType.serverError;
        break;
    }
  }

  @override
  int get code => _model.statusCode;

  @override
  BlocHttpType get type => _type;

  @override
  String get message => _model.statusMessage;
}

mixin BlocHttpRedirect implements BlocHttpState {
  static const String tag = 'BlocHttpRedirect';

  late final HttpResponse _model;

  @override
  void setHttpModel(HttpResponse httpModel) {
    _model = httpModel;
  }

  @override
  int get code => _model.statusCode;

  @override
  BlocHttpType get type => BlocHttpType.redirect;

  @override
  String get message => _model.statusMessage;

  List<RedirectModel> get redirects => _model.redirects;
}
