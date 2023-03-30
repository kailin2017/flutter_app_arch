import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../routes.dart';
import '../utils/locale_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static const platform = MethodChannel('samples.flutter.dev/battery');
  String _batteryLevel = 'Unknown battery level.';

  @override
  Widget build(BuildContext context) {
    var localizations = LocaleHelper().localizations(context);
    var paddingEdgeInsets = const EdgeInsets.all(8);
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.homeTitle),
      ),
      body: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

        ],
      )),
    );
  }

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
}
