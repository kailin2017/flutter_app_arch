import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../routes.dart';
import 'app_bloc_state.dart';

class AppBlocProvider<T extends StateStreamableSource<Object?>>
    extends BlocProvider<T> {
  const AppBlocProvider(
      {super.key, required super.create, super.child, super.lazy});
}
