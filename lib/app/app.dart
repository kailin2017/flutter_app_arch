import 'package:flutter/material.dart';
import 'package:flutter_app_arch/app/app_flavor.dart';
import 'package:flutter_app_arch/bloc/base/bloc.dart';
import 'package:flutter_app_arch/bloc/env/app_env_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../routes.dart';
import '../utils/locale_helper.dart';

class KailinApp extends StatefulWidget {
  const KailinApp({super.key, required this.flavor});

  final AppFlavor flavor;

  @override
  State<StatefulWidget> createState() => _KailinApp(flavor);
}

class _KailinApp extends State<KailinApp> {
  _KailinApp(this.flavor);

  final _navigatorKey = GlobalKey<NavigatorState>();
  final AppFlavor flavor;

  @override
  Widget build(BuildContext context) {
    return BaseBlocProvider(
        create: (blocContext) => AppEnvBloc(),
        child: BaseBlocBuilder<AppEnvBloc, AppEnvState>(
          builder: (blocContext, state) {
            if (state is AppEnvInitial) {
              BlocProvider.of<AppEnvBloc>(blocContext).add(AppEnvLoad(flavor));
            }
            return MaterialApp(
              navigatorKey: _navigatorKey,
              onGenerateTitle: (context) =>
                  LocaleHelper().localizations(context).appName,
              debugShowCheckedModeBanner: false,
              routes: RouteHelper().routeMap,
              home: _KailinAppHome(),
              localizationsDelegates: LocaleHelper().delegates,
              localeResolutionCallback: (locale, supportLocales) {
                return LocaleHelper().ofLocale(locale?.languageCode ?? "");
              },
            );
          },
        ));
  }
}

class _KailinAppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseBlocListener<AppEnvBloc, AppEnvState>(
      listener: (context, state) async {
        if (state is AppEnvUpdate) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            RouteHelper().replace(context, RouteName.home.path);
          });
        }
      },
      child: const Center(),
    );
  }
}
