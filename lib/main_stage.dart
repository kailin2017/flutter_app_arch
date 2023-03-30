import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/app_flavor.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const KailinApp(
    flavor: AppFlavor.stage,
  ));
}
