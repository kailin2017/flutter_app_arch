part of 'mc_bloc.dart';

@immutable
abstract class McState {}

class McInitial extends McState {}

class MCBatteryInitial extends McState{}

class MCBatteryResult extends McState{
  final String battery;

  MCBatteryResult(this.battery);
}