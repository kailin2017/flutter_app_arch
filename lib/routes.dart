import 'package:flutter/material.dart';
import 'package:flutter_app_arch/page/error/error_page.dart';
import 'package:flutter_app_arch/page/home_page.dart';
import 'package:url_launcher/url_launcher.dart';

enum RouteName { home, error }

extension RouteNameEx on RouteName {
  String get path {
    switch (this) {
      case RouteName.home:
        return '/home';
      case RouteName.error:
        return '/error';
    }
  }
}

class RouteHelper {
  RouteHelper._();

  factory RouteHelper() => _instance;

  static final _instance = RouteHelper._();

  var routeMap = <String, WidgetBuilder>{
    RouteName.home.path: (BuildContext context) => const HomePage(),
    RouteName.error.path: (BuildContext context) => const ErrorPage()
  };

  void replace(BuildContext context, String routeName, {Object? arguments}) {
    Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
  }

  void push(BuildContext context, String routeName, {Object? arguments}) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  void redirect(Uri uri) async {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void pop(BuildContext context) {
    Navigator.pop(context);
  }
}
