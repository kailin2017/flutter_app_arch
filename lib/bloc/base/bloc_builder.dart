import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../routes.dart';
import 'bloc_state.dart';

class BaseBlocBuilder<B extends StateStreamable<S>, S>
    extends BlocBuilder<B, S> {
  BaseBlocBuilder({
    Key? key,
    required BlocWidgetBuilder<S> builder,
    B? bloc,
    BlocBuilderCondition<S>? buildWhen,
  }) : super(
            key: key,
            builder: (context, state) {
              if (state is BlocHttpFailure) {
                RouteHelper().replace(context, RouteName.error.path,
                    arguments: {BlocHttpFailure.tag: state});
                return const Center();
              } else if (state is BlocHttpRedirect) {
                RouteHelper().redirect(state.redirects.first.location);
                return builder(context, state);
              } else {
                return builder(context, state);
              }
            },
            bloc: bloc,
            buildWhen: buildWhen);
}
