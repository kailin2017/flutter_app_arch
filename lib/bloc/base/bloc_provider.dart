import 'package:flutter_bloc/flutter_bloc.dart';

class BaseBlocProvider<T extends StateStreamableSource<Object?>>
    extends BlocProvider<T> {
  const BaseBlocProvider(
      {super.key, required super.create, super.child, super.lazy});
}
