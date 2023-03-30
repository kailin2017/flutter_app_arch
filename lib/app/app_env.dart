import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'app_env.g.dart';

@JsonSerializable()
class AppEnv {
  final String baseUrl;

  AppEnv(this.baseUrl);

  factory AppEnv.formJson(Map<String, dynamic> json) =>
      _$ConfigEnvFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigEnvToJson(this);

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
