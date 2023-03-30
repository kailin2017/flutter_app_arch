import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_app_arch/app/app_env.dart';

import '../utils/file_helper.dart';
import 'app_flavor.dart';


class AppEnvHelper {
  AppEnvHelper._();

  factory AppEnvHelper() => _instance;

  static final _instance = AppEnvHelper._();

  late AppEnv _configEnv;

  AppEnv get env => _configEnv;

  Future<void> initial(AppFlavor env) async {
    String envString = await FileHelper.loadConfig(env.path);
    _configEnv = AppEnv.formJson(jsonDecode(envString));
    debugPrint(_configEnv.toString());
  }
}
