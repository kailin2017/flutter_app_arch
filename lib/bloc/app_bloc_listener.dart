import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../routes.dart';
import 'app_bloc_state.dart';

class AppBlocListener<B extends StateStreamable<S>, S>
    extends BlocListener<B, S> {
  AppBlocListener({
    Key? key,
    required BlocWidgetListener<S> listener,
    B? bloc,
    BlocListenerCondition<S>? listenWhen,
    Widget? child,
  }) : super(
            key: key,
            child: child,
            listener: (context, state) {
              if (state is BlocHttpFailure) {
                RouteHelper().replace(context, RouteName.error.path,
                    arguments: {BlocHttpFailure.tag: state});
              } else if (state is BlocHttpRedirect) {
                RouteHelper().redirect(state.redirects.first.location);
              } else {
                listener(context, state);
              }
            },
            bloc: bloc,
            listenWhen: listenWhen);
}
