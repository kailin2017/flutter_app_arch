import 'package:flutter/material.dart';
import 'package:flutter_app_arch/bloc/base/bloc.dart';
import 'package:flutter_app_arch/bloc/mc/mc_bloc.dart';

import '../utils/locale_helper.dart';

class MCPage extends StatelessWidget {
  const MCPage({super.key});

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: Text(LocaleHelper().localizations(context).mcTitle),
        ),
        body: BaseBlocProvider(create: (context) => MCBloc(), child: _MCPage()),
      );
}

class _MCPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MCState();
}

class _MCState extends State<_MCPage> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MCBloc>(context).add(MCBattery());
  }

  @override
  Widget build(BuildContext context) {
    return BaseBlocBuilder<MCBloc, McState>(builder: (context, state) {
      if (state is MCBatteryResult) {
        return _MCBatteryResult(text: state.battery);
      } else {
        return _MCBatteryInitial();
      }
    });
  }
}

class _MCBatteryInitial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}

class _MCBatteryResult extends StatelessWidget {
  const _MCBatteryResult({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
