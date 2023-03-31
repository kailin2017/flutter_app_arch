import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../base/bloc.dart';

part 'mc_event.dart';
part 'mc_state.dart';

class MCBloc extends Bloc<MCEvent, McState> {
  MCBloc() : super(McInitial()) {
    on<MCBattery>(_fetch);
  }

  final _mc = const MethodChannel('kailin.flutter.dev/battery');

  void _fetch(MCBattery event, Emitter<McState> emit) async {
    emit(MCBatteryInitial());
    String batteryLevel;
    try {
      int result = await _mc.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
    emit(MCBatteryResult(batteryLevel));
  }
}
