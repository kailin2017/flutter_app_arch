import 'package:flutter/material.dart';
import 'package:flutter_app_arch/app/app.dart';
import 'package:flutter_app_arch/app/app_flavor.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const KailinApp(
    flavor: AppFlavor.prod,
  ));
}
