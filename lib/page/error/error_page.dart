import 'package:flutter/material.dart';

import '../../bloc/base/bloc_state.dart';
import '../../utils/locale_helper.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({super.key});

  @override
  State<StatefulWidget> createState() => _ErrorPage();
}

class _ErrorPage extends State<ErrorPage> {
  late final BlocHttpFailure _blocError;

  @override
  Widget build(BuildContext context) {
    dynamic obj = ModalRoute.of(context)?.settings.arguments;
    _blocError = obj[BlocHttpFailure.tag];
    var localizations = LocaleHelper().localizations(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.errorTitle),
      ),
      body: Column(
        children: [
          Center(
            child: Text(_blocError.code.toString()),
          ),
          Center(
            child: Text(_blocError.message.toString()),
          ),
        ],
      ),
    );
  }
}
