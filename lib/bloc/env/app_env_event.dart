import '../../app/app_flavor.dart';

abstract class AppEnvEvent {}

class AppEnvLoad extends AppEnvEvent {
  final AppFlavor flavor;

  AppEnvLoad(this.flavor);
}