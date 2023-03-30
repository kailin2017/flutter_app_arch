import 'package:flutter_app_arch/app/app_env_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/prefs_helper.dart';
import 'app_env_event.dart';
import 'app_env_state.dart';
export 'app_env_event.dart';
export 'app_env_state.dart';

class AppEnvBloc extends Bloc<AppEnvEvent, AppEnvState> {
  AppEnvBloc() : super(AppEnvInitial()) {
    on<AppEnvLoad>(_load);
  }

  void _load(AppEnvLoad event, Emitter<AppEnvState> emit) async {
    await PrefsHelper().initial();
    await AppEnvHelper().initial(event.flavor);
    emit(AppEnvUpdate());
  }
}
